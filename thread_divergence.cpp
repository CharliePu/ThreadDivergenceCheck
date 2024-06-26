// Modified from:
// https://github.com/taylorlloyd/GPUCheck.git
#include "thread_divergence.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"

#include <unordered_map>
#include <queue>
#include <utility>
#include <vector>
#include <algorithm>
#include <iterator>

using namespace std;
using namespace llvm;

namespace ThreadDivergence
{

  bool isThreadIdxCall(llvm::StringRef name)
  {
    return name.find("_threadIdx_") != name.npos
    || name.find("_local_id_") != name.npos;
  }

  bool isBlockIdxCall(llvm::StringRef name)
  {
    return name.find("_blockIdx_") != name.npos;
  }

  bool isBarrierCall(llvm::StringRef name)
  {
    // llvm.nvvm.barrier0
    return name.find("llvm") != name.npos && name.find("barrier") != name.npos;
  }

  class ThreadDivergenceAnalysis
  {
  public:
    bool isDependent(Value *v)
    {
      return taint[v];
    }

    bool runOnFunction(Function &F)
    {

      // Initialize ourselves
      for (auto v = F.arg_begin(), e = F.arg_end(); v != e; ++v)
        taint[&*v] = false; // Kernel parameters aren't tainted

      functionTainted(F, taint);

      return false;
    }

    bool runOnModule(Module &M)
    {
      taint.clear();
      for (auto F = M.begin(), e = M.end(); F != e; ++F)
      {
        if (F->hasExactDefinition())
        {
          runOnFunction(*F);
        }
      }

      // Merge all callsite taint
      for (auto ctaint = callTaint.begin(), e = callTaint.end(); ctaint != e; ++ctaint)
      {
        for (auto t = ctaint->second.begin(), e = ctaint->second.end(); t != e; ++t)
        {
          taint[t->first] |= t->second;
        }
      }
      return false;
    }

    unordered_map<Value *, bool> taint;

  private:
    unordered_map<CallInst *, unordered_map<Value *, bool>> callTaint;

    Value *getDominatingCondition(Instruction *left, Instruction *right, DominatorTree *DT)
    {
      return getDominatingCondition(left->getParent(), right->getParent(), DT);
    }

    Value *getDominatingCondition(BasicBlock *left, BasicBlock *right, DominatorTree *DT)
    {
      BasicBlock *dom = DT->findNearestCommonDominator(left, right);

      if (dom->size() == 0)
        return nullptr;
      auto last = --(dom->end());
      if (auto B = dyn_cast<BranchInst>(&*last))
      {
        if (B->isConditional())
          return B->getCondition();
      }
      return nullptr;
    }

    bool functionTainted(Function &F, unordered_map<Value *, bool> &taint)
    {
      queue<Value *> worklist;
      DominatorTree DT;
      DT.recalculate(F);

      // Everyone gets one look
      for (auto b = F.begin(), e = F.end(); b != e; ++b)
      {
        for (auto i = b->begin(), e = b->end(); i != e; ++i)
        {
          worklist.push(&*i);
        }
      }

      while (!worklist.empty())
      {
        Value *v = worklist.front();
        worklist.pop();
        update(v, isDependent(v, taint, &DT), taint, worklist);
      }

      // Collect all the return nodes
      vector<ReturnInst *> rets;
      for (auto b = F.begin(), e = F.end(); b != e; ++b)
      {
        for (auto i = b->begin(), e = b->end(); i != e; ++i)
        {
          if (auto ret = dyn_cast<ReturnInst>(&*i))
          {
            rets.push_back(ret);
          }
        }
      }

      // If any returns are directly tainted, return that
      for (auto ret = rets.begin(), e = rets.end(); ret != e; ++ret)
      {
        if (taint[*ret])
          return true;
      }

      // If the any return is on a tainted control-flow path, return that
      for (auto l = rets.begin(), e = rets.end(); l != e; ++l)
      {
        for (auto r = rets.begin(), e = rets.end(); r != e; ++r)
        {
          if (auto cond = getDominatingCondition(*l, *r, &DT))
          {
            if (taint[cond])
              return true;
          }
        }
      }

      return false;
    }

    void update(Value *v, bool newVal, unordered_map<Value *, bool> &taint, queue<Value *> &worklist)
    {
      bool oldVal = taint[v];
      taint[v] = newVal;

      if (newVal != oldVal)
      {
        // errs() << "Update " << oldVal << "=>" << newVal << " for ";
        // v->dump();
        // errs() << "\n";
        // Update any users
        for (auto user = v->user_begin(), e = v->user_end(); user != e; ++user)
        {
          worklist.push(*user);
        }

        // Update any direct addresses
        if (auto S = dyn_cast<StoreInst>(v))
        {
          worklist.push(S->getPointerOperand());
        }
      }
    }

    bool isDependent(Value *v, unordered_map<Value *, bool> &taint, DominatorTree *DT)
    {
      // If this value uses any tainted values, it's tainted
      if (auto user = dyn_cast<User>(v))
      {
        for (auto op = user->op_begin(), e = user->op_end(); op != e; ++op)
        {
          if (taint[op->get()])
            return true;
        }
      }

      // If this value is the address of a tainted store, it's tainted
      for (auto u = v->use_begin(), e = v->use_end(); u != e; ++u)
      {
        if (auto S = dyn_cast<StoreInst>(u->getUser()))
        {
          if (taint[S])
          {
            return true;
          }
        }
      }

      // Special-case PHI Nodes
      if (auto PHI = dyn_cast<PHINode>(v))
      {
        // If the incoming path was selected on a control-flow dependent condition, then we're dependent
        for (auto l = PHI->block_begin(), e = PHI->block_end(); l != e; ++l)
        {
          for (auto r = PHI->block_begin(), e = PHI->block_end(); r != e; ++r)
          {
            if (auto C = getDominatingCondition(*l, *r, DT))
            {
              if (taint[C])
              {
                return true;
              }
            }
          }
        }
      }

      // Calls may directly reference the threadIdx
      if (auto CI = dyn_cast<CallInst>(v))
      {
        if (auto F = CI->getCalledFunction())
        {
          // is ThreadIdx Call
          if (isThreadIdxCall(F->getName()))
          {
            return true;
          }

          // is BlockIdx Call
          if (isBlockIdxCall(F->getName()))
          {
            return true;
          }

          // Not an intrinsic, but a real function call
          if (!F->empty())
          {
            // Get the taint-map corresponding to this callsite
            unordered_map<Value *, bool> ctaint = callTaint[CI];
            auto arg = CI->arg_begin();

            // Propagate args to formals
            for (auto param = F->arg_begin(), e = F->arg_end(); param != e; ++param)
            {
              ctaint[&*param] = taint[arg->getUser()];
              ++arg;
            }

            // Solve for the called function
            return functionTainted(*F, ctaint);
          }
        }

        // Indirect call, abandon all hope here
      }

      return false;
    }
  };
}

ThreadDivergenceStats check_thread_divergence(Module *m)
{
  ThreadDivergence::ThreadDivergenceAnalysis tda;
  tda.runOnModule(*m);

  ThreadDivergenceStats stats;
  stats.taintedValueTypes = {"load", "store"};

  for (auto &F : *m)
  {
    if (!F.hasExactDefinition())
      continue;

    dbgs() << "Function \"" << F.getName() << "\":\n";
    FunctionStats funcStats{};


    // Count tainted values by instruction type
    auto taintMap = tda.taint;

    // Count the number of branches
    for (auto &bb : F)
    {
      auto terminator = bb.getTerminator();
      if (auto branch = dyn_cast<BranchInst>(terminator))
      {
        if (branch->isConditional())
        {
          auto condition = branch->getCondition();
          if (tda.isDependent(condition))
          {
            dbgs() << "\tThread divergence at terminator: ";
            branch->dump();
            funcStats.divBranchesCount++;
          }
          funcStats.totalBranchesCount++;
        }
      }

      for (auto &inst : bb)
      {
        if (tda.isDependent(&inst))
        {      
          if (inst.getOpcode() == Instruction::Call)
          {
            CallInst &call = cast<CallInst>(inst);
            Function *F = call.getCalledFunction();
            // Handle threadIdx calls
            if (F && ThreadDivergence::isThreadIdxCall(F->getName()))
            {
              funcStats.threadIdCallsCount++;
              continue;
            }
            // Handle blockIdx calls
            if (F && ThreadDivergence::isBlockIdxCall(F->getName()))
            {
              funcStats.blockIdCallsCount++;
              continue;
            }
            // Handle synchronization calls
            if (F && ThreadDivergence::isBarrierCall(F->getName()))
            {
              funcStats.barrierCount++;
              continue;
            }
          }

          string instType = inst.getOpcodeName();
          funcStats.taintCount[instType]++;
          funcStats.totalInstructionsCount++;
          stats.taintedValueTypes.insert(instType);
        }
      }
    }

    funcStats.totalInstructionsCount = F.getInstructionCount();
    stats.functionStats[F.getName().str()] = funcStats;

    dbgs() << "\tNumber of branches: " << funcStats.totalBranchesCount << "\n";
    dbgs() << "\tNumber of divergent branches: " << funcStats.divBranchesCount << "\n";
    dbgs() << "\tNumber of instructions: " << funcStats.totalInstructionsCount << "\n";
    dbgs() << "\tNumber of threadIdx calls: " << funcStats.threadIdCallsCount << "\n";
    dbgs() << "\tNumber of blockIdx calls: " << funcStats.blockIdCallsCount << "\n";
    dbgs() << "\tNumber of synchronization instructions: " << funcStats.barrierCount << "\n";
    dbgs() << "\tNumber of divergent loads: " << funcStats.taintCount["load"] << "\n";
    dbgs() << "\tNumber of divergent stores: " << funcStats.taintCount["store"] << "\n";
    dbgs() << "\tDivergent(thread-idx tainted) values by parent instruction type(excluding threadIdx calls):\n";
    for (auto t = funcStats.taintCount.begin(), e = funcStats.taintCount.end(); t != e; ++t)
    {
      dbgs() << "\t\t" << t->first << ": " << t->second << "\n";
    }
    dbgs() << "\n";
  }

  dbgs()<<"End of thread divergence check\n";

  return stats;
}
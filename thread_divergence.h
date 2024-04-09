#include "llvm/IR/Module.h"
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <string>

struct FunctionStats {
    int totalBranchesCount;
    int divBranchesCount;
    int totalInstructionsCount;
    int threadIdCallsCount;
    int blockIdCallsCount;
    int barrierCount;
    std::unordered_map<std::string, int> taintCount;
};

struct ThreadDivergenceStats {
    std::unordered_map<std::string, FunctionStats> functionStats;
    std::unordered_set<std::string> taintedValueTypes;
};

ThreadDivergenceStats check_thread_divergence(llvm::Module *program);
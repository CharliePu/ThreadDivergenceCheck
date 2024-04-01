#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/Support/FileSystem.h>
#include "thread_divergence.h"

#include <fstream>

#include <assert.h>

using namespace llvm;

int main(int argc, char **argv) {
  if (argc < 2) {
      errs() << "Usage: " << argv[0] << " <IR file>\n";
      return 1;
  }

  LLVMContext context;

  SMDiagnostic err;
  std::unique_ptr<Module> program = parseIRFile(argv[1], err, context);
  if (!program) {
      err.print(argv[0], errs());
      return 1;
  }


  check_thread_divergence(program.get());

  return 0;
}

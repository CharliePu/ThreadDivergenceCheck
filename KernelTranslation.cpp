#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/Support/FileSystem.h>
#include "thread_divergence.h"

#include <filesystem>
#include <fstream>
#include <string>
#include <iostream>

#include <assert.h>

using namespace llvm;
namespace fs = std::filesystem;

int main(int argc, char **argv)
{
  if (argc < 2)
  {
    errs() << "Usage: " << argv[0] << " <IR file>\n";
    return 1;
  }

  LLVMContext context;

  SMDiagnostic err;
  std::unique_ptr<Module> program = parseIRFile(argv[1], err, context);
  if (!program)
  {
    err.print(argv[0], errs());
    return 1;
  }

  auto stats = check_thread_divergence(program.get());

  fs::path inputFilePath(argv[1]);
  fs::path inputDirectory = inputFilePath.parent_path();
  std::string baseFilename = inputFilePath.stem().string();

  // Create csv file directory
  fs::path csvDirectory = inputDirectory / "csv";
  try
  {
    fs::create_directories(csvDirectory);
  }
  catch (const fs::filesystem_error &e)
  {
    std::cerr << "Error creating directory: " << e.what() << std::endl;
    return 1;
  }

  fs::path csvFilePath = csvDirectory / (baseFilename + ".csv");
  std::ofstream csvFile(csvFilePath);

  // Prepare header
  std::vector<std::string> header = {
      "Function",
      "Total Branches",
      "Divergent Branches",
      "Total Instructions",
      "Thread ID Calls",
      "Block ID Calls",
      "Barrier Count"};
  header.push_back("Divergent load");
  header.push_back("Divergent store");
  for (auto &taintedType : stats.taintedValueTypes)
  {
    if (taintedType == "load" || taintedType == "store")
      continue;
    header.push_back("Divergent " + taintedType);
  }

  // Write header
  for (auto &h : header)
  {
    csvFile << h << ",";
  }
  csvFile << "\n";

  // Write body
  for (auto &f : stats.functionStats)
  {
    csvFile << f.first << ",";
    csvFile << f.second.totalBranchesCount << ",";
    csvFile << f.second.divBranchesCount << ",";
    csvFile << f.second.totalInstructionsCount << ",";
    csvFile << f.second.threadIdCallsCount << ",";
    csvFile << f.second.blockIdCallsCount << ",";
    csvFile << f.second.barrierCount << ",";
    csvFile << f.second.taintCount["load"] << ",";
    csvFile << f.second.taintCount["store"] << ",";
    for (auto &taintedType : stats.taintedValueTypes)
    {
      if (taintedType == "load" || taintedType == "store")
        continue;
      csvFile << f.second.taintCount[taintedType] << ",";
    }
    csvFile << "\n";
  }

  return 0;
}

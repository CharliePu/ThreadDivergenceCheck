cmake_minimum_required(VERSION 3.8)
project(TDC)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

enable_language(CXX)

# Add our tool's executable and link against the LLVM libraries
add_executable(TDC KernelTranslation.cpp thread_divergence.cpp)

# Find out which libraries correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs support core irreader)

# Link against LLVM libraries
target_link_libraries(TDC ${llvm_libs})

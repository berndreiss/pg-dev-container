cmake_minimum_required(VERSION 3.13)
project(MyChecker)

find_package(LLVM REQUIRED CONFIG)
find_package(Clang REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_library(MyChecker SHARED MyChecker.cpp)

target_link_libraries(MyChecker
  clang-cpp
)



cmake_minimum_required(VERSION 3.10)
project(TestProject C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

add_executable(TestProject src/intTest.c)

target_include_directories(TestProject PUBLIC /usr/local/src/postgresql/src/include)

set(CMAKE_C_CLANG_TIDY "clang-tidy;-checks=*")


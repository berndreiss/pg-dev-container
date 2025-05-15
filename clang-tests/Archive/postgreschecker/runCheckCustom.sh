#!/bin/bash
./build.sh
~/repos/llvm-project/release/bin/clang --analyze -Xclang -load -Xclang ./build/libpostgres.so -Xanalyzer -analyzer-checker=postgres.MyChecker $1

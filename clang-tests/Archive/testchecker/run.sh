#!/bin/bash
set -e

export CC=clang
export CXX=clang++

# Baue Plugin
rm -rf build
mkdir build
cd build
cmake ..
make -j$(nproc)
cd ..

# Führe Checker aus
clang++ test.cpp \
  --analyze \
  -Xanalyzer -load -Xanalyzer ./build/libMyChecker.so \
  -Xanalyzer -analyzer-checker=example.MyChecker

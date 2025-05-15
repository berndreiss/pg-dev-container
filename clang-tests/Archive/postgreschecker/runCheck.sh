#!/bin/bash
#./build.sh
#clang -fsyntax-only -fplugin=./build/libpostgres.so $1
cd ~/repos/llvm-project/config/ && ./install.sh
cd -
~/repos/llvm-project/release/bin/clang --analyze -Xanalyzer -analyzer-checker=optin.postgres.Postgres-Checker test.c

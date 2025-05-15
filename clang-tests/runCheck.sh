#!/bin/bash
$LLVM_HOME/install/bin/clang --analyze -Xanalyzer -analyzer-checker=postgres.Postgres-Checker test.c

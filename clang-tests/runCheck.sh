#!/bin/bash
../llvm-project/release/bin/clang --analyze -Xanalyzer -analyzer-checker=postgres.Postgres-Checker test.c

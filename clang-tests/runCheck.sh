#!/bin/bash
../llvm-project-v19.1.7//release/bin/clang --analyze -Xanalyzer -analyzer-checker=postgres.Postgres-Checker test.c

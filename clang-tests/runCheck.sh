#!/bin/bash
clang-19 --analyze \
	-Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so \
	-Xanalyzer -analyzer-checker=postgres.PostgresChecker \
	test.c

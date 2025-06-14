#!/bin/bash
clear
clang-19 --analyze \
	-Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so \
	-Xanalyzer -analyzer-checker="postgres.PostgresChecker" \
	test.c 
echo $?
	#-Xanalyzer -analyzer-disable-all-checks \

#!/bin/bash
clear
includes="$includes -I$(pg_config --includedir-server)"
includes="$includes -I$(pg_config --includedir)"

clang-19 --analyze \
	$includes \
	-Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so \
	-Xanalyzer -analyzer-checker="postgres.PostgresChecker" \
	$1
echo $?
	#-Xanalyzer -analyzer-disable-all-checks \

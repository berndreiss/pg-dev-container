#!/bin/bash
cd /home/vscode/pg_ladybug
git pull
cmake -S . -B build
make -C build
sudo make -C build install
cd -
clang-19 --analyze \
	-Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so \
	-Xanalyzer -analyzer-checker=postgres.PostgresChecker \
	test.c

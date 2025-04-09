#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 -analyzer-checker=<checker> <source_file>"
    exit 1
fi

# Run clang with the provided arguments and include paths
clang -cc1 -analyze \
    -I /usr/lib/llvm-14/lib/clang/14.0.6/include/ \
    -I /usr/local/include \
    -I /usr/include/x86_64-linux-gnu \
    -I /usr/include/ \
    "$@"

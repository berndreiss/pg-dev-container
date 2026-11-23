#!/bin/bash

set -euo pipefail

if [ ! -d "$1" ]; then
    echo "First argument not a valid directory!"
    exit 1;
fi

if [ ! -d "$2" ]; then
    echo "Second argument not a valid directory!"
    exit 2;
fi

for file in $(ls $1); do
    if [[ -f "$1/$file" && -f "$2/$file" && "$file" == *functionsonly* ]]; then
        echo "DIFF $file"
        diff <(cat "$1/$file" | cut -d, -f1-2 | sort | uniq) <(cat "$2/$file" | cut -d, -f1-2 | sort | uniq)
    fi
done


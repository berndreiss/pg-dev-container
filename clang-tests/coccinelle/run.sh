#!/bin/bash
rm -f bugs/tmp/*
rm -f bugs/useafterfree.bug
spatch --sp-file stuart.cocci ../test.c -very_quiet 2> /dev/null

while IFS= read -r line; do
  spatch --sp-file $line ../test.c -very_quiet 2> /dev/null

done < bugs/useafterfree.bug

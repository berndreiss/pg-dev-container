#/bin/bash

RESULTS_PATH="../results/all.out"
spatch --sp-file templates/templategetthemall.cocci /usr/local/src/postgresql > $RESULTS_PATH
cat $RESULTS_PATH | grep ">" | cut -d "," -f 1 | sort | uniq -d > ../results/allDuplicate.out
while IFS= read -r line; do
  functionname=$(echo $line | cut -d "," -f 1)
  if grep -Fxq "$functionname" ../results/allDuplicate.out; then
    echo "$line" >> ../results/duplicatesFree.out
  fi
done < ../results/free/functionnamesonlywithoutstatic.out

while IFS= read -r line; do
  functionname=$(echo $line | cut -d "," -f 1)
  if grep -Fxq "$functionname" ../results/allDuplicate.out; then
    echo "$line" >> ../results/duplicatesRealloc.out
  fi
done < ../results/realloc/functionnamesonlywithoutstatic.out


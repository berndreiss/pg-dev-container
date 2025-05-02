#!/bin/bash

strictless(){

   if [ -f ../results/$1withoutstrict.out ]; then
      rm ../results/$1withoutstrict.out
   fi


   grep "^>" ../results/$1/results.out | sort | uniq > ../results/A
   grep "^>" ../results/$1strict/results.out | sort | uniq > ../results/B

   comm -23 ../results/A ../results/B > ../results/COMM

   while IFS= read -r line; do
      cat ../results/$1/results.out | grep -A 3 "$line" >> ../results/$1withoutstrict.out
   done < ../results/COMM
   rm ../results/A ../results/B ../results/COMM
}

strictless free
strictless realloc

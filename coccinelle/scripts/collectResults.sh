#!/bin/bash

RESULTS=../results

collect(){
grep "^>" $RESULTS/$1strict/results.out | sort | uniq > $RESULTS/$1strict/functionnamesonly.out
grep "^>" $RESULTS/$1signature/results.out | sort | uniq > $RESULTS/$1signature/functionnamesonly.out


comm -23 $RESULTS/$1strict/functionnamesonly.out $RESULTS/$1signature/functionnamesonly.out > strictwithoutsignature.tmp

comm -23 $RESULTS/$1signature/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > signaturewithoutstrict.tmp

grep -A 3 -F -f strictwithoutsignature.tmp $RESULTS/$1/results.out > $RESULTS/$1strictwithouthsignature.out
grep -A 3 -F -f signaturewithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1signaturewithouthstrict.out

cat $RESULTS/$1/results.out | grep ">" | sort | uniq -d > doubled.tmp
grep -A 3 -F -f doubled.tmp $RESULTS/$1/results.out > $RESULTS/$1doubled.out

rm *.tmp
}

collect free
collect realloc

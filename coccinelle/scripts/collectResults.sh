#!/bin/bash

RESULTS=../results

collect(){

STATS_FILE=$RESULTS/$1stats.out

grep "^>" $RESULTS/$1/results.out | sort | uniq > $RESULTS/$1/functionnamesonly.out
grep "^>" $RESULTS/$1strict/results.out | sort | uniq > $RESULTS/$1strict/functionnamesonly.out
grep "^>" $RESULTS/$1signature/results.out | sort | uniq > $RESULTS/$1signature/functionnamesonly.out

comm -23 $RESULTS/$1/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > allwithoutstrict.tmp
comm -23 $RESULTS/$1strict/functionnamesonly.out $RESULTS/$1signature/functionnamesonly.out > strictwithoutsignature.tmp
comm -23 $RESULTS/$1signature/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > signaturewithoutstrict.tmp

grep -A 3 -F -f allwithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrict.out
grep -A 3 -F -f strictwithoutsignature.tmp $RESULTS/$1/results.out > $RESULTS/$1strictwithouthsignature.out
grep -A 3 -F -f signaturewithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1signaturewithouthstrict.out

cat $RESULTS/$1/results.out | grep ">" | sort | uniq -d > doubled.tmp
grep -A 3 -F -f doubled.tmp $RESULTS/$1/results.out > $RESULTS/$1doubled.out

./samereturnAWK.sh $RESULTS/$1/results.out > $RESULTS/$1samereturn.out

echo "$1" > $STATS_FILE
echo "ALL:" >> $STATS_FILE
grep "^>" $RESULTS/$1/results.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1strict/results.out | sort | uniq | wc -l >> $STATS_FILE
echo "SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1signature/results.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT WITHOUT SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1strictwithouthsignature.out | sort | uniq | wc -l >> $STATS_FILE
echo "SIGNATURE WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1signaturewithouthstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "DOUBLE:" >> $STATS_FILE
grep "^>" $RESULTS/$1doubled.out | sort | uniq | wc -l >> $STATS_FILE
echo "SAME RETURN:" >> $STATS_FILE
grep "^>" $RESULTS/$1samereturn.out | sort | uniq | wc -l >> $STATS_FILE
echo "" >> $STATS_FILE

cat $STATS_FILE



rm *.tmp
}

collect free
collect realloc

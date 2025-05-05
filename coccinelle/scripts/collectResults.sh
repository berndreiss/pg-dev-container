#!/bin/bash

RESULTS=../results

reduceRealloc(){

awk 'NR==FNR { blacklist[$0]; next }
{
  split($0, parts, ",");
  if (!(parts[2] in blacklist)) print
}' typesExcluded $RESULTS/realloc$1/functionnamesonly.out > realloc.tmp && mv realloc.tmp $RESULTS/realloc$1/functionnamesonly.out
}

collect(){

STATS_FILE=$RESULTS/$1stats.out

grep "^>" $RESULTS/$1/results.out | sort | uniq > $RESULTS/$1/functionnamesonly.out
grep "^>" $RESULTS/$1strict/results.out | sort | uniq > $RESULTS/$1strict/functionnamesonly.out
grep "^>" $RESULTS/$1signature/results.out | sort | uniq > $RESULTS/$1signature/functionnamesonly.out
grep "^>" $RESULTS/$1dependent/results.out | cut -d ',' -f 1,2 | sort | uniq > $RESULTS/$1dependent/functionnamesonly.out

if [[ "$1" == "realloc" ]]; then
   reduceRealloc 
   reduceRealloc strict
   reduceRealloc signature
fi

comm -23 $RESULTS/$1/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out | sort | uniq > allwithoutstrict.tmp
comm -23 allwithoutstrict.tmp $RESULTS/$1dependent/functionnamesonly.out > allwithoutstrictdependent.tmp
comm -23 $RESULTS/$1strict/functionnamesonly.out $RESULTS/$1signature/functionnamesonly.out > strictwithoutsignature.tmp
comm -23 $RESULTS/$1signature/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > signaturewithoutstrict.tmp

grep -A 3 -F -f allwithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrict.out
grep -A 3 -F -f allwithoutstrictdependent.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrictdependent.out
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
echo "ALL WITHOUT STRICT AND DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutstrictdependent.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT WITHOUT SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1strictwithouthsignature.out | sort | uniq | wc -l >> $STATS_FILE
echo "SIGNATURE WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1signaturewithouthstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "DOUBLE:" >> $STATS_FILE
grep "^>" $RESULTS/$1doubled.out | sort | uniq | wc -l >> $STATS_FILE
echo "SAME RETURN:" >> $STATS_FILE
grep "^>" $RESULTS/$1samereturn.out | sort | uniq | wc -l >> $STATS_FILE
echo "DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1dependent/results.out | sort | uniq | wc -l >> $STATS_FILE
echo "" >> $STATS_FILE

cat $STATS_FILE



rm *.tmp
}

collect free
collect realloc

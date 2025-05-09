#!/bin/bash
#COLLECT AND PREPARE THE RESULTS OF THE COCCINELLE SCRIPTS
#THIS SCRIPT ASSUMES THAT make HAS BEEN CALLED AND ALL THE NEEDED DIRECTORIES EXIST

RESULTS=../results

#THIS FUNCTION SANITIZES THE OUPUT OF THE REALLOC SCRIPTS SINCE SOME TYPES
#LIKE int OR size_t HAVE BEEN ADDED TOO
reduceRealloc(){

awk 'NR==FNR { blacklist[$0]; next }
{
  split($0, parts, ",");
  if (!(parts[2] in blacklist)) print
}' exceptions/types.excluded $RESULTS/realloc$1/functionnamesonly.out > realloc.tmp && mv realloc.tmp $RESULTS/realloc$1/functionnamesonly.out
}

#COLLECT THE RESULTS FOR THE PASSED FUNCTION (free/realloc)
collect(){

#DEFINE FILE STATS WILL BE PRINTED TO
STATS_FILE=$RESULTS/$1stats.out

#REDUCE RESULTS TO FUNCTION NAMES + TYPE ONLY AND ELIMINATE DUPLICATES
grep "^>" $RESULTS/$1/results.out | sort | uniq > $RESULTS/$1/functionnamesonly.out
grep "^>" $RESULTS/$1strict/results.out | sort | uniq > $RESULTS/$1strict/functionnamesonly.out
grep "^>" $RESULTS/$1signature/results.out | sort | uniq > $RESULTS/$1signature/functionnamesonly.out
grep "^>" $RESULTS/$1dependent/results.out | cut -d ',' -f 1,2 | sort | uniq > $RESULTS/$1dependent/functionnamesonly.out
grep "^>" $RESULTS/$1ereport/results.out | sort | uniq > $RESULTS/$1ereport/functionnamesonly.out

#SANITIZE REALLOC RESULTS
if [[ "$1" == "realloc" ]]; then
   reduceRealloc 
   reduceRealloc strict
   reduceRealloc signature
   reduceRealloc ereport
fi

#RETRIEVE ALL FUNCTIONS WITH THAT RETURN THE SAME TYPE AS THEY FREE/REALLOC
grep "^>" $RESULTS/$1/results.out > allfuncs.tmp
grep "^Ret. Type:" $RESULTS/$1/results.out | cut -d ':' -f 2 | cut -c2- > alltypes.tmp

COUNTER=0
OVERALL=$(cat allfuncs.tmp | wc -l)

while [[ $COUNTER -lt $OVERALL ]]; do
   COUNTER=$(( COUNTER + 1 ))
   if [[ $(sed -n "${COUNTER}p" allfuncs.tmp | cut -d ',' -f 2) == $(sed -n "${COUNTER}p" alltypes.tmp) ]]; then
      sed -n "${COUNTER}p" allfuncs.tmp >> samereturn.tmp
   fi
done

cat samereturn.tmp | sort | uniq > $RESULTS/$1samereturnfunctionnamesonly.out
grep -A 3 -F -f samereturn.tmp $RESULTS/$1/results.out > $RESULTS/$1samereturn.out

#RETRIEVE ALL FUNCTIONS THAT ARE NOT SUPPOSED TO BE REASSIGNED
comm -23 $RESULTS/$1/functionnamesonly.out $RESULTS/$1samereturnfunctionnamesonly.out | sort | uniq > allwithoutreassigned.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE NOT REASSINGED OR STRICT
comm -23 allwithoutreassigned.tmp $RESULTS/$1strict/functionnamesonly.out | sort | uniq > allwithoutreassignedstrict.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE NOT REASSIGNED, STRICT AND DEPENDENT
comm -23 allwithoutreassignedstrict.tmp $RESULTS/$1dependent/functionnamesonly.out > allwithoutreassignedstrictdependent.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE NOT REASSIGNED, STRICT, DEPENDENT, AND EREPORT
comm -23 allwithoutreassignedstrictdependent.tmp $RESULTS/$1ereport/functionnamesonly.out > allwithoutreassignedstrictdependentereport.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE STRICT BUT DO NOT HAVE THE TYPICAL SIGNATURE
comm -23 $RESULTS/$1strict/functionnamesonly.out $RESULTS/$1signature/functionnamesonly.out > strictwithoutsignature.tmp
#RETRIEVE ALL FUNCTIONS THAT HAVE THE TYPICAL SIGNATURE BUT ARE NOT STRICT
comm -23 $RESULTS/$1signature/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > signaturewithoutstrict.tmp

#EXPAND ABOVE RESULTS TO INCLUDE ALL INFORMATION (NOT ONLY FUNCTION NAME AND TYPE)
grep -A 3 -F -f allwithoutreassigned.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutreassigned.out
grep -A 3 -F -f allwithoutreassignedstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutreassignedstrict.out
grep -A 3 -F -f allwithoutreassignedstrictdependent.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutreassignedstrictdependent.out
grep -A 3 -F -f allwithoutreassignedstrictdependentereport.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutreassignedstrictdependentereport.out
grep -A 3 -F -f strictwithoutsignature.tmp $RESULTS/$1/results.out > $RESULTS/$1strictwithouthsignature.out
grep -A 3 -F -f signaturewithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1signaturewithouthstrict.out

#GET ALL FUNCTIONS THAT APPEAR MORE THAN ONCE IN THE RESULTS
cat $RESULTS/$1/results.out | grep ">" | sort | uniq -d > doubled.tmp
grep -A 3 -F -f doubled.tmp $RESULTS/$1/results.out > $RESULTS/$1doubled.out

#PRINT STATS TO THE STATS_FILE
echo "$1" > $STATS_FILE
echo "ALL:" >> $STATS_FILE
grep "^>" $RESULTS/$1/functionnamesonly.out | wc -l >> $STATS_FILE
echo "SAME RETURN:" >> $STATS_FILE
grep "^>" $RESULTS/$1samereturn.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1strict/functionnamesonly.out | wc -l >> $STATS_FILE
echo "DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1dependent/functionnamesonly.out | wc -l >> $STATS_FILE
echo "SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1signature/functionnamesonly.out | wc -l >> $STATS_FILE
echo "ALL WITHOUT REASSIGNED:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutreassigned.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT REASSIGNED AND STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutreassignedstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT REASSIGNED, STRICT, AND DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutreassignedstrictdependent.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutreassignedstrictdependentereport.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT WITHOUT SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1strictwithouthsignature.out | sort | uniq | wc -l >> $STATS_FILE
echo "SIGNATURE WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1signaturewithouthstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "DOUBLE:" >> $STATS_FILE
grep "^>" $RESULTS/$1doubled.out | sort | uniq | wc -l >> $STATS_FILE
echo "EREPORT:" >> $STATS_FILE
grep "^>" $RESULTS/$1ereport/functionnamesonly.out | wc -l >> $STATS_FILE
echo "" >> $STATS_FILE

#PRINT STATS TO THE OUTPUT
cat $STATS_FILE

#CLEAN UP
rm *.tmp
}

#ACTUALLY RUN THE SCRIPT
collect free
collect realloc

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

#RETRIEVE ALL FUNCTIONS THAT ARE NOT STRICT
comm -23 $RESULTS/$1/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out | sort | uniq > allwithoutstrict.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE NOT STRICT AND DEPENDENT
comm -23 allwithoutstrict.tmp $RESULTS/$1dependent/functionnamesonly.out > allwithoutstrictdependent.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE NOT STRICT, DEPENDENT, AND EREPORT
comm -23 allwithoutstrictdependent.tmp $RESULTS/$1ereport/functionnamesonly.out > allwithoutstrictdependentereport.tmp
#RETRIEVE ALL FUNCTIONS THAT ARE STRICT BUT DO NOT HAVE THE TYPICAL SIGNATURE
comm -23 $RESULTS/$1strict/functionnamesonly.out $RESULTS/$1signature/functionnamesonly.out > strictwithoutsignature.tmp
#RETRIEVE ALL FUNCTIONS THAT HAVE THE TYPICAL SIGNATURE BUT ARE NOT STRICT
comm -23 $RESULTS/$1signature/functionnamesonly.out $RESULTS/$1strict/functionnamesonly.out > signaturewithoutstrict.tmp

#EXPAND ABOVE RESULTS TO INCLUDE ALL INFORMATION (NOT ONLY FUNCTION NAME AND TYPE)
grep -A 3 -F -f allwithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrict.out
grep -A 3 -F -f allwithoutstrictdependent.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrictdependent.out
grep -A 3 -F -f allwithoutstrictdependentereport.tmp $RESULTS/$1/results.out > $RESULTS/$1allwithoutstrictdependentereport.out
grep -A 3 -F -f strictwithoutsignature.tmp $RESULTS/$1/results.out > $RESULTS/$1strictwithouthsignature.out
grep -A 3 -F -f signaturewithoutstrict.tmp $RESULTS/$1/results.out > $RESULTS/$1signaturewithouthstrict.out

#GET ALL FUNCTIONS THAT APPEAR MORE THAN ONCE IN THE RESULTS
cat $RESULTS/$1/results.out | grep ">" | sort | uniq -d > doubled.tmp
grep -A 3 -F -f doubled.tmp $RESULTS/$1/results.out > $RESULTS/$1doubled.out

#RETRIEVE ALL FUNCTIONS WITH THAT RETURN THE SAME TYPE AS THEY FREE/REALLOC
awk '
    /^>/ {
        split($0, a, ",")
        t1 = a[2]
        gsub(/^ +| +$/, "", t1)  # Trim spaces
        types[t1] = $0
    }

    # Lines starting with Ret. T and type after ": "
    /^Ret\. T/ {
        split($0, a, ": ")
        if (length(a) < 2) next
        t2 = a[2]
        gsub(/^ +| +$/, "", t2)  # Trim spaces
        if (t2 in types) {
            print types[t2]
            print $0
        }
    }
' $RESULTS/$1/results.out $1 | grep "^>" | sort | uniq > $RESULTS/$1samereturn.out

#PRINT STATS TO THE STATS_FILE
echo "$1" > $STATS_FILE
echo "ALL:" >> $STATS_FILE
grep "^>" $RESULTS/$1/functionnamesonly.out | wc -l >> $STATS_FILE
echo "STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1strict/functionnamesonly.out | wc -l >> $STATS_FILE
echo "SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1signature/functionnamesonly.out | wc -l >> $STATS_FILE
echo "ALL WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT STRICT AND DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutstrictdependent.out | sort | uniq | wc -l >> $STATS_FILE
echo "ALL WITHOUT STRICT, DEPENDENT, AND EREPORT:" >> $STATS_FILE
grep "^>" $RESULTS/$1allwithoutstrictdependentereport.out | sort | uniq | wc -l >> $STATS_FILE
echo "STRICT WITHOUT SIGNATURE:" >> $STATS_FILE
grep "^>" $RESULTS/$1strictwithouthsignature.out | sort | uniq | wc -l >> $STATS_FILE
echo "SIGNATURE WITHOUT STRICT:" >> $STATS_FILE
grep "^>" $RESULTS/$1signaturewithouthstrict.out | sort | uniq | wc -l >> $STATS_FILE
echo "DOUBLE:" >> $STATS_FILE
grep "^>" $RESULTS/$1doubled.out | sort | uniq | wc -l >> $STATS_FILE
echo "SAME RETURN:" >> $STATS_FILE
grep "^>" $RESULTS/$1samereturn.out | sort | uniq | wc -l >> $STATS_FILE
echo "DEPENDENT:" >> $STATS_FILE
grep "^>" $RESULTS/$1dependent/functionnamesonly.out | wc -l >> $STATS_FILE
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

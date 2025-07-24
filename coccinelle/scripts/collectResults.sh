#!/bin/bash
#COLLECT AND PREPARE THE RESULTS OF THE COCCINELLE SCRIPTS
#THIS SCRIPT ASSUMES THAT make HAS BEEN CALLED AND ALL THE NEEDED DIRECTORIES EXIST

RESULTS=../results
COLLECTED=$RESULTS/collected
PRINT_LINES=2
STRICT=C1
DEPENDENT=C2
#ERROR=C3
ARBITRARY=C3
REASSIGN=C4

if [[ -d $COLLECTED ]]; then
   rm -rf $COLLECTED
fi

mkdir $COLLECTED

#THIS FUNCTION SANITIZES THE OUPUT OF THE REALLOC SCRIPTS SINCE SOME TYPES
#LIKE int OR size_t HAVE BEEN ADDED TOO
reduceRealloc(){

awk 'NR==FNR { blacklist[$0]; next }
{
  split($0, parts, ",");
  if (!(parts[2] in blacklist)) print
}' exceptions/types.excluded \
   $RESULTS/realloc$1/functionnamesonly.out > realloc.tmp && \
   mv realloc.tmp $RESULTS/realloc$1/functionnamesonly.out
}

#COLLECT THE RESULTS FOR THE PASSED FUNCTION (free/realloc)
collect(){

   #CREATE CUSTOM DIRECTORIES FOR FUNCTIONS WITH SAME RETURN TYPE 
   #AND ARBITRARY FUNCTIONS
   if [[ -d $RESULTS/$1arbitrary ]]; then
      rm -rf $RESULTS/$1arbitrary
   fi

   if [[ -d $RESULTS/$1samereturn ]]; then
      rm -rf $RESULTS/$1samereturn
   fi

   if [[ -d $RESULTS/$1boolreturn ]]; then
      rm -rf $RESULTS/$1boolreturn
   fi
   mkdir $RESULTS/$1arbitrary
   mkdir $RESULTS/$1samereturn
   mkdir $RESULTS/$1boolreturn

   #DEFINE FILE STATS WILL BE PRINTED TO
   STATS_FILE=$COLLECTED/stats_$1.out

   #REDUCE RESULTS TO FUNCTION NAMES + TYPE 
   # + FILE ONLY AND ELIMINATE DUPLICATES
   grep "^>" $RESULTS/$1/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1/functionnamesonly.out
   grep "^>" $RESULTS/$1static/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1static/functionnamesonly.out
   grep "^>" $RESULTS/$1strict/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1strict/functionnamesonly.out
   grep "^>" $RESULTS/$1signature/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1signature/functionnamesonly.out
   grep "^>" $RESULTS/$1dependent/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1dependent/functionnamesonly.out
   grep "^>" $RESULTS/$1double/results.out | cut -d ':' -f 1 | \
     sort | uniq > $RESULTS/$1double/functionnamesonly.out

   #SANITIZE REALLOC RESULTS -> REMOVES ANY SIZE, int, ETC TYPES...
   if [[ "$1" == "realloc" ]]; then
      reduceRealloc 
      reduceRealloc static
      reduceRealloc strict
      reduceRealloc dependent
      reduceRealloc signature
      reduceRealloc double
   fi
   
   #REMOVE STATIC FUNCTIONS FROM RESULTS
   comm -23 $RESULTS/$1/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1/functionnamesonlywithoutstatic.out
   comm -23 $RESULTS/$1strict/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1strict/functionnamesonlywithoutstatic.out
   comm -23 $RESULTS/$1signature/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1signature/functionnamesonlywithoutstatic.out
   comm -23 $RESULTS/$1dependent/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1dependent/functionnamesonlywithoutstatic.out
   comm -23 $RESULTS/$1double/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1double/functionnamesonlywithoutstatic.out

   #RETRIEVE ALL FUNCTIONS WITH THAT RETURN THE SAME TYPE AS THEY FREE/REALLOC
   # -> WE CREATE A FILE WITH ALL FUNCTION NAMES + TYPE + FILE NAME 
   #    AND ANOTHER ONE WITH RETURN WITH RETURN TYPES ONLY
   # -> FOR EVERY LINE IN BOTH FILES, IF THE TYPE CORRESPONDS TO THE RETURN TYPE
   #    WE PRINT THE FUNCTIONS TO samereturn.tmp
   grep "^>" $RESULTS/$1/results.out > allfuncs.tmp
   grep "^Ret. Type:" $RESULTS/$1/results.out | cut -d ':' -f 2 \
                                              |cut -c2- > alltypes.tmp

   COUNTER=0
   OVERALL=$(cat allfuncs.tmp | wc -l)

   while [[ $COUNTER -lt $OVERALL ]]; do
      COUNTER=$(( COUNTER + 1 ))
      type=$(sed -n "${COUNTER}p" alltypes.tmp)
      if [[ "$type" == $(sed -n "${COUNTER}p" allfuncs.tmp \
            | cut -d ',' -f 2) ]]; then
          sed -n "${COUNTER}p" allfuncs.tmp >> samereturn.tmp
      else if [[ "$type" == "bool" ]]; then
              if [[ -f exceptions/$1boolreturn.exclude ]]; then
                  #REMOVE EXECPTIONS (ONLY INCLUDE FILE NAME AND 
                  #ESCAPE SPECIAL CHARACTERS)
                  if grep -q "$(sed -n "${COUNTER}p" allfuncs.tmp | cut -d ':' -f 1 \
                    | sed 's/[[\.*^$()+?{|]/\\&/g')" exceptions/$1boolreturn.exclude; \
                  then
                      continue
                  fi
              fi
              sed -n "${COUNTER}p" allfuncs.tmp >> boolreturn.tmp
          fi
      fi

   done

   #ADD MANUALLY ADDED
   if [[ -f exceptions/$1samereturn.add ]]; then
       cat exceptions/$1samereturn.add >> samereturn.tmp
   fi
   if [[ -f exceptions/$1boolreturn.add ]]; then
       cat exceptions/$1boolreturn.add >> boolreturn.tmp
   fi

   #GET RID OF DUPLICATES    
   cat samereturn.tmp | cut -d ':' -f 1 | sort | uniq \
     > $RESULTS/$1samereturn/functionnamesonly.out
   cat boolreturn.tmp | cut -d ':' -f 1 | sort | uniq \
     > $RESULTS/$1boolreturn/functionnamesonly.out

   #SANITIZE REALLOC RESULTS
   if [[ "$1" == "realloc" ]]; then
      reduceRealloc samereturn
      reduceRealloc boolreturn
   fi

   #REMOVE STATIC
   comm -23 $RESULTS/$1samereturn/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1samereturn/functionnamesonlywithoutstatic.out
   comm -23 $RESULTS/$1boolreturn/functionnamesonly.out \
     $RESULTS/$1static/functionnamesonly.out > tmp
   mv tmp $RESULTS/$1boolreturn/functionnamesonlywithoutstatic.out

   #PRINT FUNCTIONS WITH INFORMATION
   grep -A $PRINT_LINES -F -f \
     $RESULTS/$1samereturn/functionnamesonlywithoutstatic.out \
     $RESULTS/$1/results.out > $COLLECTED/${REASSIGN}_$1.out

   #REDUCE OVER FUNCTION AND EXTRACT CATEGORIES 1-3
   grep -A $PRINT_LINES -F -f \
     $RESULTS/$1strict/functionnamesonlywithoutstatic.out \
     $RESULTS/$1/results.out > $COLLECTED/${STRICT}_$1.out
   grep -A $PRINT_LINES -F -f \
     $RESULTS/$1dependent/functionnamesonlywithoutstatic.out \
     $RESULTS/$1/results.out > $COLLECTED/${DEPENDENT}_$1.out
   
   comm -23 $RESULTS/$1/functionnamesonlywithoutstatic.out \
     $RESULTS/$1strict/functionnamesonly.out | sort \
     | uniq > allwithoutstaticstrict.tmp
   comm -23 allwithoutstaticstrict.tmp \
     $RESULTS/$1dependent/functionnamesonly.out | sort \
     | uniq > allwithoutstaticstrictdependent.tmp

   #EXPAND ABOVE RESULTS TO INCLUDE ALL INFORMATION (NOT ONLY FUNCTION NAME AND TYPE)
   cat allwithoutstaticstrictdependent.tmp | sort \
     | uniq > $RESULTS/$1arbitrary/functionnamesonly.out
   cp $RESULTS/$1arbitrary/functionnamesonly.out \
     $COLLECTED/${ARBITRARY}_$1_functionsonly.out

   #SANITIZE REALLOC RESULTS
   if [[ "$1" == "realloc" ]]; then
      reduceRealloc arbitrary
   fi

   #PRINT FUNCTIONS WITH INFORMATION
   grep -A $PRINT_LINES -F -f $RESULTS/$1arbitrary/functionnamesonly.out \
     $RESULTS/$1/results.out > $RESULTS/$1arbitrary/results.out
   cp $RESULTS/$1arbitrary/results.out $COLLECTED/${ARBITRARY}_$1.out

   #RETRIEVE FULL FUNCTION NAMES ONLY WITH ALL INFORMATION FOR COLLECTED
   grep "^>" $COLLECTED/${REASSIGN}_$1.out | sort | uniq \
     > $COLLECTED/${REASSIGN}_$1_functionsonly.out
   grep "^>" $COLLECTED/${STRICT}_$1.out | sort | uniq \
     > $COLLECTED/${STRICT}_$1_functionsonly.out
   grep "^>" $COLLECTED/${DEPENDENT}_$1.out | sort | uniq \
     > $COLLECTED/${DEPENDENT}_$1_functionsonly.out
   grep "^>" $COLLECTED/${ARBITRARY}_$1.out | sort | uniq \
     > $COLLECTED/${ARBITRARY}_$1_functionsonly.out

   #PRINT STATS TO THE STATS_FILE
   echo "$1" > $STATS_FILE
   echo "ALL:" >> $STATS_FILE
   grep "^>" $RESULTS/$1/functionnamesonly.out | wc -l >> $STATS_FILE
   echo "ALL WITHOUT STATIC:" >> $STATS_FILE
   grep "^>" $RESULTS/$1/functionnamesonlywithoutstatic.out | sort | uniq \
     | wc -l >> $STATS_FILE
   echo "SAME RETURN:" >> $STATS_FILE
   grep "^>" $RESULTS/$1samereturn/functionnamesonlywithoutstatic.out | cut -d ':' -f 1 \
     | wc -l >> $STATS_FILE
   echo "BOOL RETURN:" >> $STATS_FILE
   grep "^>" $RESULTS/$1boolreturn/functionnamesonlywithoutstatic.out | cut -d ':' -f 1 \
     | wc -l >> $STATS_FILE
   echo "STRICT:" >> $STATS_FILE
   grep "^>" $COLLECTED/${STRICT}_$1.out | cut -d ':' -f 1 | sort | uniq \
     | wc -l >> $STATS_FILE
   echo "DEPENDENT:" >> $STATS_FILE
   grep "^>" $COLLECTED/${DEPENDENT}_$1.out | cut -d ':' -f 1 | sort | uniq \
     | wc -l >> $STATS_FILE
   echo "ARBITRARY:" >> $STATS_FILE
   grep "^>" $RESULTS/$1arbitrary/functionnamesonly.out | wc -l >> $STATS_FILE

   #PRINT STATS TO THE OUTPUT
   cat $STATS_FILE

   #RETRIEVE THE INDEXES OF PARAMETERS
   ./getArgumentPosition.sh free C1 &> /dev/null;
   ./getArgumentPosition.sh free C3  &> /dev/null;
   ./getArgumentPosition.sh realloc C1  &> /dev/null;
   ./getArgumentPosition.sh realloc C3  &> /dev/null;

   #CLEAN UP
   rm *.tmp
}

#ACTUALLY RUN THE SCRIPT
collect free
collect realloc

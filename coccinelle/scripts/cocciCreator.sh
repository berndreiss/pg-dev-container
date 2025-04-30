#!/bin/bash


if [ $# -lt 1 ]; then
   echo "Please pass a directory or file name to be processed."
   exit 0
fi


#DEFINE PATHS AND PARAMETERS
ITERATION=0
RESULTS_FILE_NAME=results
RESULTS_FILE_EXT=out
IT_PREFIX=iteration_
RESULTS_PATH=../results/$2$3
RESULTS_FILE=$RESULTS_PATH/$RESULTS_FILE_NAME.$RESULTS_FILE_EXT
TMP_PATH=tmp
PRINTED_LINES=3
COCCI_ADDITION=$3

if [ -d $TMP_PATH ]; then
   rm -rf $TMP_PATH
fi

if [ -d $RESULTS_PATH ]; then
   echo "Results directory already exists."
   exit 0
fi

#CREATE DIRECTORIES
mkdir  $RESULTS_PATH
mkdir  $TMP_PATH

#FUNCTION THAT CREATES A COCCI SCRIPT THAT CHECKS FOR ALL FUNCTION
#NAMES PASSED TO IT IN THE TMP_PATH AS $ITERATION.cocci
createScript(){
   counter=0
   for arg in "$@"
   do

   fname=$(echo "$arg" | cut -d',' -f1)
   ftype=$(echo "$arg" | cut -d',' -f2 | xargs)

   if [ "$ftype" = "long" ]; then
      continue
   fi

   if [[ "$ftype" == *"size"* ]]; then
      continue
   fi

   if [ "$ftype" = "Size" ]; then
      continue
   fi
   
   pythonType=$ftype

   if [ "$ftype" = "void*" ]; then
      pythonType="{t}"
      ftype="t2"
   fi

   echo "
@func$counter $COCCI_ADDITION@
type t1, t2;
identifier f, i;
position p;

@@
t1 f(..., $ftype i, ...) {
   ...
   $fname@p(..., i, ...)
   ...
}

@script:python@
f << func$counter.f;
p << func$counter.p;
t << func$counter.t2;
rt << func$counter.t1;

@@
print(f\">{f},$pythonType\")
print(p[0].file + \":\" + p[0].line + \":\" + p[0].column)
print(f\"Used: $fname\")
print(f\"Ret. Type: {rt}\")

   " >> $TMP_PATH/$ITERATION.cocci
   counter=$((counter+1))
   done
}

#CREATE THE RESULTS FILE IF IT DOES NOT EXIST
if [ ! -f $RESULTS_FILE ]; then
   touch $RESULTS_FILE
fi

#WE KEEP TRACK OF FUNCTIONS FOUND IN THE PREVIOUS ITERATION IN
#THE FILE 'functionsLastIteration'
#PASS INITIAL FUNCTION NAMES FOR 'ITERATION -1'
echo ">$2,void *" >> $TMP_PATH/functionsLastIteration

#LOGGING
echo "STARTING -> $1"
START_OVERALL=$(date +%s)

#KEEP ITERATING WHILE FILE functionsLastIteration EXISTS
while [ -f $TMP_PATH/functionsLastIteration ]; do
   
   #LOGGING
   START=$(date +%s)
   echo "########## ITERATION $ITERATION ##########"

   #PATH AND FILE FOR RESULTS OF ITERATION
   IT_RESULTS_PATH=$RESULTS_PATH/$IT_PREFIX$ITERATION
   IT_RESULTS_FILE=$IT_RESULTS_PATH/$RESULTS_FILE_NAME.$RESULTS_FILE_EXT
   mkdir -p $IT_RESULTS_PATH

   #LOG FUNCTIONS EXAMINED IN THIS ITERATION
   cp $TMP_PATH/functionsLastIteration $IT_RESULTS_PATH/functionsExamined.txt
   
   #GET THE FUNCTION NAMES TO EXAMINE AND REMOVE functionsLastIteration
   functionNames=$(grep "^>" $TMP_PATH/functionsLastIteration | cut -c2- | tr -d ' ' | tr '\n' ' ')
   rm $TMP_PATH/functionsLastIteration

   #CREATE THE COCCINELLE SCRIPT AND RUN IT
   createScript $functionNames
   spatch --sp-file $TMP_PATH/$ITERATION.cocci $1 >> $IT_RESULTS_FILE

   #GET ALL FUNCTION NAMES FROM THE RESULTS
   grep '>' $IT_RESULTS_FILE | while IFS= read -r line; do 
      #IF THEY HAVE NOT BEEN FOUND BEFORE, ADD THEM TO THE OVERALL RESULTS
      #AND EXAMINE THE FUNCTION WITH COCCINELLE IN THE NEXT ITERATION
      if ! grep -Fxq "$line" $RESULTS_FILE; then 
         grep -Fx -A $PRINTED_LINES "$line" $IT_RESULTS_FILE >> $RESULTS_FILE; 
         echo "$line" >> $TMP_PATH/functionsLastIteration; 
      fi;   
   done

   ITERATION=$((ITERATION+1))

   #LOGGING
   END=$(date +%s)
   ELAPSED=$(( END - START ))
   echo "#################################"
   echo "TIME PASSED: ${ELAPSED} SECONDS"
done

#LOGGING
END_OVERALL=$(date +%s)
ELAPSED_OVERALL=$(( END_OVERALL - START_OVERALL ))
ELAPSED_MINUTES=$(( ELAPSED_OVERALL / 60 ))
ELAPSED_SECONDS_REMAINING=$(( ELAPSED_OVERALL - ELAPSED_MINUTES * 60 ))

echo "#################################"
echo "DONE"
echo "NUMBER OF ITERATIONS: $ITERATION"
echo "TIME PASSED OVERALL: $ELAPSED_MINUTES MINUTES $ELAPSED_SECONDS_REMAINING SECONDS"

#CLEAN UP
rm -rf tmp

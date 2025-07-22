#!/bin/bash

#THIS SCRIPT CREATES COCCI SCRIPTS THAT RECURSIVELY SEARCH THE
#PROVIDED CODE BASE FOR PATTERNS AND ACCEPTS THE FOLLOWING PARAMETERS:
#  
#  $1: THE CODE BASE
#  $2: THE INTIAL FUNCTION TO BE EXAMINED
#  $3: THE TEMPLATE TO BE USED
#
#RESULTS WILL BE SAVED IN THE DEDICATED DIRECTORY DEFINED BELOW
#FOR EACH ITERATION A SEPARATE SUB DIRECTORY IS CREATED

if [ $# -lt 1 ]; then
   echo "Please pass a directory or file name to be processed."
   exit 0
fi


#DEFINE PATHS AND PARAMETERS
ITERATION=0
CODE_BASE=$1
FUNCTION=$2
TEMPLATE=$3
RESULTS_FILE_NAME=results.out
IT_PREFIX=iteration_
RESULTS=../results
RESULTS_PATH=$RESULTS/$FUNCTION$TEMPLATE
RESULTS_FILE=$RESULTS_PATH/$RESULTS_FILE_NAME
TMP_PATH=tmp
PRINTED_LINES=2
MANUALLY_ADDED=exceptions/$FUNCTION$TEMPLATE.add
MANUALLY_EXCLUDED=exceptions/$FUNCTION$TEMPLATE.exclude
MANUALLY_EXCLUDED_ALL=exceptions/${FUNCTION}all.exclude
SCRIPTS_CREATED=0

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

#FUNCTION THAT CREATES A COCCI SCRIPT THAT CHECKS FOR ALL FUNCTION/TYPE
#NAMES PASSED TO IT IN THE TMP_PATH AS $ITERATION.cocci
createScripts(){
   #COUNTER ADDED TO FUNCTION NAMES IN RULES TO BE UNAMBIGUOUS
   counter=0

   #ITERATE OVER FUNCTIONS
   for arg in "$@"
   do

   #RETRIEVE AND SANITIZE FUNCTION AND TYPE NAMES
   fname=$(echo "$arg" | cut -d',' -f1)
   ftype=$(echo "$arg" | cut -d',' -f2)

   #PREVENT TRYING TO ACCESS FIELDS OF char* AND char**
   if [[ "$ftype" == "char*" && "$TEMPLATE" == "dependent" ]]; then
      continue;
   fi
   if [[ "$ftype" == "char**" && "$TEMPLATE" == "dependent" ]]; then
      continue;
   fi

   #IGNORE 'UNFREEABLE' TYPES -> THESE ARE ONLY ADDED IN REALLOC
   if [ "$ftype" = "constint" ]; then
      continue
   fi
   if [ "$ftype" = "long" ]; then
      continue
   fi
   if [ "$ftype" = "size_t" ]; then
      continue
   fi
   if [ "$ftype" = "yy_size_t" ]; then
      continue
   fi
   if [ "$ftype" = "yyscan_t" ]; then
      continue
   fi
   if [ "$ftype" = "Size" ]; then
      continue
   fi
   
   #EXPAND COMPRESSED TYPES
   if [[ "$ftype" == "struct"* ]]; then
      ftype=$(echo $ftype | sed "s/struct/struct /")
   fi
   if [[ "$ftype" == *"*"* ]]; then
      ftype="$(echo "$ftype" | sed 's/*/ */')"
   fi
   
   #PASS WILD CARD TO PYTHON SCRIPT IN THE COCCI FILE IF 
   #TYPE='void *', TYPE OTHERWISE
   pythonType=$ftype
   if [ "$ftype" = "void *" ]; then
      pythonType="{t}"
      ftype="t"
    else
      ftype="\"$ftype\""
   fi

   #GET THE TEMPLATE -> THE IF CONDITION CHECKS, WHETHER
   #THERE IS A FUNCTION SPECIFIC TEMPLATE (I.E. FOR SIGNATURE)
   TEMPLATE_FILE=templates/template$TEMPLATE.cocci
   if [ -f templates/template$FUNCTION$TEMPLATE.cocci ]; then
      TEMPLATE_FILE=templates/template$FUNCTION$TEMPLATE.cocci
   fi

   #REPLACE THE PLACEHOLDERS WITH FUNCTION/TYPE NAMES
   cat $TEMPLATE_FILE \
      | sed -e "s/__FUNCTION__/$fname/g" \
            -e "s/__CHECKTYPE__/$ftype/g" \
            -e "s/__PRINTTYPE__/$pythonType/g" \
            >> $TMP_PATH/$ITERATION$counter.cocci

   counter=$((counter+1))
   done
   SCRIPTS_CREATED=$counter
}

#CREATE THE RESULTS FILE IF IT DOES NOT EXIST
if [ ! -f $RESULTS_FILE ]; then
   touch $RESULTS_FILE
fi

#WE KEEP TRACK OF FUNCTIONS FOUND IN THE PREVIOUS ITERATION IN
#THE FILE 'functionsLastIteration'
#PASS INITIAL FUNCTION NAMES FOR 'ITERATION -1'
if [[ "$TEMPLATE" == "dependent" || "$TEMPLATE" == "ereport" || "$TEMPLATE" == "double" || "$TEMPLATE" == "static" ]]; then
  grep "^>" $RESULTS/$FUNCTION/$RESULTS_FILE_NAME | sort | uniq >> $TMP_PATH/functionsLastIteration
fi

echo ">$FUNCTION,void *" >> $TMP_PATH/functionsLastIteration

#RETRIEVE FUNCTIONS TO MANUALLY ADD IF FILE EXISTS
if [ -f $MANUALLY_ADDED ]; then
   if [[ "$TEMPLATE" == "dependent" ]]; then 
      cat $MANUALLY_ADDED | cut -d ',' -f 1,2,3 | sort | uniq > added.tmp
      grep -A $PRINTED_LINES -F -f added.tmp $RESULTS/$FUNCTION/$RESULTS_FILE_NAME >> $RESULTS_FILE
      awk -F ',' 'NR==FNR {key = $1 FS $2; map[key] = $0; next} {print (map[$0] ? map[$0] : $0)}' $MANUALLY_ADDED $RESULTS_FILE > out.tmp
      mv out.tmp $RESULTS_FILE
   else 
      grep -A $PRINTED_LINES -F -f $MANUALLY_ADDED $RESULTS/$FUNCTION/$RESULTS_FILE_NAME >> $RESULTS_FILE; 
   fi
fi

#LOGGING
echo "STARTING -> $CODE_BASE"
START_OVERALL=$(date +%s)

#KEEP ITERATING WHILE FILE functionsLastIteration EXISTS
while [ -f $TMP_PATH/functionsLastIteration ]; do
   
   #WE'VE ALREADY LOOKED AT ALL FUNCTIONS THERE ARE
   if [[ "$TEMPLATE" == "dependent" || "$TEMPLATE" == "static" ]]; then
     if [ $ITERATION -gt 0 ]; then
       break 
     fi
   fi
   
   #LOGGING
   START=$(date +%s)
   echo "########## ITERATION $ITERATION ##########"

   #PATH AND FILE FOR RESULTS OF ITERATION
   IT_RESULTS_PATH=$RESULTS_PATH/$IT_PREFIX$ITERATION
   IT_RESULTS_FILE=$IT_RESULTS_PATH/$RESULTS_FILE_NAME
   mkdir -p $IT_RESULTS_PATH

   #LOG FUNCTIONS EXAMINED IN THIS ITERATION
   cp $TMP_PATH/functionsLastIteration $IT_RESULTS_PATH/functionsExamined.txt
   
   #GET THE FUNCTION NAMES TO EXAMINE AND REMOVE functionsLastIteration
   functionNames=$(grep "^>" $TMP_PATH/functionsLastIteration | cut -c2- | tr -d ' ' | tr '\n' ' ')
   rm $TMP_PATH/functionsLastIteration

   #CREATE THE COCCINELLE SCRIPTS (SPLIT INTO SINGLE FILES TO AVOID STACK OVERFLOW)
   createScripts $functionNames
   
   #RUN SCRIPTS
   for i in $(seq 0 $((SCRIPTS_CREATED-1)));
   do
     echo "### Function $((i+1)) of $SCRIPTS_CREATED ($FUNCTION $TEMPLATE iteration $ITERATION) ###" 
      spatch --sp-file $TMP_PATH/$ITERATION$i.cocci $CODE_BASE >> $IT_RESULTS_FILE
   done

   #GET ALL FUNCTION NAMES FROM THE RESULTS
   grep '>' $IT_RESULTS_FILE | while IFS= read -r line; do
      
      #GET FUCNTION WITHOUT EXACT POSITION IN THE FILE
      line_file_only=$(echo $line | cut -d ':' -f 1)
      #EXCLUDE FUNCTIONS TO BE EXCLUDED
      if [ -f $MANUALLY_EXCLUDED ]; then
        if grep -Fxq "${line_file_only}" "$MANUALLY_EXCLUDED"; then
          continue;
        fi
      fi
      #EXCLUDE FUNCTIONS TO BE EXCLUDED FOR ALL TEMPLATES
      if [ -f $MANUALLY_EXCLUDED_ALL ]; then
        if grep -Fxq "${line_file_only}" "$MANUALLY_EXCLUDED_ALL"; then
          continue;
        fi
      fi

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

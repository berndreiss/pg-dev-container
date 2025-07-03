#!/bin/bash

#THIS SCRIPT CREATES COCCI SCRIPTS THAT RECURSIVELY SEARCH THE
#PROVIDED CODE BASE FOR PATTERNS AND ACCEPTS THE FOLLOWING PARAMETERS:
#  
#  $1: THE CODE BASE
#  $2: THE INTIAL FUNCTION TO BE EXAMINED
#  $3: THE PROTOTYPE TO BE USED
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
PROTOTYPE=$3
RESULTS_FILE_NAME=results.out
IT_PREFIX=iteration_
RESULTS=../results
RESULTS_PATH=$RESULTS/$FUNCTION$PROTOTYPE
RESULTS_FILE=$RESULTS_PATH/$RESULTS_FILE_NAME
TMP_PATH=tmp
PRINTED_LINES=2
MANUALLY_ADDED=exceptions/$FUNCTION$PROTOTYPE.add
MANUALLY_EXCLUDED=exceptions/$FUNCTION$PROTOTYPE.exclude

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
createScript(){
   #COUNTER ADDED TO FUNCTION NAMES IN RULES TO BE UNAMBIGUOUS
   counter=0

   #ITERATE OVER FUNCTIONS
   for arg in "$@"
   do

   #RETRIEVE AND SANITIZE FUNCTION AND TYPE NAMES
   fname=$(echo "$arg" | cut -d',' -f1)
   ftype=$(echo "$arg" | cut -d',' -f2)

   #PREVENT TRYING TO ACCESS FIELDS OF char* AND char**
   if [[ "$ftype" == "char*" && "$PROTOTYPE" == "dependent" ]]; then
      continue;
   fi
   if [[ "$ftype" == "char**" && "$PROTOTYPE" == "dependent" ]]; then
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

   #GET THE PROTOFILE -> THE IF CONDITION CHECKS, WHETHER
   #THERE IS A FUNCTION SPECIFIC PROTOTYPE (I.E. FOR SIGNATURE)
   PROTO_FILE=prototypes/proto$PROTOTYPE.cocci
   if [ -f prototypes/proto$FUNCTION$PROTOTYPE.cocci ]; then
      PROTO_FILE=prototypes/proto$FUNCTION$PROTOTYPE.cocci
   fi

   #REPLACE THE PLACEHOLDERS WITH FUNCTION/TYPE NAMES
   cat $PROTO_FILE \
      | sed -e "s/__METAFUNCTION__/$fname$counter/g" \
            -e "s/__FUNCTION__/$fname/g" \
            -e "s/__TYPE__/$ftype/g" \
            -e "s/__PYTHONTYPE__/$pythonType/g" \
            >> $TMP_PATH/$ITERATION.cocci

   #FOR DEPENDENT ADD STRUCT LIKE ACCESS IF THE TYPE IS NOT A POINTER
   #ALLOWS FOR STATEMENTS LIKE if (B.a) IN THE COCCI SCRIPTS
   if [[ ! "$ftype" == *"*"* && "$PROTOTYPE" == "dependent" ]]; then
      cat prototypes/protodependentstruct.cocci \
         | sed -e "s/__METAFUNCTION__/$fname$counter/g" \
               -e "s/__FUNCTION__/$fname/g" \
               -e "s/__TYPE__/$ftype/g" \
               -e "s/__PYTHONTYPE__/$pythonType/g" \
               >> $TMP_PATH/$ITERATION.cocci
   fi

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
if [[ "$PROTOTYPE" == "dependent" || "$PROTOTYPE" == "ereport" || "$PROTOTYPE" == "double" || "$PROTOTYPE" == "static" ]]; then
  grep "^>" $RESULTS/$FUNCTION/$RESULTS_FILE_NAME | sort | uniq >> $TMP_PATH/functionsLastIteration
fi

echo ">$FUNCTION,void *" >> $TMP_PATH/functionsLastIteration

#RETRIEVE FUNCTIONS TO MANUALLY EXCLUDE IF FILE EXISTS
if [ -f $MANUALLY_EXCLUDED ]; then
   EXCLUDED=$(cat $MANUALLY_EXCLUDED)
fi

#RETRIEVE FUNCTIONS TO MANUALLY ADD IF FILE EXISTS
if [ -f $MANUALLY_ADDED ]; then
   if [[ "$PROTOTYPE" == "dependent" ]]; then 
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

   #CREATE THE COCCINELLE SCRIPT AND RUN IT
   createScript $functionNames
   spatch --sp-file $TMP_PATH/$ITERATION.cocci $CODE_BASE >> $IT_RESULTS_FILE

   #GET ALL FUNCTION NAMES FROM THE RESULTS
   grep '>' $IT_RESULTS_FILE | while IFS= read -r line; do
      
      if [[ "$EXCLUDED" == *"$line"* ]]; then continue; fi

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

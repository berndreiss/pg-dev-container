#/bin/bash

if [ ! -d "../results/$1" ]; then
  echo "results/$1 does not exist: run make cocci instead!"
  exit 1 
fi

if [ ! -f "../results/$1/results.out" ]; then
  echo "Data file does not exist: run make cocci instead!"
  exit 1 
fi

#DEFINE RELEVANT FILE PATHS
LOG_FILE=../results/$1/results.log
TEMP=temp.tmp
TEMP_1=temp1.tmp
STATS_FILE=../results/$1/stats.out
OUT_FILE=../results/$1/results.out
OUT_FUNCTIONS=../results/$1/function_names_only.out
OUT_REDUCED=../results/$1_reduced.out
EXCLUDE_FILE=exclude.txt

#START WITH A CLEAN SLATE: REMOVE THE STATS FILE IF IT EXISTS
rm -f $STATS_FILE

#FUNCTION TO REMOVE FUNCTIONS WITH KEYWORD FROM THE DATA POOL
#ALSO REMOVES THE FUNCTION NAMES WITH THE FIRST LETTER CAPITALIZED
#USAGE: REMOVE "KEYWORD"
remove(){
  #GET CAPITALIZED VERSION OF THE KEYWORD
  CAP="$(tr '[:lower:]' '[:upper:]' <<< "${1:0:1}")${1:1}"
  #REMOVE MATCHING FUNCTIONS FROM THE temp FILE
  mv $TEMP $TEMP_1
  cat $TEMP_1 | grep -v $1 | grep -v $CAP | grep ">" > $TEMP
  #OUTPUT STATS
  echo "Without '$1':" >> $LOG_FILE
  COUNT=$(cat $TEMP | wc -l)
  echo $COUNT >> $LOG_FILE
  echo "$1 & $COUNT" >> $STATS_FILE
}

#OUTPUT OVERALL STATS
echo "Coccinelle found:" >> $LOG_FILE
COUNT=$(cat $OUT_FILE | grep ">" | wc -l)
echo $COUNT >> $LOG_FILE
echo "all & $COUNT" >> $STATS_FILE 

#INITIALIZE TEMPORARY FILE
cp $OUT_FILE $TEMP

#REMOVE KEYWORDS
remove "free"
remove "destroy"
remove "delete"
remove "close"
remove "destruct"
remove "realloc"
remove "resize"
remove "repalloc"
remove "dealloc"
remove "close"
remove "release"
remove "detach"

#EXCLUDE FUNCTIONS IN EXCLUDE_FILE
grep -Fv -f $EXCLUDE_FILE $TEMP > $OUT_FUNCTIONS
#RETRIEVE RELEVANT ENTRIES IN OUT_FILE AND PRINT IT TO OUT_REDUCED
grep -A 4 -F -f $OUT_FUNCTIONS $OUT_FILE > $OUT_REDUCED

#OUTPUT STATS
echo "Without methods in exclude.txt" >> $LOG_FILE
COUNT=$(cat $OUT_FUNCTIONS | wc -l)
echo $COUNT >> $LOG_FILE
echo "excluded & $COUNT" >> $STATS_FILE 

#OVERWRITE THE REDUCED SET OF FUNCTIONS IN THE OUT_FUNCTIONS FILE 
#WITH ALL INITIALLY FOUND FUNCTIONS
cat $OUT_FILE | grep ">" > $OUT_FUNCTIONS

#PRINT THE LOG FILE
cat $LOG_FILE

#CLEAN UP
rm $TEMP $TEMP_1



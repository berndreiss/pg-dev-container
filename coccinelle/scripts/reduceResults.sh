#/bin/bash

if [ ! -d "../results/$1" ]; then
  echo "results/$1 does not exist: run make cocci instead!"
  exit 1 
fi

if [ ! -f "../results/$1/$1.out" ]; then
  echo "Data file does not exist: run make cocci instead!"
  exit 1 
fi

#define relevant file paths
LOG_FILE=../results/$1/results.log
TEMP=temp.tmp
TEMP_1=temp1.tmp
STATS_FILE=../results/$1/$1_stats.out
OUT_FILE=../results/$1/$1.out
OUT_FUNCTIONS=../results/$1/$1_function_names_only.out
OUT_REDUCED=../results/$1_reduced.out
EXCLUDE_FILE=exclude.txt

#start with a clean slate: remove the stats file if it exists
rm -f $STATS_FILE

#function to remove functions with keyword from the data pool
#also removes the function names with the first letter capitalized
#usage: remove "keyword"
remove(){
  #get capitalized version of the keyword
  CAP="$(tr '[:lower:]' '[:upper:]' <<< "${1:0:1}")${1:1}"
  #remove matching functions from the TEMP file
  mv $TEMP $TEMP_1
  cat $TEMP_1 | grep -v $1 | grep -v $CAP | grep ">" > $TEMP
  #output stats
  echo "Without '$1':" >> $LOG_FILE
  COUNT=$(cat $TEMP | wc -l)
  echo $COUNT >> $LOG_FILE
  echo "$1 & $COUNT" >> $STATS_FILE
}

#output overall stats
echo "Coccinelle found:" >> $LOG_FILE
COUNT=$(cat $OUT_FILE | grep ">" | wc -l)
echo $COUNT >> $LOG_FILE
echo "all & $COUNT" >> $STATS_FILE 

#initialize temporary file
cp $OUT_FILE $TEMP

#remove keywords
remove "free"
remove "destroy"
remove "realloc"
remove "resize"
remove "repalloc"
remove "close"
remove "remove"
remove "release"
remove "detach"

#exclude functions in EXCLUDE_FILE
grep -Fv -f $EXCLUDE_FILE $TEMP > $OUT_FUNCTIONS
#retrieve relevant entries in OUT_FILE and print it to OUT_REDUCED
grep -A 4 -F -f $OUT_FUNCTIONS $OUT_FILE > $OUT_REDUCED

#output stats
echo "Without methods in exclude.txt" >> $LOG_FILE
COUNT=$(cat $OUT_FUNCTIONS | wc -l)
echo $COUNT >> $LOG_FILE
echo "excluded & $COUNT" >> $STATS_FILE 

#overwrite the reduced set of functions in the OUT_FUNCTIONS file 
#with all initially found functions
cat $OUT_FILE | grep ">" > $OUT_FUNCTIONS

#print the log file
cat $LOG_FILE

#clean up
rm $TEMP $TEMP_1



#/bin/bash

if [ ! -d "../results/$1" ]; then
  echo "results/$1 does not exist: run make cocci instead!"
  exit 1 
fi

if [ ! -f "../results/$1/$1.out" ]; then
  echo "Data file does not exist: run make cocci instead!"
  exit 1 
fi

TEMP=temp.tmp
TEMP_1=temp1.tmp
STATS_FILE=../results/$1/$1_stats.out
OUT_FILE=../results/$1/$1.out
OUT_FUNCTIONS=../results/$1/$1_function_names_only.out
OUT_REDUCED=../results/$1_reduced.out
EXCLUDE_FILE=exclude.txt

rm -f $STATS_FILE

remove(){
  CAP="$(tr '[:lower:]' '[:upper:]' <<< "${1:0:1}")${1:1}"
  mv $TEMP $TEMP_1
  cat $TEMP_1 | grep -v $1 | grep -v $CAP | grep ">" > $TEMP
  echo "Without '$1':"
  COUNT=$(cat $TEMP | wc -l)
  echo $COUNT
  echo "$1 & $COUNT" >> $STATS_FILE
}

echo "Coccinelle found:"
COUNT=$(cat $OUT_FILE | grep ">" | wc -l)
echo $COUNT
echo "all & $COUNT" >> $STATS_FILE

cp $OUT_FILE $TEMP

remove "free"
remove "destroy"
remove "realloc"
remove "resize"
remove "repalloc"
remove "close"
remove "remove"
remove "release"
remove "detach"

grep -Fv -f $EXCLUDE_FILE $TEMP > $OUT_FUNCTIONS
grep -A 3 -F -f $OUT_FUNCTIONS $OUT_FILE > $OUT_REDUCED
echo "Without methods in exclude.txt"
COUNT=$(cat $OUT_FUNCTIONS | wc -l)
echo $COUNT
echo "excluded & $COUNT" >> $STATS_FILE

rm $TEMP $TEMP_1



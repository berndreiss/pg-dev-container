#!/bin/bash

sleepiness=.5

re='^[0-9]+$'

if [ $# -gt 0 ]; then
   if [[ $1 =~ $re ]]; then
      sleepiness=$1;
   fi 
fi


while [ 1 -lt 2 ]; do
   #clear;
   lines=$(($(tput lines) - 2))
   logfile=$(ls -t logs/* | head -1)
   log=$(grep -Ev '^(HANDLING|Skipping)\b' "$(ls -t logs/* | head -1)" | grep -viE '^(metavariable t2 not used|init_defs_builtins:|\(ONCE\))' | tail -n "$lines";)
   linesInLog=$(echo "$log" | wc -l)
   if [ $linesInLog -lt $lines ]; then
     clear;
  fi
   echo $logfile
   echo -e "$log"
   sleep $sleepiness;
done




#!/bin/bash

sleepiness=5

re='^[0-9]+$'

if [ $# -gt 0 ]; then
   if [[ $1 =~ $re ]]; then
      sleepiness=$1;
   fi 
fi


while [ 1 -lt 2 ]; do
   clear;
   ls -t logs/* | head -1
   grep -Ev '^(HANDLING|Skipping)\b' "$(ls -t logs/* | head -1)" | grep -vi 'metavariable t2 not used';
   sleep $sleepiness;
done




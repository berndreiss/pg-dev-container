#!/bin/bash

sleepiness=5

re='^[0-9]+$'

if [ $# -gt 0 ]; then
   if [[ $1 =~ $re ]]; then
      sleepiness=$1;
   fi 
fi

while [ 0 -lt 1 ]; do
   clear;
   grep -A 1 "####" "$(ls -t logs/*)";
   sleep $sleepiness;
done




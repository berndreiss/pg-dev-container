#/bin/bash

rm -r logs
rm -r free*
mkdir -p logs
datetime="$(date '+%Y-%m-%d_%H-%M-%S')"
bash cocciCreator.sh test.c free "" > logs/free_$datetime.log 2>&1;
bash cocciCreator.sh test.c free "strict" > logs/freestrict_$datetime.log 2>&1;
bash cocciCreator.sh test.c free "dependent" > logs/freedependent_$datetime.log 2>&1;

#/bin/bash

mkdir -p ../logs
datetime="$(date '+%Y-%m-%d_%H-%M-%S')"
if [ $# -eq 1 ]; then
  bash $1.sh $(cat ../TARGET) > ../logs/$1_$datetime.log 2>&1;
else
  bash cocciCreator.sh $(cat ../TARGET) $1 $2 > ../logs/$1$2_$datetime.log 2>&1;
fi

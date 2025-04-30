#/bin/bash

mkdir -p ../logs
datetime="$(date '+%Y-%m-%d_%H-%M-%S')"
sh $1.sh /usr/local/src/postgresql > ../logs/$datetime.log 2>&1

#!/bin/bash

ITERATION=0
FUNCTION=$1
CATEGORY=$2
RESULTS_FILE_NAME=${CATEGORY}_$FUNCTION.position
RESULTS=../results
RESULTS_PATH=$RESULTS/positionalData
RESULTS_FILE=$RESULTS_PATH/$RESULTS_FILE_NAME
TMP_PATH=tmp
MANUALLY_EXCLUDED=exceptions/$CATEGORY${FUNCTION}position.exclude

if [[ -f $RESULTS_PATH ]]; then
  rm -r $RESULTS_PATH
fi
mkdir $RESULTS_PATH

mkdir -p $TMP_PATH
while read -r line; do
    [[ -z "$line" || ! "$line" =~ ^\> ]] && continue
    
    if [[ "$line" =~ ^\>([^,]+),([^,]*),(.+)$ ]]; then
        func=$(echo "${BASH_REMATCH[1]}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        ptype=$(echo "${BASH_REMATCH[2]}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        file=$(echo "${BASH_REMATCH[3]}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | cut -d':' -f1)
    else
        continue
    fi
    
    [[ -z "$func" || -z "$file" || ! -f "$file" ]] && continue
    
    cat prototypes/protoPosition.cocci \
      | sed -e "s/__FUNCTION__/$func/g" \
            -e "s/__TYPE__/$ptype/g" \
            > $TMP_PATH/tmp.cocci
    spatch --sp-file $TMP_PATH/tmp.cocci "$file" >> $RESULTS_FILE


done < $RESULTS/collected/${CATEGORY}_${FUNCTION}_functionsonly.out

grep -vFf exceptions/$CATEGORY$FUNCTION.exclude $RESULTS_FILE > temp && mv temp $RESULTS_FILE

rm -r tmp

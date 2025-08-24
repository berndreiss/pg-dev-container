#/bin/bash

#TESTS WHETHER THE TEMPLATES PRODUCE THE RESULTS IN expected
#ALSO TESTS WHETHER FUNCTIONS IN exceptions ARE REMOVED 

rm -r logs
rm -r -f free*
mkdir -p logs
datetime="$(date '+%Y-%m-%d_%H-%M-%S')"

cp ../cocciCreator.sh .
sed -i 's/RESULTS=\.\.\/results/RESULTS=./' cocciCreator.sh
sed -i 's/TEMPLATE_FILE=templates\/template/TEMPLATE_FILE=..\/templates\/template/g' cocciCreator.sh
sed -i 's/if \[ -f templates\/template/if [ -f ..\/templates\/template/g' cocciCreator.sh

echo "TESTING FREE"
bash cocciCreator.sh test.c free "" > logs/free_$datetime.log 2>&1;
freeResults=$(cat free/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/free.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free produced unexpected results"
else
  echo "All good :)"
fi

echo "TESTING FREE STRICT"
bash cocciCreator.sh test.c free "strict" > logs/freestrict_$datetime.log 2>&1;
freeResults=$(cat freestrict/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/freestrict.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free strict produced unexpected results"
else
  echo "All good :)"
fi

echo "TESTING FREE DEPENDENT"
bash cocciCreator.sh test.c free "dependent" > logs/freedependent_$datetime.log 2>&1;
freeResults=$(cat freedependent/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/freedependent.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free dependent produced unexpected results"
else
  echo "All good :)"
fi

echo "TESTING STATIC"
bash cocciCreator.sh test.c free "static" > logs/freestatic_$datetime.log 2>&1;
freeResults=$(cat freestatic/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/freestatic.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free static unexpected results"
else
  echo "All good :)"
fi

echo "TESTING FREE DOUBLE"
bash cocciCreator.sh test.c free "double" > logs/freedouble_$datetime.log 2>&1;
freeResults=$(cat freedouble/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/freedouble.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free double produced unexpected results"
else
  echo "All good :)"
fi

echo "TESTING FREE SIGNATURE"
bash cocciCreator.sh test.c free "signature" > logs/freedouble_$datetime.log 2>&1;
freeResults=$(cat freesignature/results.out | grep ">" | cut -d ":" -f 1 | sort | uniq)
freeExpected=$(cat expected/freesignature.out)
if [[ "$freeResults" != "$freeExpected" ]]; then
  echo "Template for free signature produced unexpected results"
else
  echo "All good :)"
fi

rm -r free*
rm cocciCreator.sh
rm -f temp

#/bin/bash
mkdir -p ../results
mkdir -p ../results/$1

#spatch --sp-file $1.cocci /usr/local/src/postgresql -very_quiet > ../results/$1/$1.out
spatch --sp-file $1.cocci /usr/local/src/postgresql > ../results/$1/$1.out

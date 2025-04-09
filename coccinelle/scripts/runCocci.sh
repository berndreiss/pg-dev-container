#/bin/bash
spatch --sp-file $1.cocci /usr/local/src/postgresql -very_quiet > ../results/$1.out

cat "$1" | sort | uniq | sed 's/\([^:]*\):\(.*\)/{{"\1"}, {\2}},/' > "$1".converted

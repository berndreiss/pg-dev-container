awk '
    /^>/ {
        split($0, a, ",")
        t1 = a[2]
        gsub(/^ +| +$/, "", t1)  # Trim spaces
        types[t1] = $0
    }

    # Lines starting with Ret. T and type after ": "
    /^Ret\. T/ {
        split($0, a, ": ")
        if (length(a) < 2) next
        t2 = a[2]
        gsub(/^ +| +$/, "", t2)  # Trim spaces
        if (t2 in types) {
            print types[t2]
            print $0
        }
    }
' $1 | grep ">" | sort | uniq


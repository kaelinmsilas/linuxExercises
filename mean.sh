#!/bin/bash

if [ "$#" -gt 2 ]; then
    echo "Usage: $0 <column_number> [file.csv]" >&2
    exit 1
fi

COLUMN=$1
FILE=${2:-/dev/stdin}

if [ -n "$2" ] && [ ! -r "$FILE" ]; then
    echo "Error: File not found or not readable" >&2
    exit 1
fi

cut -d, -f"$COLUMN" "$FILE" | tail -n +2 | {
    sum=0
    count=0
    while read value; do
        if [[ "$value" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
            sum=$(echo "$sum + $value" | bc -l)
            count=$((count + 1))
        fi
    done
    if [ "$count" -gt 0 ]; then
        echo "scale=2; $sum / $count" | bc -l
    else
        echo "No valid data!" >&2
        exit 1
    fi
}

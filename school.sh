#!/bin/bash

cat Property_Tax_Roll.csv | \
    grep "MADISON SCHOOLS" Property_Tax_Roll.csv | \
    cut -d ',' -f 7 | { sum=0; count=0; while read n; do sum=$((sum + n)); count=$((count + 1)); done; echo "sum=$sum, avg=$(echo "scale=2; $sum / $count" | bc)"; }

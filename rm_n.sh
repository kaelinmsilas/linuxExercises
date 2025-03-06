#!/bin/bash

dir=$1
n=$2

for item in $(find "$dir" -type f -size +"$n"c); do
    rm "$item"
done

echo "$0 <dir> <n>" 1>&2

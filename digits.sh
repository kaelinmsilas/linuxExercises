#! /bin/bash

range=$(echo {1000..2000})
pattern="[0|1]$"
sum=0

while read $range; do
    if [[$range -eq $pattern]]; then
	sum=$(($sum + $range))
    fi
done;

echo $sum

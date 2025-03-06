#! /bin/bash
pattern=^[01]+$
sum=0
for number in {1000..2000}; do
    if [[ $number =~ $pattern ]]; then
        sum=$(($sum + $number))
    fi
done;

echo $sum

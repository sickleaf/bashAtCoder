#!/bin/sh

read N
read S

max=0

for i in `seq $(($N-1))`
do
	j=$((i+1))
	X=$(echo $S | cut -c 1-$i  | grep -o . | sort | uniq )
	Y=$(echo $S | cut -c $j-$N | grep -o . | sort | uniq )

	sum=$( echo $X $Y | tr " " "\n" | sort | uniq -d | grep -c ^)

	[ $sum -gt $max ] && max=$sum

done

echo $max

#!/bin/sh

read S
read T

length=${#S}

sum=0
for i in `seq $length`
do
	[ "$(echo $S | cut -c $i)" = "$(echo $T | cut -c $i)" ] && sum=$((sum+1))
done
echo $sum

#!/bin/bash
read N K;

#export A # takahashi HP
#export B # takahashi attack
export numCheck=""

while true;
do
        read line1

        if [ -z "$line1" ]; then
                break
        fi

        read line2
        As=`echo ${line2} | sed "y/ /,/" `
        numCheck=${numCheck}${As}","
done

safe=`echo "$numCheck" | sed "s/,$//" |  tr "," "\n" | sort | uniq | wc -l`

echo $(( $N - $safe ))

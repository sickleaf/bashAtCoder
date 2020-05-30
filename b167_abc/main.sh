#!/bin/sh
# 1 2 7 5 = 1 - 2 (2= 5-1-2)
# 0 1 6 1 = 0
# 0 0 6 1 = -1

read a b c k

plusline=$(( $a + $b))

if [ $k -le $a ]; then
        echo $k
        exit
fi

if [ $k -le $plusline ]; then
        echo $a
else        
        minus=$(($k - $a - $b))
        echo $(($a - $minus))
fi

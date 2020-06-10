#!/bin/bash
read N Y
# x+y+z=N
# 10000x+5000y+1000(N-x-y) = Y  : Y -> 1000Y'
# 9000x+4000y+1000N=1000Y'
# 9x+4y+N=Y'

yd=$((Y/1000))

# y=z=0, 10000x = Y
[ $((yd%10)) -eq 0 ] && [ $((yd/10)) -eq $N ] && { echo "$((yd/10)) 0 0"; exit; }

# x=z=0, 5000y = Y
[ $((yd%5)) -eq 0 ] &&  [ $((yd/5)) -eq $N ] && { echo "0 $((yd/5)) 0"; exit; }

# x=y=0, 1000z = Y
[ $yd -eq $N ] && { echo "0 0 $yd"; exit; }

[ $yd -gt $N ] && { echo "-1 -1 -1"; exit; }



#maxz=$(( (Y - (Y%10000) + 10000)/10000 )) 
#[ $maxz -gt $N ] && maxz=$N

#maxx=$(( (Y - (Y%10000) + 10000)/10000 )) 
#maxy=$(( (Y - (Y%5000) + 5000)/5000 )) 
#
#[ $maxx -gt $N ] && maxx=$N
#[ $maxy -gt $N ] && maxy=$N


# x+y+z=N
# x+y<N (z>=0)
# y<N-x
# max of x : x
# max of y : N-x

for((x=0;x<$maxx;x++)); do
	for((y=0;y<$((N-x));y++)); do

		# maximum of x+y should be N (z>=0)
		[ $((x+y)) -gt $N ] && break;

		if [ $((9*x + 4*y + N)) -eq $yd ];then
			z=$((N - x - y))
			echo "$x $y $z"
			exit
		fi
	done
done

echo "-1 -1 -1"
#[ "$(echo -n $solve | wc -c )" -eq 0 ] && echo -1 -1 -1 || echo $solve

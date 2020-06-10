#!/bin/bash
read N Y


# 10000x+5000y+1000z=Y
# x+y+z=N
# 10x+5y+z=Y'

# 5y + z = Y' - 10x
# y + z = N - x

# 4y = (Y'-10x)-(N-x)
# z = N-x-y

yd=$((Y/1000))

# y=z=0, 10000x = Y
[ $((yd%10)) -eq 0 ] && [ $((yd/10)) -eq $N ] && { echo "$((yd/10)) 0 0"; exit; }
 
# x=z=0, 5000y = Y
[ $((yd%5)) -eq 0 ] &&  [ $((yd/5)) -eq $N ] && { echo "0 $((yd/5)) 0"; exit; }
 
# x=y=0, 1000z = Y
[ $yd -eq $N ] && { echo "0 0 $yd"; exit; }
 
[ $yd -lt $N ] && { echo "-1 -1 -1"; exit; }

# max of x : N

for x in `seq 0 $N`; do
	#y=$(( (yd - N - 9*x)  /4))	
	y=$(( ( (yd - 10*x) - (N-x) ) /4))	
	z=$((N -x -y))
	#echo "$x $y $z: sum($N):$((x+y+z)) , amount($yd):$((10*x+5*y+z))"
	[ $y -gt 0 ] && [ $z -gt 0 ] && [ $((x+y+z)) -eq $N ] && [ $((10*x+5*y+z)) -eq $yd ] && { echo $x $y $z; exit; }
	
done

echo "-1 -1 -1"

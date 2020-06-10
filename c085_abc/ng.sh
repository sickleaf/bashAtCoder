#!/bin/bash
read N Y

[ $((Y%10000)) -eq 0 ] && [ $((Y/10000)) -le $N ] && { echo "$((Y/10000)) 0 0"; exit; }
[ $((Y%5000)) -eq 0 ] &&  [ $((Y/5000)) -le $N ] && { echo "0 $((Y/5000)) 0"; exit; }
[ $((Y%1000)) -eq 0 ] &&  [ $((Y/1000)) -le $N ] && { echo "0 0 $((Y/1000))"; exit; }

[ $Y -lt 10000 ] && maxz=0

maxz=$(( (Y - (Y%10000) + 10000)/10000 )) 
maxy=$(( (Y - (Y%5000) + 5000)/5000 )) 
maxx=$(( (Y - (Y%1000) + 1000)/1000 )) 

[ $maxz -gt $N ] && maxz=$N
[ $maxy -gt $N ] && maxy=$N
[ $maxx -gt $N ] && maxx=$N

solve=$(eval echo {0..$maxz}-{0..$maxy}-{0..$maxx} | tr " " "\n" | awk -v FS="-" -v N=$N -v Y=$Y '{if($1+$2+$3==N && 10000*$1+5000*$2+1000*$3==Y) print $0}' | head -1 | tr "-" " ")

[ "$(echo -n $solve | wc -c )" -eq 0 ] && echo -1 -1 -1 || echo $solve

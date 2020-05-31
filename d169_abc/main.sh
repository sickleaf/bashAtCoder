read N

[ $N -eq 1 ] &&  { echo 0; exit; }

nums=`echo $N | factor | cut -d\  -f2- | tr " " "\n" | uniq -c | awk '{for(i=1;i<=$1;i++) print $2^i}' | sort -n | tr "\n" " "  | sed "s; $;;g" `


[ ${#nums} = ${#N} ] && { echo 1; exit; }

cnt=0
for z in `echo $nums`; do
#	echo $N,$z
	[ $(($N%$z)) -eq 0 ] || continue; 
	N=$(($N/$z));
	cnt=$((cnt+1))
	[ $N -lt $z ] && break; 
done
echo $cnt

read K
read A B
for i in `seq $A $B` ; do
	[ $(($i%$K)) -eq 0 ] && { echo OK; exit ; }
done
echo NG

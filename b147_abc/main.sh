read S
cnt=0
for i in `seq ${#S}`; do
	c=`echo $S | cut -c $i`
	rc=`echo $S | rev | cut -c $i`
	[ ! "$c" = "$rc" ] && cnt=$((cnt+1)) 
done
echo $(($cnt/2))

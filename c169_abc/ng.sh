read A B
B=`echo $B 100 *p | dc | cut -d\. -f1`
num=`echo "$A $B" | awk  '{printf "%d\n",$1*$2}' `
echo $(($num/100))


read A B
B=`echo $B 100 *p | dc | cut -d\. -f1`
echo $(($A*$B/100))

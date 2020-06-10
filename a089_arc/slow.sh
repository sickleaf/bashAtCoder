read N
oldt=0
oldx=0
oldy=0
while read t x y; do
	[ $x -gt $oldx ] && absx=$((x-oldx)) || absx=$((oldx-x)) 
	[ $y -gt $oldy ] && absy=$((y-oldy)) || absy=$((oldy-y)) 
	#echo "tpass=$tpass,abs=$absx+$absy"

	[ $((absx+absy)) -gt $((t-oldt)) ] && { echo No; exit; }
	[ ! $(( (t-x-y)%2)) -eq 0 ] && { echo No; exit; }

	oldt=$t
	oldx=$x
	oldy=$y
done

echo Yes

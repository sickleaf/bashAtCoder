read N
read An


[ ! "$(echo $An | tr " " "\n" | grep ^0$ )"  = "" ] && { echo 0; exit; }

res=1
for num in $(echo $An); do
	res=$(($res*$num))	

	[ ${#res} -ge 19 ] && [ ! $res -eq 1000000000000000000 ] && { echo -1; exit; }
done
echo $res

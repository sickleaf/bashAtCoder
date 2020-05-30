read N
appFlag="APPROVED"
read R
for r in `echo $R`;
do
[ $(($r%2)) -eq 0 ] && [ ! $(($r%3)) -eq 0 ] && [ ! $(($r%5)) -eq 0 ] && { appFlag="DENIED"; break; }
done
echo "$appFlag"

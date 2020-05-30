read N
k=`echo $N | grep -o .$`

[ $k -eq 3 ] && { echo bon; exit; }
[ $k -eq 0 ] || [ $k -eq 1 ] || [ $k -eq 6 ] || [ $k -eq 8 ] && { echo pon; exit; }
echo hon

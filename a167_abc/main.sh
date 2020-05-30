read S
read T
[ $(echo $T | sed "s;.$;;g") = "$S" ] && echo Yes || echo No

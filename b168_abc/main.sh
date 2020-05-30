read K
read S
[ ${#S} -le $K ] && echo $S || echo `echo $S | cut -c 1-$K | sed "s;$;...;g"`

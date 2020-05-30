sed 1d | sort | uniq -c | sort -k1,1nr | awk 'NR==1{sum=$1}{if(sum==$1)print $2}'

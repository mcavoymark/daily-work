#!/bin/bash

if [ ${#@} != 3 ]; then
    echo "Usage: $0 <csv> <directory> <out>"
    echo "    Ex. $0 190905.csv /data/nil-bluearc/vlassenko/RAW_IMAGES/MRI 190905cnda.csv"
    echo ""
    echo "Example <csv>"
    echo "    Project,Subject Label,MR ID"
    echo "    CCIR_00964,AGBR_057,AGBR_057"
    echo "    CCIR_00964,108192,108192"
    echo "    CCIR_00964,108203,108203"
    echo ""
    echo "1. Does the third column appear more than once in the <csv>?"
    echo "2. Does the third column exist in the <directory>?"
    exit
fi
 
{ read;IFS=$'\n' read -d '' -ra csv;} < $1

third=($(printf '%s\n' "${csv[@]}"|awk -F',' '{print $3}'))
#echo ${third[@]}

uniqueNum=$(printf '%s\n' "${third[@]}"|awk '!($0 in seen){seen[$0];c++} END {print c}')
if (( uniqueNum != ${#third[@]} )); then 
    echo "********** Found duplicates **********"
    printf '%s\n' "${third[@]}"|awk '!($0 in seen){seen[$0];next} 1'
    echo ''
else
    echo "********** No duplicate MR IDs in $1 **********"
fi
echo ''

#IFS=$'\n' arr=($(sort <<< "${third[*]}"))
#echo "********** ${1} **********"
#echo ${arr[@]}
#echo ''

#dir=($(ls -p $2 | grep '/' | sort ))
dir=($(ls -p $2 | grep '/' ))
for i in ${!dir[@]}; do
    dir[i]=${dir[i]::-1}
done
#echo "********** ${2} **********"
#echo ${dir[@]}
#echo ''

#both=( "${arr[@]}" "${dir[@]}" )
both=( "${third[@]}" "${dir[@]}" )
#echo "********** both **********"
#echo ${both[@]}
#echo ''

superbird=($(printf '%s\n' "${both[@]}" | sort | uniq -u))
#echo "********** superbird **********"
#echo ${superbird[@]}
#echo ''

#both=( "${arr[@]}" "${superbird[@]}" )
both=( "${third[@]}" "${superbird[@]}" )
superbird=($(printf '%s\n' "${both[@]}" | sort | uniq -d | uniq))
#echo "********** superbird **********"
echo "********** These need to be downloaded **********"
echo ${superbird[@]}
echo ''

echo "$(head -n 1 $1|awk -F'' '{print $1}')" > $3
for i in ${superbird[@]}; do
    for j in ${!third[@]}; do
        if [[ "${third[j]}" == "${i}" ]]; then
            #echo "$j ${third[j]} ${csv[j]}"
            echo "${csv[j]}" >> $3
            break
        fi
    done
done

#!/bin/bash

mf=Movement_Regressors_dt
M="       xmm        ymm        zmm       xdeg       ydeg       zdeg       dxmm       dymm       dzmm      dxdeg      dydeg      dzdeg"

if [ ${#@} != 3 ]; then
    echo "$0 <csv> <input directory> <output directory>"
    echo "" 
    exit
fi
id=$2;od=$3

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

#echo ${#csv[@]}
#echo ${csv[@]}

#for((i=2;i<${#csv[@]};++i));do
#START200205
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]}
    echo "${s0}"

    superbird=(B1_slctmd B2_slctmd)
    #echo "${#superbird[@]}"
    for((j=0;j<${#superbird[@]};++j));do
        f1=$id/${s0}/vglab/T1w/Results/${s0}_${superbird[j]}/${mf}.txt
        if [ -f "${f1}" ];then
            f0=${od}/${s0}_${superbird[j]}_${mf}.ext
            echo "${M}" > ${f0};cat ${f1} >> ${f0};echo "    Motion written to ${f0}";
        #else
        #    echo "    ${f1} does not exist"
        fi
    done
done

#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "Usage: $0 <Project,Subject Label,MR ID,Subject,Date csv> <MAP,REDCAP csv> <HCP directory> <out>"
    echo "    Ex. $0 220207.csv 220210.csv /data/nil-bluearc/vlassenko/HCP/sub 220207missing.csv"
    echo ""
    echo "Example 220207.csv"
    echo "    Project,Subject Label,MR ID,Subject,Date"
    echo "    CCIR_00970,108200,108200,108200,2019-03-29"
    echo "    CCIR_00970,108180,AGAD_022,108180,2019-01-22"
    echo "    CCIR_00970,108182,108182,108182,2019-01-29"
    echo "    CCIR_00970,108183,AGAD_025,108183,2019-01-31"
    echo "    CCIR_00970,108179,108179,108179,2019-01-17"
    echo "Example 220210.csv"
    echo "    MAP,REDCAP"
    echo "    10045,"
    echo "    10064,108080"
    echo "    10064,108080"
    echo "    10064,108080"
    echo "    10064,108080"
    echo "    11570,108130"
    echo "    11570,108130"
    echo "    11570,108130"
    echo ""
    echo "1. Check /data/nil-bluearc/vlassenko/HCP/sub for 108200/190329*"
    exit
fi
h0=$3;o0=$4 
{ read;IFS=$'\n' read -d '' -ra csv;} < $1
{ read;IFS=$'\n' read -d '' -ra csv2;} < $2

[ -f "$o0" ] && rm -f $o0
touch $o0
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    IFS=$'-,\n ' read -ra line2 <<< ${line[4]}
    d0=${h0}/${line[3]}/${line2[0]:2:2}${line2[1]}${line2[2]}
    echo "d0=${d0}"
    for j in "${d0}"*;do
        if [ ! -d "$j" ];then
            if((${#line[3]}==5));then
                superbird=0
                for((k=0;k<${#csv2[@]};++k));do
                    IFS=$',\n ' read -ra line3 <<< ${csv2[i]}
                    if [ "${line3[0]}" = "${line[3]}" ];then
                        d1=${h0}/${line3[1]}/${line2[0]:2:2}${line2[1]}${line2[2]}
                        for l in "${d1}"*;do
                            if [ ! -d "$l" ];then
                                echo "${d1} does not exist    ${line[0]},${line[1]},${line[2]}" >> $o0
                                superbird=1
                                break;
                            fi
                        done
                        ((superbird==1)) && break;
                    fi   
                done
            else
                echo "    ${d0} does not exist    ${line[0]},${line[1]},${line[2]}"
                echo "${d0} does not exist    ${line[0]},${line[1]},${line[2]}" >> $o0
                break;
            fi
        fi
    done
done
echo "Output written to $o0"

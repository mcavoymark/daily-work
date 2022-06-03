#!/bin/bash

if [ ${#@} != 3 ]; then
    echo "$0 <csv> <where freesurfers are currently located> <where freesurfers are to be moved to>"
    echo ""
    exit
fi
id=$2;od=$3;

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

for ((i=0;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]}
    echo ${s0}

    d0=$od/${s0}/vglab
    if [ -d "$d0" ];then
        echo "    $d0 exists" 
    else
        #c0="mv $id/${s0}/vglab $od/${s0}";echo "    $c0"
        #$c0
        c0="mv /data/nil-bluearc/vlassenko/HCP/${s0} $od/${s0}/vglab";echo "    $c0"
        $c0

    fi
done

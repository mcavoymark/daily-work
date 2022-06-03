#!/bin/bash

if [ ${#@} != 2 ]; then
    echo "$0 <in csv - list of MR IDs> <out csv - MR ID, T1, hippo, 5.3 wmparc, 6.0 wmparc>"
    echo ""
    exit
fi
of=$2

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm ${of}; touch ${of}

for ((i=0;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 

    #s0=${line[0]};
    ((${#line[@]}>1)) && s0=${line[1]} || s0=${line[0]}
    #((${#line[@]}>1)) && MAN=${line[1]} || MAN=${line[0]}
    MAN=${line[0]};

    #echo "${s0}"
    echo "${line[@]}"
    echo "    s0=${s0} MAN=${MAN}"
    wmparc53="/data/nil-bluearc/vlassenko/HCP/sub/${s0}/vglab/T1w/wmparc.nii.gz"
    wmparc60="/data/nil-bluearc/vlassenko/HCP/sub/${s0}/6.0vglab/T1w/wmparc.nii.gz"
    d0=/data/nil-bluearc/vlassenko/MAN/Chang/${s0} 
    if [ ! -d "${d0}" ];then
        echo "    $d0 does not exist"
    else
        hippo1=($(ls -t /data/nil-bluearc/vlassenko/MAN/Chang/${s0}/*${MAN}*.gz | head -1))
        if [ -z "${hippo1}" ];then
            echo "    ${hippo1} does not exist"
        else 
            T1="/data/nil-bluearc/vlassenko/MAN/Chang/${s0}/T1w_acpc.nii.gz"
            T10=$T1;wmparc530=$wmparc53;wmparc600=$wmparc60

            #[ ! -f "${T1}" ] && T10= || echo "${T1} does not exist"
            #[ ! -f "${wmparc53}" ] && wmparc530= || echo "${wmparc53} does not exist"
            #[ ! -f "${wmparc60}" ] && wmparc600= || echo "${wmparc60} does not exist"
            if [ ! -f "${T1}" ];then
                T10= 
                echo "    ${T1} does not exist"
            fi
            if [ ! -f "${wmparc53}" ];then
                wmparc530= 
                echo "    ${wmparc53} does not exist"
            fi
            if [ ! -f "${wmparc60}" ];then 
                wmparc600= 
                echo "    ${wmparc60} does not exist"
            fi

            echo "${T10},${hippo1},${wmparc530},${wmparc600}" >> $of
        fi
    fi
    d0=/data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}
    if [ ! -d "${d0}" ];then
        echo "    $d0 does not exist"
    else
        hippo1=($(ls -t /data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}/*${MAN}*.gz | head -1))
        if [ -z "${hippo1}" ];then
            echo "    ${hippo1} does not exist"
        else 
            T1="/data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}/T1w_acpc.nii.gz"
            T10=$T1;wmparc530=$wmparc53;wmparc600=$wmparc60
            if [ ! -f "${T1}" ];then 
                T10= 
                echo "    ${T1} does not exist"
            fi
            if [ ! -f "${wmparc53}" ];then
                wmparc530= 
                echo "    ${wmparc53} does not exist"
            fi
            if [ ! -f "${wmparc60}" ];then 
                wmparc600= 
                echo "    ${wmparc60} does not exist"
            fi

            echo "${T10},${hippo1},${wmparc530},${wmparc600}" >> $of
        fi
    fi
done
echo "csv written to ${of}"

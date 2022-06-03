#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_slicetimertxt
FSLDIR=/usr/local/pkg/fsl5.0.11
P1=${FSLDIR}/bin/slicetimer
. ${FSLDIR}/etc/fslconf/fsl.sh

if [ ${#@} != 3 ]; then
    echo "$0 <csv> <where niftis are currently located> <where niftis are to be moved to>"
    echo ""
    echo "    <csv>"
    echo "        BOLD,structural"
    echo ""
    echo "        If BOLD and structural are the same, then only need one field."
    echo ""
    echo "        Ex. AGBR-048,108050"
    echo "            108209"
    echo ""
    exit
fi
id=$2;od=$3;

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm ${ln}; touch ${ln}
for ((i=0;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]}
    echo ${s0}

    d0=$id/${s0}

    d3=$od/${s0}
    if [ -d "$d3" ];then
        echo "    $d3 exists" 
    else
        mkdir $d3
    fi

    d1=$od/${s0}/nii
#    if [ -d "$d1" ];then
#        echo "    $d1 exists" 
#    else
#        mkdir $d1
#        mv $d0/${s0}_T1.json $d0/${s0}_T1.nii.gz $d0/${s0}_T2.json $d0/${s0}_T2.nii.gz $d1
#        mv $d0/${s0}_B1.json $d0/${s0}_B1.nii.gz $d0/${s0}_B1_SliceTiming.txt $d1
#        mv $d0/${s0}_B2.json $d0/${s0}_B2.nii.gz $d0/${s0}_B2_SliceTiming.txt $d1
#    fi 

    #if [ -f $d1/${s0}_B1.json ];then
    #    mv $d0/${s0}_B1.nii.gz $d0/${s0}_B1_SliceTiming.txt $d1
    #fi
    #if [ -f $d1/${s0}_B2.json ];then
    #    mv $d0/${s0}_B2.nii.gz $d0/${s0}_B2_SliceTiming.txt $d1
    #fi



    d2=$od/${s0}/slctmd
#    if [ -d "$d2" ];then
#        echo "    $d2 exists" 
#    else
#        mkdir $d2
#        if [ -d "$d1" ];then
#            for j in $d1/*bold*.json;do
#                superbird=($(${P0} -json ${j}))
#                elephantpool=${j%%.*}
#                lovepirate=${elephantpool##*/}
#                #echo "    $j"
#                #echo "    $elephantpool"
#                #echo "    $lovepirate"
#                ${P1} -i ${elephantpool}.nii.gz -o ${d2}/${lovepirate}_slctmd.nii.gz --tcustom=${superbird}
#            done 
#        else
#            ${P1} -i ${d1}/${s0}_B1.nii.gz -o ${d2}/${s0}_B1_slctmd.nii.gz --tcustom=${d1}/${s0}_B1_SliceTiming.txt
#            ${P1} -i ${d1}/${s0}_B2.nii.gz -o ${d2}/${s0}_B2_slctmd.nii.gz --tcustom=${d1}/${s0}_B2_SliceTiming.txt
#        fi
#    fi

    #if [ -f $d1/${s0}_B1_SliceTiming.txt ];then
    #    ${P1} -i ${d1}/${s0}_B1.nii.gz -o ${d2}/${s0}_B1_slctmd.nii.gz --tcustom=${d1}/${s0}_B1_SliceTiming.txt
    #fi
    #if [ -f $d1/${s0}_B2_SliceTiming.txt ];then
    #    ${P1} -i ${d1}/${s0}_B2.nii.gz -o ${d2}/${s0}_B2_slctmd.nii.gz --tcustom=${d1}/${s0}_B2_SliceTiming.txt
    #fi

    if [ ! -f $d1/${s0}_B1_SliceTiming.txt ];then
        for j in $d1/*bold*.json;do
            elephantpool=${j%%.*}
            lovepirate=${elephantpool##*/}
            if [ ! -f ${d2}/${lovepirate}_slctmd.nii.gz ];then
                echo "    Creating ${d2}/${lovepirate}_slctmd.nii.gz"
                superbird=($(${P0} -json ${j}))
                #echo "    $j"
                #echo "    $elephantpool"
                #echo "    $lovepirate"
                ${P1} -i ${elephantpool}.nii.gz -o ${d2}/${lovepirate}_slctmd.nii.gz --tcustom=${superbird}
            fi
        done
    fi

done

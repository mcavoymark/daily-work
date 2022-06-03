#!/bin/bash

#D0=/home/usr/mcavoy/pkg/dcm2niix_11-Apr-2019_lnx
#START190718
#P0="/home/usr/mcavoy/pkg/dcm2niix_11-Apr-2019_lnx/dcm2niix -w 1"
#P0="/home/usr/mcavoy/pkg/dcm2niix20190902/dcm2niix -w 1"
#P0="/Volumes/vlassenko/PKG/dcm2niix20190902/dcm2niix -w 0 -z i"
P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix20190902/dcm2niix -w 0 -z i" #-w 0 skip duplicates

if [ ${#@} != 3 ]; then
    echo "$0 <MRI.dat> <HCP directory> <csv output file for HCP script>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        20020262A_MR_v1 2-MPRAGE_GRAPPA2 3-Axial_T2_Star NONE 31-ep2d_boldWU__EYES_OPEN_ 32-ep2d_boldWU__EYES_OPEN_ NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE"
    echo ""
    echo "    <HCP directory>"
    echo "        Ex. /data/nil-bluearc/vlassenko/HCP/sub" 
    echo "            Check for existence of /data/nil-bluearc/vlassenko/HCP/sub/20020262A_MR_v1/vglab" 
    echo ""
    exit
fi
id=$2;of=$3

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm $of;touch $of

for ((i=2;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]};T1=${line[1]};T2=${line[2]};FLAIR=${line[3]} 

    d0=${id}/${s0}/vglab
    #[ ! -d "${d0}" ] && echo "${d0} does not exist"
    #[ -d "${d0}" ] && echo "${d0} exists" || echo "${d0} does not exist"
    if [ ! -d "${d0}" ];then
        echo "${d0} does not exist"
        d1=${id}/${s0}/nii
        if [ "${T2}" != "NONE" ];then
            echo "${s0},${d1}/${s0}_${T1}.nii.gz,${d1}/${s0}_${T2}.nii.gz" >> $of
        elif [ "${FLAIR}" != "NONE" ]; then
            echo "${s0},${d1}/${s0}_${T1}.nii.gz,${d1}/${s0}_${FLAIR}.nii.gz" >> $of
        fi
    fi
done

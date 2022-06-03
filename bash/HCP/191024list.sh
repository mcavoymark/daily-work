#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "$0 <MRI.dat> <conc directory> <output directory> <list name>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4"
    echo "        -----------------------------------------------------------------------"
    echo "        AGBR-048 10-T1w_MPR_vNav_4e_RMS 26-T2w_SPC_vNav 27-3D_FLAIR_Sag 14-rfMRI_REST1_AP 16-rfMRI_REST2_PA 18-rfMRI_REST2_AP 20-rfMRI_REST2_PA 13-rfMRI_REST1_AP_SBRef 15-rfMRI_REST2_PA_SBRef 17-rfMRI_REST2_AP_SBRef 19-rfMRI_REST2_PA_SBRef"
    echo ""
    echo "    <input directory>"
    echo "        Ex. For the first line of MRI.dat, the *gz are fetched from" 
    echo "            <input directory>/scans/AGBR-048/resources/DICOM/files" 
    echo ""
    echo "    <output directory>"
    echo "        Ex. For the first line of MRI.dat, the output goes to <output directory>/108015/nii"
    exit
fi
id=$2;od=$3;ln=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm ${ln}; touch ${ln}
for ((i=2;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]};
    hippo=
    echo ${s0}

    if [ -d "/data/nil-bluearc/vlassenko/MAN/Chang/${s0}" ];then
        #echo "/data/nil-bluearc/vlassenko/MAN/Chang/${s0} exists"
        hippo=($(ls -t /data/nil-bluearc/vlassenko/MAN/Chang/${s0}/*${s0}*.gz | head -1))
    elif [ -d "/data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}" ];then
        hippo=($(ls -t /data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}/*${s0}*.gz | head -1))
    fi 

    conc=
    if [ -z "${hippo}" ];then
        echo "ERROR: Cannot find hippo for ${s0}"
    else

        #conc=($(ls ${id}/${s0}*.conc))
        conc=($(ls ${id}/${s0}.conc))

        if [ "${conc}" != "ls: No match." ];then
            echo ${conc} >> ${ln}
            echo ${od}/fourruns.fidl >> ${ln}
            echo ${hippo} >> ${ln}
            echo '' >> ${ln}
        fi
    fi
done
echo "List written to ${ln}"

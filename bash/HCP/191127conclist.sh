#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "$0 <MRI.dat> <input directory> <output directory> <list name>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108001 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo ""
    echo "    <input directory>"
    echo "        Ex. For the first line of MRI.dat, the *gz are fetched from" 
    echo "            <input directory>" 
    echo ""
    echo "    <output directory>"
    echo "        Ex. For the first line of MRI.dat, the output goes to <output directory>/AGBR-048.conc"
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
    c0=${od}/${s0}.conc
    rm ${c0};touch ${c0}

    for j in ${id}/${s0}*.gz;do
        echo ${j} >> ${c0}
    done
    echo ${conc} >> ${ln}
    echo ${od}/fourruns.fidl >> ${ln}
done

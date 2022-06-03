#!/bin/bash

if [ ${#@} != 3 ]; then
    echo "$0 <MRI.dat> <input directory> <output directory>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108001 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo "        108002 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo ""
    echo "        NOTE: Only the first field 108001 is used. So you can instead use a file that looks like this" 
    echo "              junk" 
    echo "              junk" 
    echo "              108001" 
    echo "              108002" 
    echo "" 
    echo "    <input directory>"
    echo "        Currently /data/nil-bluearc/vlassenko/HCP/sub" 
    echo ""
    echo "    <output directory>"
    echo "        Ex. For the first line of MRI.dat, the output goes to <output directory>/108001.conc"
    exit
fi
id=$2;od=$3

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

for ((i=2;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]};
    c0=${od}/${s0}.conc
    rm ${c0};touch ${c0}

    #for j in (ls ${id}/${s0}*.gz);do
    for j in ${id}/${s0}*.gz;do

        echo ${j} >> ${c0}
    done
done

#!/bin/bash

if((${#@} < 4));then
    echo "$0 <MRI.dat> <input directory - location of wmparcs> <glm directory> <list to be created for fidl>"
    echo "" 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108001 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo "        108002 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA" 
    echo "" 
    echo "    <input directory>"
    echo "        Currently /data/nil-bluearc/vlassenko/HCP/sub" 
    echo "" 
    echo "    <glm directory>"
    echo "        Concs are written to <output directory>"
    echo "" 
    echo "    <list to be created for fidl>"
    echo "" 
    exit
fi
id=$2;d1=$3;of=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm $of;touch $of

for((i=2;i<${#csv[@]};++i));do
    #echo ${csv[i]} 
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    echo "${line[0]}"

    for j in ${line[@]:4:4}; do
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
            str="${line[0]////_}"

            f1=$d1/${str}_${j}.glm
            if [ ! -f "${f1}" ];then
                echo "    ${f1} not found"
                f1=$d1/${str}_${j}_slctmd.glm
                if [ ! -f "${f1}" ];then
                    echo "    ${f1} not found"
                    continue
                fi
            fi
            f2=$id/${line[0]}/vglab/T1w/wmparc.nii.gz
            if [ ! -f "${f2}" ];then 
                echo "    ${f2} not found"
                continue
            fi
            echo ${f1} >> $of 
            echo ${f2} >> $of 
        fi
    done
done
echo "Output written to ${of}"

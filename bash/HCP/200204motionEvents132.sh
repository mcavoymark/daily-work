#!/bin/bash

mf=Movement_Regressors_dt
M="       xmm        ymm        zmm       xdeg       ydeg       zdeg       dxmm       dymm       dzmm      dxdeg      dydeg      dzdeg"

if [ ${#@} != 3 ]; then
    echo "$0 <MRI.dat> <input directory> <output directory>"
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
    echo "    <output directory>"
    echo "        Motion regressor files are written to <output directory>"
    exit
fi
id=$2;od=$3

mkdir -p $od

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]};T1=${line[1]};T2=${line[2]};FLAIR=${line[3]}
    echo "${s0}"

    if [ "${T2}" != "NONE" ] || [ "${FLAIR}" != "NONE" ]; then

        for j in ${line[@]:4:4}; do

            #echo "j = ${j}"
            if [ "$j" != "NONE" ];then
                f0=${od}/${s0}_${j}_${mf}.ext
                f1=$id/${s0}/vglab/T1w/Results/${s0}_${j}/${mf}.txt

                #[ -f "${f1}" ] && { echo "${M}" > ${f0};cat ${f1} >> ${f0};echo "Motion written to ${f0}"; } || echo "    ${f1} does not exist"
                if [ -f "${f1}" ];then 
                    echo "${M}" > ${f0};cat ${f1} >> ${f0};echo "    Motion written to ${f0}";
                else
                    #f0=${od}/${s0}_${j}_slctmd_${mf}.ext
                    #f1=$id/${s0}/vglab/T1w/Results/${s0}_${j}_slctmd/${mf}.txt
                    #if [ -f "${f1}" ];then 
                    #    echo "${M}" > ${f0};cat ${f1} >> ${f0};echo "    Motion written to ${f0}";
                    #else
                    #    echo "    ${f1} does not exist"
                    #fi
                    #START200205
                    echo "    ${f1} does not exist"

                fi
            fi
        done
    fi
done

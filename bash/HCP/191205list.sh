#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "$0 <MRI.dat> <conc directory> <output directory> <list name>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108001 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo ""
    echo "    <input directory>"
    echo ""
    echo "    <output directory>"
    echo ""
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
    hippo1=
    hippo2=
    echo ${s0}

    conc=($(ls ${id}/${s0}.conc))
    if [ "${conc}" = "ls: No match." ];then
        echo "    No conc"
    else
        ev=
        superbird=($(cat $conc | wc -l)) 
        if ((superbird==4));then
            ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/fourruns.fidl
        elif ((superbird==2));then
            ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/tworuns_project5.fidl
        elif ((superbird==1));then
            ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun_project5.fidl
        fi
        if [ -z "${ev}" ];then
            echo "    ERROR: No event file superbird=$superbird"
        else
            if [ -d "/data/nil-bluearc/vlassenko/MAN/Chang/${s0}" ];then
                hippo1=($(ls -t /data/nil-bluearc/vlassenko/MAN/Chang/${s0}/*${s0}*.gz | head -1))
                echo ${conc} >> ${ln}
                echo ${ev} >> ${ln}
                echo ${hippo1} >> ${ln}
                echo '' >> ${ln}
            fi
            if [ -d "/data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}" ];then
                hippo2=($(ls -t /data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}/*${s0}*.gz | head -1))
                echo ${conc} >> ${ln}
                echo ${ev} >> ${ln}
                echo ${hippo2} >> ${ln}
                echo '' >> ${ln}
            fi 
            if [ -z "${hippo1}" ]&&[ -z "${hippo2}" ];then
                echo "    No hippo"
            fi
        fi
    fi
done
echo "List written to ${ln}"

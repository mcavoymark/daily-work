#!/bin/bash

if (( ${#@} < 6 )); then
    echo ${#@}
    echo ${@}
    echo "$0 <MRI.dat> <input directory> <event file directory> <motion regressor directory> <where to write concs> <list to be created for fidl>"
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
    echo "        Concs are written to <output directory>"
    echo "" 
    echo "    <list to be created for fidl>"
    echo "" 
    echo "    HIPPO"
    echo "        Include manual segmentations"
    exit
fi

id=$2;evd=$3;mod=$4;od=$5;of=$6
#START200428
#id=$2;evd=$3;mod=$4;od=$5;of0=$6

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"


rm $of;touch $of
#START200428
#root=${of##*/}
#echo "root = ${root}"
#path=${of%%${root}}
#path=${path%%/}
#echo "path = ${path}"


declare -a F2
declare -a F3
declare -a F4
declare -a F5

for((i=2;i<${#csv[@]};++i));do
    #echo ${csv[i]} 
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]};T1=${line[1]};T2=${line[2]};FLAIR=${line[3]}
    echo "${s0}"

    #START200428
    #of=$path/${s0}_${root}
    #rm -f $of;touch $of

    d0=$id/${s0}/vglab/T1w/Results  

    #echo "d0 = $d0"
    #echo "od = $od"

    if [ "${T2}" != "NONE" ] || [ "${FLAIR}" != "NONE" ]; then

        #for j in ${line[@]:4:1}; do #Day1
        #START200428
        for j in ${line[@]:5:1}; do #Day2

            echo "    ${j}"
            if [ "${j}" != "NONE" ]; then
                ((k=0))
                f0=${d0}/${s0}_${j}/${s0}_${j}.nii.gz
                [ -f "${f0}" ] && superbird= || superbird=_slctmd 
                f0=${d0}/${s0}_${j}${superbird}/${s0}_${j}${superbird}.nii.gz

                if [ -f "${f0}" ];then 
                    echo ${f0} > ${od}/${s0}_${j}.conc;echo ${od}/${s0}_${j}.conc >> ${of}
                    ev=$(ls ${evd}/${s0}*);echo ${ev} >> ${of}

                    #mo=$(ls ${mod}/${s0}*);echo ${mo} >> ${of}
                    #START200428
                    mo=${mod}/${s0}_${j}${superbird}_Movement_Regressors_dt.ext
                    if [ -f "${mo}" ];then
                        echo ${mo} >> ${of}
                    else
                        echo "ERROR: ${mo} does not exist"
                    fi


                    echo "$id/${s0}/vglab/T1w/brainmask_fs.nii.gz" >> ${of}
                fi
            fi
        done
    fi

    #START200428
    #echo "    Output written to ${of}"

done

#START200428
echo "Output written to ${of}"

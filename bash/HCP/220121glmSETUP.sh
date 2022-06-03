#!/bin/bash

#if ((${#@} < 8)); then
if((${#@} < 9)); then

    #echo "$0 <MRI.dat> <input directory> <motion path> <mask path> <wmparc path or NONE> <where concs are written> <list to be created for fidl> <list of wmparcs or NONE>"
    #echo "$0 <MRI.dat> <in dir or in dir,bold dir,suffix> <motion path> <mask path> <wmparc path or NONE> <where concs are written> <list to be created for fidl> <list of wmparcs or NONE>"
    echo "$0 <MRI.dat> <in dir or in dir,bold dir,suffix> <motion path> <mask path> <wmparc path or NONE> <where concs are written> <list to be created for fidl> <list of wmparcs or NONE> <threshold or NONE>"

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
    exit
fi
#id=$2;d1=$3;d2=$4;d3=$5;od=$6;of=$7;d4=$8
#[ ${#@} == 9 ] && lchippo=1 || lchippo=0
#id=$2;d1=$3;d2=$4;d3=$5;od=$6;of=$7;threshold=$8;d4=$9
id=$2;d1=$3;d2=$4;d3=$5;od=$6;of=$7;d4=$8;threshold=$9

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

if [ "${8}" != "NONE" ];then
    IFS=$'\n' read -d '' -ra w0 < ${d4}
fi

#if [[ "${2}" = *"SINGLEDIR,"* ]];then
if [[ "${2}" = *","* ]];then
    IFS=$',\n' read -d '' -ra superbird <<< ${2}
    id=${superbird[0]}
    bd=${superbird[1]}
    suffix=${superbird[2]}
fi
b0="vglab/T1w/Results"
c0="Movement_AbsoluteRMS_mean.txt"

rm -f $of;touch $of

declare -a F2
declare -a F3
declare -a F4
declare -a F6
declare -a F7

for((i=2;i<${#csv[@]};++i));do
    #echo ${csv[i]} 
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    echo "${line[0]}"

    str="${line[0]////_}"
    d0=$id/${line[0]}/${b0}

    for j in ${line[@]:4:4}; do
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ]; then
            ((k=0))
            dir0=${d0}/${j}
            [ -d "${dir0}" ] && superbird= || superbird=_slctmd

            if [[ $threshold != "NONE" ]];then
                mo0=${d0}/${j}${superbird}/${c0}
                if [ ! -f "${mo0}" ];then
                    echo  "        File ${mo0} does not exist"
                    continue
                else
                    elephantpool=$(more ${mo0})
                    if(( $(echo "${elephantpool} >= ${threshold}" |bc -l) ));then
                        echo "        ${mo0} ${elephantpool} EXCLUDED"
                        continue
                    fi
                fi
            fi

            [[ "${2}" = *","* ]] && f0=$bd/${str}_${j}${superbird}${suffix}.nii.gz || f0=${dir0}${superbird}/${j}${superbird}.nii.gz
            if [ ! -f "${f0}" ];then 
                echo "    ${f0} does not exist";#((k++))
                continue
            fi 


            #if [ -f "${f0}" ];then 
            #    f1=${d1}/${str}_${j}${superbird}_Movement_Regressors_dt.ext
            #    [ ! -f "${f1}" ] && { echo "    ${f1} does not exist";((k++)); }
            #    f2=${d2}/${str}_brainmask_fs_LRreg.nii.gz
            #    [ ! -f "${f2}" ] && { echo "    ${f2} does not exist";((k++)); }
            #    f3=${d2}/${str}_wm1_LRreg.nii.gz
            #    [ ! -f "${f3}" ] && { echo "    ${f3} does not exist";((k++)); }
            #    f4=${d2}/${str}_csf0_LRreg.nii.gz
            #    [ ! -f "${f4}" ] && { echo "    ${f4} does not exist";((k++)); } 
            #    if [ "${d3}" != "NONE" ];then
            #        f5=${d3}/${line[0]}/vglab/T1w/wmparc.nii.gz
            #        [ ! -f "${f5}" ] && { echo "    ${f5} does not exist";((k++)); } 
            #    fi
            #    if [ "${d4}" != "NONE" ];then
            #        f7=${w0[((i-2))]}
            #        [ ! -f "${f7}" ] && { echo "    ${f7} does not exist";((k++)); } 
            #    fi
            #else
            #    echo "    ${f0} does not exist";((k++));
            #fi
            #if [ "$k" -eq "0" ];then
            #    echo ${f0} > ${od}/${str}_${j}.conc  #ind glms for each run, so separate conc for each run 
            #    echo ${od}/${str}_${j}.conc >> ${of}
            #    echo ${f1} >> ${of}
            #    F2+=(${f2})
            #    F3+=(${f3})
            #    F4+=(${f4})
            #    [ "${d3}" != "NONE" ] && F6+=(${f5})
            #    [ "${d4}" != "NONE" ] && F7+=(${f7})
            #fi
            f1=${d1}/${str}_${j}${superbird}_Movement_Regressors_dt.ext
            [ ! -f "${f1}" ] && { echo "    ${f1} does not exist";((k++)); }
            f2=${d2}/${str}_brainmask_fs_LRreg.nii.gz
            [ ! -f "${f2}" ] && { echo "    ${f2} does not exist";((k++)); }
            f3=${d2}/${str}_wm1_LRreg.nii.gz
            [ ! -f "${f3}" ] && { echo "    ${f3} does not exist";((k++)); }
            f4=${d2}/${str}_csf0_LRreg.nii.gz
            [ ! -f "${f4}" ] && { echo "    ${f4} does not exist";((k++)); }
            if [ "${d3}" != "NONE" ];then
                f5=${d3}/${line[0]}/vglab/T1w/wmparc.nii.gz
                [ ! -f "${f5}" ] && { echo "    ${f5} does not exist";((k++)); }
            fi
            if [ "${d4}" != "NONE" ];then
                f7=${w0[((i-2))]}
                [ ! -f "${f7}" ] && { echo "    ${f7} does not exist";((k++)); }
            fi
            if [ "$k" -eq "0" ];then
                echo ${f0} > ${od}/${str}_${j}.conc  #ind glms for each run, so separate conc for each run
                echo ${od}/${str}_${j}.conc >> ${of}
                echo ${f1} >> ${of}
                F2+=(${f2})
                F3+=(${f3})
                F4+=(${f4})
                [ "${d3}" != "NONE" ] && F6+=(${f5})
                [ "${d4}" != "NONE" ] && F7+=(${f7})
            fi


        fi
    done
done
echo '' >> ${of}
#echo "${F2[@]}" >> ${of}
printf '%s\n' "${F2[@]}" >> ${of}
echo '' >> ${of}
#echo "${F3[@]}" >> ${of}
printf '%s\n' "${F3[@]}" >> ${of}
echo '' >> ${of}
#echo "${F4[@]}" >> ${of}
printf '%s\n' "${F4[@]}" >> ${of}
echo '' >> ${of}
[ "${d3}" != "NONE" ] && { printf '%s\n' "${F6[@]}" >> ${of}; } 
[ "${d4}" != "NONE" ] && { printf '%s\n' "${F7[@]}" >> ${of}; } 
echo "Output written to ${of}"

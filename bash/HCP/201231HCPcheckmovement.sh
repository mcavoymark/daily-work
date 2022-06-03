#!/bin/bash

if [ ${#@} != 3 ];then
    echo "You have provided ${#@} parameters."
    echo "$0 <MRI.dat> <hcp dir> <movement values written to this file>" 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4"
    echo "        -----------------------------------------------------------------------"
    echo "        108203/181208JZPnoT2 15-T1w_MPR_vNav_4e_RMS NOTUSEABLE NONE 8-fMRI_AP_2p4mm_MB4_tr1330_te38 17-fMRI_AP_2p4mm_MB4_tr1330_te38 NONE NONE 7-fMRI_AP_2p4mm_MB4_tr1330_te38_SBRef 16-fMRI_AP_2p4mm_MB4_tr1330_te38_SBRef NONE NONE NOTUSEABLE NOTUSEABLE NOTUSEABLE NOTUSEABLE"
    echo ""
    echo "    <hcpdir>" 
    echo "        Location of HCP bold output"
    echo "        Eg. /data/nil-bluearc/vlassenko/HCP/sub"
    echo ""
    exit
fi

id0=$2;bs=$3
b0="vglab/T1w/Results"
c0=("Movement_AbsoluteRMS_mean.txt" "Movement_RelativeRMS_mean.txt")

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo -e "\tMovement_AbsoluteRMS_mean 1\tMovement_AbsoluteRMS_mean 2\tMovement_AbsoluteRMS_mean 3\tMovement_AbsoluteRMS_mean 4\tMovement_RelativeRMS_mean 1\tMovement_RelativeRMS_mean 2\tMovement_RelativeRMS_mean 3\tMovement_RelativeRMS_mean 4" > $bs

#START201223
declare -a bolds

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}
    echo ${s0}
    b1="${id0}/${s0}/${b0}"
    elephantpool=(${s0})

    #slctmd and not slctmd are in separate loops in case we have computed both, then we can see the results of both

    #slctmd loop
    unset bolds
    lcbolds=0
    j0=0;k1=0
    for j in ${line[@]:4:4};do
        ((j0++))
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
            superbird=${j}_slctmd
            if [ ! -d "${b1}/${superbird}" ];then
                elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
                elephantpool[((j0+4))]="Directory ${b1}/${superbird} does not exist"
                echo "        ${elephantpool[j0]}"
                continue
            fi
            lovepirate=${b1}/${superbird}/${superbird}.nii.gz
            if [ ! -f "${lovepirate}" ];then
                elephantpool[j0]="File ${lovepirate} does not exist"
                elephantpool[((j0+4))]="File ${lovepirate} does not exist"
                echo "        ${elephantpool[j0]}"
                continue
            fi
            k0=j0
            for k in ${c0[@]};do
                lovepirate=${b1}/${superbird}/${k}
                #echo "lovepirate=$lovepirate"
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[k0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                else
                    elephantpool[k0]=$(more ${lovepirate})
                    #bolds[((j0-1))]=$lovepirate
                    bolds[k1]=$lovepirate
                    lcbolds=1
                fi
                ((k0+=4));((k1++))
            done
        else
            elephantpool[j0]=$j
            elephantpool[((j0+4))]=$j
        fi
    done
    printf '%s\t' "${elephantpool[@]}" >> $bs
    printf '\n' >> $bs
    if((lcbolds==1));then
        printf '    %s\n' "${bolds[@]}" >> $bs
    fi
    printf '\n' >> $bs

    #not slctmd loop
    unset bolds
    lcbolds=0
    j0=0;k1=0
    for j in ${line[@]:4:4};do
        ((j0++))
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
            superbird=${j}
            if [ ! -d "${b1}/${superbird}" ];then
                elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
                elephantpool[((j0+4))]="Directory ${b1}/${superbird} does not exist"
                echo "        ${elephantpool[j0]}"
                continue
            fi
            lovepirate=${b1}/${superbird}/${superbird}.nii.gz
            if [ ! -f "${lovepirate}" ];then
                elephantpool[j0]="File ${lovepirate} does not exist"
                elephantpool[((j0+4))]="File ${lovepirate} does not exist"
                echo "        ${elephantpool[j0]}"
                continue
            fi
            k0=j0
            for k in ${c0[@]};do
                lovepirate=${b1}/${superbird}/${k}
                #echo "lovepirate=$lovepirate"
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[k0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                else
                    elephantpool[k0]=$(more ${lovepirate})
                    #bolds[((j0-1))]=$lovepirate
                    bolds[k1]=$lovepirate
                    lcbolds=1
                fi
                ((k0+=4));((k1++))
            done
        else
            elephantpool[j0]=$j
            elephantpool[((j0+4))]=$j
        fi
    done
    printf '%s\t' "${elephantpool[@]}" >> $bs
    printf '\n' >> $bs
    if((lcbolds==1));then
        printf '    %s\n' "${bolds[@]}" >> $bs
    fi
    printf '\n' >> $bs

done
echo "Output written to $bs"

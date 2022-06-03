#!/bin/bash

#if [ ${#@} != 9 ];then
if [ ${#@} != 11 ];then
    echo "You have provided ${#@} parameters."

    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <sd dir> <rms dir> <threshold> <list to be written, includes rms and wmparc> <glm list to be written> <SD, MEAN or SDREG>" 
    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <sd dir> <rms dir> <threshold> <list to be written, includes rms and wmparc> <glm list to be written> <SD, MEAN, SDREG or NORMSD>" 
    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <sd dir> <rms dir> <threshold> <list to be written, includes rms and wmparc> <glm list to be written> <SD, MEAN, SDREG, NORMSD or WMEAN>" 
    echo "$0 <MRI.dat> <hcp dir> <glm dir> <sd dir> <rms dir> <threshold> <list to be written, includes rms and wmparc> <glm list to be written> <VOX or REG> <sd or intercept root> <rms or mean root>" 

    echo ""
    echo "    Create list of sd_rms and wmparc files."
    echo "    This program can be used to check for the existence of sds."
    echo "    Use of MRI.dat distinguishes between sessions excluded because of movement, lacking bold or missing sd."
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo "    <hcpdir>" 
    echo "        Location of HCP bold output"
    echo "        Eg. /data/nil-bluearc/vlassenko/HCP/sub"
    echo "    <glm dir>" 
    echo "        Location of glms."
    echo "        If sd does not exist, then glm (if it exists) is written to glm list."
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm"
    echo "    <sd dir>" 
    echo "        Location of sd files"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm/sd"
    echo "    <rms dir>" 
    echo "        Location of rms files"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms"
    echo "    <threshold>" 
    echo "        For the sd to be included in the script, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo ""

    echo $1
    echo $2
    echo $3
    echo $4
    echo $5
    echo $6
    echo $7
    echo $8
    echo $9
    echo $10

    exit
fi

#id0=$2;g0=$3;sd0=$4;r0=$5;threshold=$6;bs=$7;gs=$8;metric=$9
#if [[ "$metric" != "SD" && "$metric" != "MEAN" && "$metric" != "SDREG" && "$metric" != "NORMSD" && "$metric" != "WMEAN" ]];then
#    echo "metric = $metric  Unknown. Needs to be either SD, MEAN, SDREG, NORMSD or WMEAN"
#    exit
#fi
#if [[ "$metric" = "SD" || "$metric" = "SDREG" ]];then
#    sd1="_res_eyesopen_sdTR.nii.gz"
#    r1="_sdTR_rms.nii.gz"
#elif [[ "$metric" = "MEAN" ]];then
#    sd1="_Baseline_unscaled.nii.gz"
#    r1="_Baseline_normB_mean.nii.gz"
#elif [[ "$metric" = "NORMSD" ]];then
#    sd1="_res_eyesopen_sdTR_normsd.nii.gz"
#    r1="_sdTR_normsd_rms.nii.gz"
#elif [[ "$metric" = "WMEAN" ]];then
#    sd1="_Baseline_unscaled.nii.gz"
#    r1="_Baseline_normB_wmean.nii.gz"
#fi
id0=$2;g0=$3;sd0=$4;r0=$5;threshold=$6;bs=$7;gs=$8;metric=$9;sd1=${10};r1=${11}
if [[ "$metric" != "VOX" && "$metric" != "REG" ]];then
    echo "metric = $metric  Unknown. Needs to be either VOX or REG"
    exit
fi
echo "sd1=${sd1}"
echo "r1=${r1}"
#exit




b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
c0=("Movement_AbsoluteRMS_mean.txt")

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

rm -f $bs;touch $bs
rm -f $gs;touch $gs
bs0=0
for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    echo ${line[0]}
    b1="${id0}/${line[0]}/${b0}"
    w1="${id0}/${line[0]}/${w0}"
    elephantpool=(${s0})

    str="${line[0]////_}"

    lcsd=0
    j0=0;k1=0;l0=0
    for j in ${line[@]:4:4};do
        ((j0++))
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then

            superbird=${j}
            if [ -d "${b1}/${superbird}" ];then
                lovepirate=${b1}/${superbird}/${superbird}.nii.gz
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[j0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                    continue
                fi
            else 
                elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
                #echo "        ${elephantpool[j0]}"
                superbird+=_slctmd
                lovepirate=${b1}/${superbird}/${superbird}.nii.gz
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[j0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                    continue
                fi
            fi

            k0=j0
            for k in ${c0[@]};do
                lovepirate=${b1}/${superbird}/${k}
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[k0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                else
                    elephantpool[k0]=$(more ${lovepirate})

                    if(( $(echo "${elephantpool[k0]} < ${threshold}" |bc -l) ));then
                        #echo "        ${lovepirate} ${elephantpool[k0]}"

                        sd2=${sd0}/${str}_${j}${sd1}
                        #echo "sd2=${sd2}"
                        w1=${id0}/${line[0]}/${w0}
                        r2=${r0}/${str}${r1}
                        if [ ! -f "${sd2}" ];then
                            echo "    **** ${sd2} does not exist ****"

                            g1=${g0}/${str}_${j}.glm
                            if [ ! -f "${g1}" ];then
                                echo "        **** ${g1} GLM does not exist ****"
                            else    
                                echo ${g1} >> $gs
                            fi

                        else
                            lcsd=1
                        fi 
                    else
                        echo "        ${lovepirate} ${elephantpool[k0]} EXCLUDED"
                    fi
                fi
                ((k0+=4));((k1++))
            done

        else
            elephantpool[j0]=$j
            elephantpool[((j0+4))]=$j
        fi
    done
    if((lcsd==1));then
        w1=${id0}/${line[0]}/${w0}
        r2=${r0}/${str}${r1}
        if [ ! -f "${w1}" ];then
            echo "    **** ${w1} does not exist ****"
        elif [ ! -f "${r2}" ];then
            echo "    **** ${r2} does not exist ****"
        else
            echo ${r2} >> $bs

            #if [[ "$metric" != "SDREG" ]];then
            if [[ "$metric" != "REG" ]];then
                echo ${w1} >> $bs
            fi

            ((bs0++)) 
        fi
    fi
done
echo "$1 $((${#csv[@]}-2)) sessions"
echo "$bs ${bs0} sessions" 
echo "Output written to $bs"
echo "Output written to $gs"

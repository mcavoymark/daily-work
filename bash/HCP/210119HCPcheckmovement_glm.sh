#!/bin/bash

if [ ${#@} != 5 ];then
    echo "You have provided ${#@} parameters."
    echo "$0 <MRI.dat> <hcp dir> <glm dir> <threshold> <glm list to be written>" 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "    <hcpdir>" 
    echo "        Location of HCP bold output"
    echo "        Eg. /data/nil-bluearc/vlassenko/HCP/sub"
    echo "    <glm dir>" 
    echo "        Location of glms"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm"
    echo "    <threhold>" 
    echo "        For the glm to be included in the list, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo ""
    exit
fi
id0=$2;gd=$3;threshold=$4;bs=$5

b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
#c0=("Movement_AbsoluteRMS_mean.txt" "Movement_RelativeRMS_mean.txt")
c0=("Movement_AbsoluteRMS_mean.txt")

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

#echo -e "\tMovement_AbsoluteRMS_mean 1\tMovement_AbsoluteRMS_mean 2\tMovement_AbsoluteRMS_mean 3\tMovement_AbsoluteRMS_mean 4\tMovement_RelativeRMS_mean 1\tMovement_RelativeRMS_mean 2\tMovement_RelativeRMS_mean 3\tMovement_RelativeRMS_mean 4" > $bs
rm -f $bs; touch $bs

#START201223
declare -a bolds

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}
    echo ${s0}
    b1="${id0}/${s0}/${b0}"
    w1="${id0}/${s0}/${w0}"
    elephantpool=(${s0})

    str="${s0////_}"

    #slctmd and not slctmd are in separate loops in case we have computed both, then we can see the results of both

#    #slctmd loop
#    unset bolds
#    lcbolds=0
#    j0=0;k1=0
#    for j in ${line[@]:4:4};do
#        ((j0++))
#        echo "    ${j}"
#        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
#            superbird=${j}_slctmd
#            if [ ! -d "${b1}/${superbird}" ];then
#                elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
#                elephantpool[((j0+4))]="Directory ${b1}/${superbird} does not exist"
#                echo "        ${elephantpool[j0]}"
#                continue
#            fi
#            lovepirate=${b1}/${superbird}/${superbird}.nii.gz
#            if [ ! -f "${lovepirate}" ];then
#                elephantpool[j0]="File ${lovepirate} does not exist"
#                elephantpool[((j0+4))]="File ${lovepirate} does not exist"
#                echo "        ${elephantpool[j0]}"
#                continue
#            fi
#            k0=j0
#            for k in ${c0[@]};do
#                lovepirate=${b1}/${superbird}/${k}
#                #echo "lovepirate=$lovepirate"
#                if [ ! -f "${lovepirate}" ];then
#                    elephantpool[k0]="File ${lovepirate} does not exist"
#                    echo "        ${elephantpool[j0]}"
#                else
#                    elephantpool[k0]=$(more ${lovepirate})
#                    #bolds[((j0-1))]=$lovepirate
#                    bolds[k1]=$lovepirate
#                    lcbolds=1
#                fi
#                ((k0+=4));((k1++))
#            done
#        else
#            elephantpool[j0]=$j
#            elephantpool[((j0+4))]=$j
#        fi
#    done
#    printf '%s\t' "${elephantpool[@]}" >> $bs
#    printf '\n' >> $bs
#    if((lcbolds==1));then
#        printf '    %s\n' "${bolds[@]}" >> $bs
#    fi
#    printf '\n' >> $bs

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
                    #bolds[k1]=$lovepirate
                    lcbolds=1

                    #STARTHERE
                    #echo "here0 ${lovepirate} ${elephantpool[k0]} ${threshold}"
                    if(( $(echo "${elephantpool[k0]} < ${threshold}" |bc -l) ));then
                        echo "        ${lovepirate} ${elephantpool[k0]}"
                        glm0="${gd}/${str}_${superbird}.glm"
                        #echo "here1 ${glm0}"
                        if [ ! -f "${glm0}" ];then
                            #elephantpool[k0]="File ${glm0} does not exist"
                            echo "File ${glm0} does not exist"
                        else
                            #echo "here2 ${glm0} ${elephantpool[k0]}"
                            echo "${glm0}" >> $bs
                            echo "${w1}" >> $bs
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
    #printf '%s\t' "${elephantpool[@]}" >> $bs
    #printf '\n' >> $bs
    #if((lcbolds==1));then
    #    printf '    %s\n' "${bolds[@]}" >> $bs
    #fi
    #printf '\n' >> $bs

done
echo "Output written to $bs"

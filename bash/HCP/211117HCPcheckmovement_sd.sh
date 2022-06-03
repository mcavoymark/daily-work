#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_rms
P1=/home/usr/mcavoy/FIDL/build/fidl_separate_lut

#if [ ${#@} != 6 ];then
#if [ ${#@} != 8 ];then
if((${#@}< 8));then

    echo "You have provided ${#@} parameters."

    #echo "$0 <MRI.dat> <hcp dir> <sd dir> <threshold> <script to be written> <SD, SDREG or NORMSD>" 
    echo "$0 <MRI.dat> <hcp dir> <sd dir> <threshold> <script to be written> <VOX, REG or COMBINE> <in root> <out root>" 

    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "    <hcpdir>" 
    echo "        Location of HCP bold output"
    echo "        Eg. /data/nil-bluearc/vlassenko/HCP/sub"
    echo "    <glm dir>" 
    echo "        Location of sds"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm/sd"
    echo "    <threshold>" 
    echo "        For the sd to be included in the script, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo "    <VOX or REG>" 
    echo "        File is either a VOXel image or (freesurfer) REGions"
    echo ""
    exit
fi

#id0=$2;gd=$3;threshold=$4;bs=$5;metric=$6;sd1=$7;sd3=$8
id0=$2;gd=$3;threshold=$4;bs=$5;metric=$6;sd1=$7;sd3=$8

#if [[ "$metric" != "VOX" && "$metric" != "REG" ]];then
if [[ "$metric" != "VOX" && "$metric" != "REG" && "$metric" != "COMBINE" ]];then

    echo "metric = $metric  Unknown. Needs to be either VOX, REG or COMBINE"
    exit
fi


b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
m0="vglab/T1w/brainmask_fs.nii.gz"
#c0=("Movement_AbsoluteRMS_mean.txt" "Movement_RelativeRMS_mean.txt")
c0=("Movement_AbsoluteRMS_mean.txt")

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

#echo -e "\tMovement_AbsoluteRMS_mean 1\tMovement_AbsoluteRMS_mean 2\tMovement_AbsoluteRMS_mean 3\tMovement_AbsoluteRMS_mean 4\tMovement_RelativeRMS_mean 1\tMovement_RelativeRMS_mean 2\tMovement_RelativeRMS_mean 3\tMovement_RelativeRMS_mean 4" > $bs
#rm -f $bs; touch $bs
echo -e "#!/bin/bash\n" > $bs

declare -a bolds;declare -a sd;declare -a wd

cnt0=0
for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}
    echo ${s0}
    b1="${id0}/${s0}/${b0}"
    w1="${id0}/${s0}/${w0}"
    m1="${id0}/${s0}/${m0}"
    elephantpool=(${s0})
    str="${s0////_}"

    unset bolds;unset sd;unset wd
    lcbolds=0
    j0=0;k1=0;l0=0
    for j in ${line[@]:4:4};do
        ((j0++))
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
            superbird=${j}

            superbird0=${j}


            #if [ ! -d "${b1}/${superbird}" ];then
            #    elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
            #    elephantpool[((j0+4))]="Directory ${b1}/${superbird} does not exist"
            #    echo "        ${elephantpool[j0]}"
            #    continue
            #fi
            #lovepirate=${b1}/${superbird}/${superbird}.nii.gz
            #if [ ! -f "${lovepirate}" ];then
            #    elephantpool[j0]="File ${lovepirate} does not exist"
            #    elephantpool[((j0+4))]="File ${lovepirate} does not exist"
            #    echo "        ${elephantpool[j0]}"
            #    continue
            #fi
            #START211103
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

                #superbird+=_slctmd
                #lovepirate=${b1}/${superbird}/${superbird}.nii.gz
                #superbird0=${superbird}_slctmd
                superbird0+=_slctmd
                lovepirate=${b1}/${superbird0}/${superbird0}.nii.gz

                if [ ! -f "${lovepirate}" ];then
                    elephantpool[j0]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                    continue
                fi
            fi


            k0=j0
            for k in ${c0[@]};do

                #lovepirate=${b1}/${superbird}/${k}
                lovepirate=${b1}/${superbird0}/${k}

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
                        #echo "        ${lovepirate} ${elephantpool[k0]}"
                        #glm0="${gd}/${str}_${superbird}.glm"
                        #echo "here1 ${glm0}"

                        #sd0="${gd}/${str}_${superbird}_res_eyesopen_sdTR.nii.gz"
                        sd0="${gd}/${str}_${superbird}${sd1}"

                        #if [ ! -f "${glm0}" ];then
                        if [ ! -f "${sd0}" ];then
                            #elephantpool[k0]="File ${glm0} does not exist"
                            echo "File ${sd0} does not exist"
                        else
                            #echo "here2 ${glm0} ${elephantpool[k0]}"
                            #echo "${glm0}" >> $bs
                            #echo "${w1}" >> $bs
                            sd[l0]=${sd0}
                            wd[l0]=${lovepirate} 
                            ((l0++))
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

    echo "l0=${l0}"
    if((l0>=1));then
        ((cnt0++))


        #printf 'FILES=(' >> $bs
        #for((j=0;j<${#sd[@]};++j));do
        #    if((j>0));then
        #        printf '       '  >> $bs
        #    fi
        #    printf '%s' "${sd[j]}" >> $bs
        #    if((j<(${#sd[@]}-1)));then
        #        printf ' \\\n' >> $bs
        #    else
        #        printf ')\n' >> $bs
        #    fi
        #done
        #printf 'MARMSm=(' >> $bs
        #for((j=0;j<${#wd[@]};++j));do
        #    if((j>0));then
        #        printf '       '  >> $bs
        #    fi
        #    printf '%s' "${wd[j]}" >> $bs
        #    if((j<(${#wd[@]}-1)));then
        #        printf ' \\\n' >> $bs
        #    else
        #        printf ')\n' >> $bs
        #    fi
        #done
        #if [[ "$metric" = "VOX" ]];then
        #    printf 'MASK=%s\n' "${m1}" >> $bs
        #fi
        #printf 'OUT=%s\n' "${str}${sd3}" >> $bs
        #if [ "$metric" = "VOX" ];then
        #    #printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT' >> $bs
        #    printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT -rWmsonly' >> $bs
        #else
        #    printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT -rWmsonly' >> $bs
        #fi
        #START211117
        if [[ "$metric" = "VOX" || "$metric" = "REG" ]];then
            printf 'FILES=(' >> $bs
            for((j=0;j<${#sd[@]};++j));do
                if((j>0));then
                    printf '       '  >> $bs
                fi
                printf '%s' "${sd[j]}" >> $bs
                if((j<(${#sd[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
            printf 'MARMSm=(' >> $bs
            for((j=0;j<${#wd[@]};++j));do
                if((j>0));then
                    printf '       '  >> $bs
                fi
                printf '%s' "${wd[j]}" >> $bs
                if((j<(${#wd[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
            if [[ "$metric" = "VOX" ]];then
                printf 'MASK=%s\n' "${m1}" >> $bs
            fi
            printf 'OUT=%s\n' "${str}${sd3}" >> $bs
            if [ "$metric" = "VOX" ];then
                #printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT' >> $bs
                printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT -rWmsonly' >> $bs
            else
                printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -out $OUT -rWmsonly' >> $bs
            fi
        else
            for((j=0;j<${#sd[@]};++j));do
                echo -e "${P1} -file ${sd[j]}${sd3}">>$bs
            done
        fi


    fi

done
chmod +x $bs
echo "Output written to $bs"
echo "cnt0=${cnt0}"

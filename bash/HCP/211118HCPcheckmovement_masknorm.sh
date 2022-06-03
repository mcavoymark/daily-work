#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_masknorm

#if [ ${#@} != 7 ];then
#if [ ${#@} != 8 ];then
if [ ${#@} != 10 ];then

    echo "You have provided ${#@} parameters."

    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <intercept dir> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts>" 
    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <intercept or sd dir> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts> <INTERCEPT or SD>" 
    echo "$0 <MRI.dat> <hcp dir> <glm dir> <intercept or sd dir> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts> <INTERCEPT or SD> <in roott> <out root>" 

    echo ""
    echo "    Create fidl_masknorm script."
    echo "    This program can be used to check for the existence of intercepts or sds."
    echo "    Use of MRI.dat distinguishes between sessions excluded because of movement, lacking bold or missing intercept."
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
    echo "    <intercept dir>" 
    echo "        Location of intercepts"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm/Baseline"
    echo "    <threshold>" 
    echo "        For the sd to be included in the script, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo ""
    exit
fi

#id0=$2;g0=$3;sd0=$4;threshold=$5;bs=$6;gs=$7
#id0=$2;g0=$3;sd0=$4;threshold=$5;bs=$6;gs=$7;lc0=$8
id0=$2;g0=$3;sd0=$4;threshold=$5;bs=$6;gs=$7;lc0=$8;sd1=$9;sd3=${10}

b0="vglab/T1w/Results"
w0="vglab/T1w/brainmask_fs.nii.gz"
c0=("Movement_AbsoluteRMS_mean.txt")

if [[ "${lc0}" != "INTERCEPT" && "${lc0}" != "SD" ]];then
    echo "lc0=${lc0}  Must be INTERCEPT or SD"
    exit
fi

#if [[ "${lc0}" = "INTERCEPT" ]];then
#    sd1="_Baseline_unscaled.nii.gz"
#    sd3="_Baseline_normbrainmask_mean.nii.gz"
#else
#    sd1="_res_eyesopen_sdTR.nii.gz"
#    sd3="_res_eyesopen_sdTR_normsd.nii.gz"
#fi

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo -e "#!/bin/bash\n" > $bs
rm -f $gs;touch $gs
declare -a sd

declare -a b2 
cnt=0
for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    echo ${line[0]}
    b1="${id0}/${line[0]}/${b0}"
    w1="${id0}/${line[0]}/${w0}"
    elephantpool=(${s0})

    str="${line[0]////_}"

    j0=0;k1=0;l0=0;unset sd;
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
                #elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
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
                        sd2=${sd0}/${str}_${j}${sd1}
                        w1=${id0}/${line[0]}/${w0}
                        if [ ! -f "${sd2}" ];then
                            echo "    **** ${sd2} does not exist ****"
                            g1=${g0}/${str}_${j}.glm
                            if [ ! -f "${g1}" ];then
                                echo "        **** ${g1} GLM does not exist ****"
                            else    
                                echo ${g1} >> $gs
                            fi
                        else
                            sd[l0]=${sd2}
                            b2[l0]=$j 
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

    echo "l0=${l0}"
    if((l0>=1));then


        #if [ ! -f "${w1}" ];then
        #    echo "    **** ${w1} does not exist ****"
        #else
        #    printf 'FILES=(' >> $bs
        #    for((j=0;j<${#sd[@]};++j));do
        #        if((j>0));then
        #            printf '       '  >> $bs
        #        fi
        #        printf '%s' "${sd[j]}" >> $bs
        #        if((j<(${#sd[@]}-1)));then
        #            printf ' \\\n' >> $bs
        #        else
        #            printf ')\n' >> $bs
        #        fi
        #    done
        #    printf 'MASK=%s\n' "${w1}" >> $bs
        #    printf 'OMEAN=%s\n' "${str}_Baseline_normbrainmask_mean.nii.gz" >> $bs
        #    printf '%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -omean $OMEAN -meanonly' >> $bs
        #fi

        ((cnt++))
        if [ ! -f "${w1}" ];then
            echo "    **** ${w1} does not exist ****"
        elif [[ "${lc0}" = "INTERCEPT" ]];then
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
            printf 'MASK=%s\n' "${w1}" >> $bs
            printf 'OMEAN=%s\n' "${str}${sd3}" >> $bs
            printf '%s%s\n\n' "${P0}" ' -files ${FILES[@]} -mask $MASK -omean $OMEAN -meanonly' >> $bs
        else
            for((j=0;j<${#sd[@]};++j));do
                printf 'FILE=%s\n' "${sd[j]}" >> $bs
                printf 'MASK=%s\n' "${w1}" >> $bs
                printf 'OMEAN=%s\n' "${str}_${b2[j]}${sd3}" >> $bs

                #printf '%s%s\n\n' "${P0}" ' -files $FILE -mask $MASK -omean $OMEAN -meanonly' >> $bs
                printf '%s%s\n\n' "${P0}" ' -files $FILE -mask $MASK -omean $OMEAN -meanonly -rms' >> $bs

            done
        fi



    fi
done
chmod +x $bs
echo "Output written to $gs"
#echo "Output written to $bs"
echo "Output written to $bs $cnt"

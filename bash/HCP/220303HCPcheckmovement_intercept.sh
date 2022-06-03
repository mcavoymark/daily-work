#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_avg_zstat3

#if [ ${#@} != 5 ];then
if [ ${#@} != 7 ];then

    echo "You have provided ${#@} parameters."

    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <threshold> <script to be written>" 
    echo "$0 <MRI.dat> <hcp dir> <glm dir> <threshold> <script to be written> <estimate name eg. Baseline> <scaled or unscaled>" 

    echo "    This program can be used to check for the existence of glms"
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
    echo "    <threshold>" 
    echo "        For the sd to be included in the script, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo ""
    exit
fi
#id0=$2;gd=$3;threshold=$4;bs=$5
id0=$2;gd=$3;threshold=$4;bs=$5;e0=$6;scl0=$7

b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
m0="vglab/T1w/brainmask_fs.nii.gz"
c0=("Movement_AbsoluteRMS_mean.txt")

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo -e "#!/bin/bash\n" > $bs

declare -a bolds
declare -a sd 
cnt=0

#for((i=2;i<${#csv[@]};++i));do
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}

    if [[ "${line[0]:0:1}" = "#" ]];then
        echo "Skipping line $((l+1)): ${line[0]}"
        continue
    fi


    s0=${line[0]}
    echo ${s0}
    b1="${id0}/${s0}/${b0}"
    w1="${id0}/${s0}/${w0}"
    m1="${id0}/${s0}/${m0}"
    elephantpool=(${s0})

    #str="${s0////_}"
    str="${line[0]////_}"

    unset bolds
    unset sd
    lcbolds=0
    j0=0;k1=0;l0=0;flag=0
    for j in ${line[@]:4:4};do
        ((j0++))
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then



            superbird=${j}
            if [ -d "${b1}/${superbird}" ];then
                lovepirate=${b1}/${superbird}/${superbird}.nii.gz
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[j0]="File ${lovepirate} does not exist"
                    #elephantpool[((j0+4))]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                    continue
                fi
            else 
                elephantpool[j0]="Directory ${b1}/${superbird} does not exist"
                #elephantpool[((j0+4))]="Directory ${b1}/${superbird} does not exist"
                #echo "        ${elephantpool[j0]}"
                superbird+=_slctmd
                lovepirate=${b1}/${superbird}/${superbird}.nii.gz
                if [ ! -f "${lovepirate}" ];then
                    elephantpool[j0]="File ${lovepirate} does not exist"
                    #elephantpool[((j0+4))]="File ${lovepirate} does not exist"
                    echo "        ${elephantpool[j0]}"
                    continue
                fi
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

                    glm0="${gd}/${str}_${j}.glm"
                    if [ ! -f "${glm0}" ];then
                        echo "    **** ${glm0} does not exist ****"
                    fi

                    if(( $(echo "${elephantpool[k0]} < ${threshold}" |bc -l) ));then
                        #echo "        ${lovepirate} ${elephantpool[k0]}"

                        #glm0="${gd}/${str}_${superbird}.glm"
                        #glm0="${gd}/${str}_${j}.glm"

                        #if [ ! -f "${glm0}" ];then
                        #    echo "File ${glm0} does not exist"
                        #else
                        if [ -f "${glm0}" ];then
                            #echo "here2 ${glm0} ${elephantpool[k0]}"
                            #echo "${glm0}" >> $bs
                            #echo "${w1}" >> $bs
                            #sd[l0]=${sd0}
                            #((l0++))

                            #echo ${glm0}
                            #more ${glm0} | grep Baseline -a -A 2 -m 1

                            #bl0=($(more ${glm0} | grep Baseline -a -A 2 -m 1))
                            bl0=($(more ${glm0} | grep ${e0} -a -A 2 -m 1))

                            ((tc0=${bl0[((${#bl0[@]}-1))]}+1))
                            #echo "tc0=${tc0}"

                            printf 'GLM=%s\n' "${glm0}" >> $bs
                            printf 'TC=%s\n' "${tc0}" >> $bs
                            printf 'MASK=%s\n' "${m1}" >> $bs
                            #printf 'NAME=%s\n' "${str}_${superbird}" >> $bs
                            #printf '%s%s\n\n' "${P0}" ' -glm_files $GLM -tc $TC -mask $MASK -print_unscaled_tc -dont_print_scaled_tc' >> $bs
                            #START210913
                            if [ "${scl0}" == "unscaled" ];then
                                printf '%s%s\n\n' "${P0}" ' -glm_files $GLM -tc $TC -mask $MASK -print_unscaled_tc -dont_print_scaled_tc' >> $bs
                            elif [ "${scl0}" == "scaled" ];then
                                printf '%s%s\n\n' "${P0}" ' -glm_files $GLM -tc $TC -mask $MASK' >> $bs
                            else
                                echo "Unknown option ${scl0}"
                                exit
                            fi
                            ((!flag)) && ((cnt++))
                            flag=1
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

done
chmod +x $bs 
echo "Output written to $bs  $cnt"

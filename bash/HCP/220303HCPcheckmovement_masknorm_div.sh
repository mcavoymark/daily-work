#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_masknorm

#if [ ${#@} != 10 ];then
if [ ${#@} != 13 ];then

    echo "You have provided ${#@} parameters."

    #echo "$0 <MRI.dat> <hcp dir> <glm dir> <intercept dir> <sd dir or NONE> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts> <INTERCEPT or SD> <SPATMEAN or NOSPATMEAN>" 
    3echo "$0 <MRI.dat> <hcp dir or NONE to not check movement> <glm dir> <intercept dir> <sd dir or NONE> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts> <INTERCEPT or SD> <SPATMEAN or NOSPATMEAN> <intercept root> <sd root or NONE> <out root>"
    echo "$0 <MRI.dat> <hcp dir or NONE to not check movement> <glm dir> <intercept dir> <sd dir or NONE> <threshold> <fidl_masknorm script to be written> <glm list to be written for missing intercepts> <INTERCEPT, SD or GLM> <SPATMEAN or NOSPATMEAN> <intercept root> <sd root or NONE> <out root>"

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
    echo "    <sd dir or NONE>" 
    echo "        Location of sds"
    echo "        Eg. /vgpool/data1/mcavoy/HCP/conc/glm/sd"
    echo "    <threshold>" 
    echo "        For the sd to be included in the script, absolute movement for the run must be less than the threshold."
    echo "        Eg. 1.5"
    echo "    <INTERCEPT or SD>" 
    echo "        If INTERCEPT, then intercept is normalized to the sd (ie ~coefficient of determination)"
    echo "        If SD, then sd is normalized to the intercept (ie ~coefficient of variation)"
    echo "    <SPATMEAN or NOSPATMEAN>" 
    echo "        If NOSPATMEAN, then option -nospatialmean is invoked in the fidl_masknorm call"
    echo ""
    exit
fi

#id0=$2;g0=$3;bd0=$4;sd0=$5;threshold=$6;bs=$7;gs=$8;lc0=$9;lc1=${10}
id0=$2;g0=$3;bd0=$4;sd0=$5;threshold=$6;bs=$7;gs=$8;lc0=$9;lc1=${10};bd1=${11};sd1=${12};sd3=${13}

b0="vglab/T1w/Results"
w0="vglab/T1w/brainmask_fs.nii.gz"
c0=("Movement_AbsoluteRMS_mean.txt")

#if [[ "${lc0}" != "INTERCEPT" && "${lc0}" != "SD" ]];then
#    echo "lc0=${lc0}  Must be INTERCEPT or SD"
#    exit
#fi
#START220113
if [[ "${lc0}" != "INTERCEPT" && "${lc0}" != "SD" && "${lc0}" != "GLM" ]];then
    echo "lc0=${lc0}  Must be INTERCEPT or SD"
    exit
fi

if [[ "${lc1}" != "SPATMEAN" && "${lc1}" != "NOSPATMEAN" ]];then
    echo "lc1=${lc1}  Must be SPATMEAN or NOSPATMEAN"
    exit
fi
nospatialmean=
[[ "${lc1}" = "NOSPATMEAN" ]] && nospatialmean="-nospatialmean"

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo -e "#!/bin/bash\n" > $bs
rm -f $gs;touch $gs
declare -a sd;declare -a bd;declare -a wd;declare -a jd;declare -a gd

cnt0=0;cnt=0
#for((i=2;i<${#csv[@]};++i));do
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}

    if [[ "${line[0]:0:1}" = "#" ]];then
        echo "Skipping line $((l+1)): ${line[0]}"
        continue
    fi

    echo ${line[0]}
    str="${line[0]////_}"

    l0=0;unset sd;unset bd;
    if [ "${id0}" = "NONE" ];then
        ((cnt0++))
        flag=0
        if [[ "${sd0}" != "NONE" ]];then
            sd2=${sd0}/${str}${sd1}
            if [ ! -f "${sd2}" ];then
                echo "    **** ${sd2} does not exist ****"
                flag=1
            fi
        fi
        bd2=${bd0}/${str}${bd1}
        if [ ! -f "${bd2}" ];then
            echo "    **** ${bd2} does not exist ****"
            flag=1
        fi
        if((flag==0));then
            [[ "${sd0}" != "NONE" ]] && sd[l0]=${sd2}
            bd[l0]=${bd2}
            ((l0++))
        fi 
    else
        ((cnt0++))

        b1="${id0}/${line[0]}/${b0}"
        w1="${id0}/${line[0]}/${w0}"
        elephantpool=(${line[0]})

        #j0=0;k1=0;l0=0;unset sd;unset bd;unset wd;unset jd
        j0=0;k1=0;unset wd;unset jd

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
                            flag=0
                            if [[ "${sd0}" != "NONE" ]];then
                                sd2=${sd0}/${str}_${j}${sd1}
                                if [ ! -f "${sd2}" ];then
                                    echo "    **** ${sd2} does not exist ****"
                                    flag=1
                                fi
                            fi

                            #bd2=${bd0}/${str}_${j}${bd1}
                            #if [ ! -f "${bd2}" ];then
                            #    echo "    **** ${bd2} does not exist ****"
                            #    flag=1
                            #fi
                            if [[ "${bd1}" != "NONE" ]];then
                                bd2=${bd0}/${str}_${j}${bd1}
                                if [ ! -f "${bd2}" ];then
                                    echo "    **** ${bd2} does not exist ****"
                                    flag=1
                                fi
                            fi

                            g1=${g0}/${str}_${j}.glm
                            if((flag==1));then
                                #g1=${g0}/${str}_${j}.glm
                                if [ ! -f "${g1}" ];then
                                    echo "        **** ${g1} GLM does not exist ****"
                                else
                                    echo ${g1} >> $gs
                                fi
                            else
                                [[ "${sd0}" != "NONE" ]] && sd[l0]=${sd2}
                                bd[l0]=${bd2}
                                wd[l0]=${lovepirate}
                                jd[l0]=${j}
                                gd[l0]=${g1}
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
    fi

    echo "l0=${l0}"
    if((l0>=1));then
        if [[ ! -f "${w1}" && "${id0}" != "NONE" ]];then
            echo "    **** ${w1} does not exist ****"
        elif [[ "${lc0}" = "INTERCEPT" ]];then
            printf 'FILES=(' >> $bs
            for((j=0;j<${#bd[@]};++j));do
                if((j>0));then
                    printf '       '  >> $bs
                fi
                printf '%s' "${bd[j]}" >> $bs
                if((j<(${#bd[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
            if [[ "${sd0}" != "NONE" ]];then
                printf 'DIV=(' >> $bs
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
            fi
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
            printf 'MASK=%s\n' "${w1}" >> $bs
            printf 'OMEAN=%s\n' "${str}${sd3}" >> $bs
            if [[ "${sd0}" != "NONE" ]];then
                #printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -div ${DIV[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -mask $MASK -omeanroot $OMEANROOT -meanonly ' "$nospatialmean" >> $bs
                printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -div ${DIV[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -mask $MASK -omeanroot $OMEANROOT -wmeanonly ' "$nospatialmean" >> $bs
            else
                #printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -mask $MASK -omean $OMEAN -meanonly ' "$nospatialmean" >> $bs
                printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -mask $MASK -omean $OMEAN -wmeanonly ' "$nospatialmean" >> $bs
            fi
            ((cnt++))

        #else
        elif [[ "${lc0}" = "SD" ]];then

            for((j=0;j<${#sd[@]};++j));do
                printf 'FILE=%s\n' "${sd[j]}" >> $bs
                printf 'DIV=%s\n' "${bd[j]}" >> $bs
                [ "${id0}" != "NONE" ] && printf 'MASK=%s\n' "${w1}" >> $bs
                printf 'OMEAN=%s\n' "${str}_${jd[j]}${sd3}" >> $bs
                if [ "${id0}" != "NONE" ];then
                    printf '%s%s%s\n\n' "${P0}" ' -files $FILE -div $DIV -mask $MASK -omean $OMEAN -wmeanonly ' "$nospatialmean" >> $bs
                else
                    printf '%s%s%s\n\n' "${P0}" ' -files $FILE -div $DIV -omean $OMEAN ' "$nospatialmean" >> $bs
                fi
            done
            ((cnt++))

        else
            printf 'FILES=(' >> $bs
            for((j=0;j<${#gd[@]};++j));do
                if((j>0));then
                    printf '       '  >> $bs
                fi
                printf '%s' "${gd[j]}" >> $bs
                if((j<(${#gd[@]}-1)));then
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
            printf 'OMEAN=%s\n' "${str}" >> $bs
            printf '%s%s%s\n\n' "${P0}" ' -files ${FILES[@]} -Movement_AbsoluteRMS_mean ${MARMSm[@]} -omean $OMEAN -wmeanonly ' "$nospatialmean" >> $bs
            ((cnt++))

        fi
    fi
done
chmod +x $bs
echo "Output written to $gs"
echo ${1}
echo "    Number of subjects = ${cnt0}"
echo "Output written to $bs"
echo "    Number of subjects = ${cnt}"

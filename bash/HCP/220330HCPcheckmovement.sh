#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster
P1=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET
P2=/home/usr/mcavoy/FIDL/build/fidl_bolds
P3=/home/usr/mcavoy/FIDL/build/fidl_separate_lut

#START220125
P4=/home/usr/mcavoy/FIDL/build/fidl_residuals
P5=/home/usr/mcavoy/FIDL/build/fidl_tc_ss

lut0=/usr/local/pkg/freesurfer6.0/FreeSurferColorLUT.txt #crushable
labels0=(fdg ho om ogi oef)

if [ ${#@} != 12 ];then

    echo "You have provided ${#@} parameters."

    echo "$0 <MRI.dat> <hcp dir or NONE to not check movement or output labels (TXT2)> <glm dir or region dir (TC or TC2)> <sd dir, PET dir (TC or TC2) or NONE> <rms dir> <threshold> <script to be written, includes wmparc> <glm list, conc (TC) or conc root (TC2) to be written> <VOX, REG, TXT, TC, TC2, TXT2, AGE> <sd, intercept root, PET and region file root sans ext (TC), or NONE (TC2)> <rms, mean root or NONE> <cluster.list, lut (TC) or list of cluster lists (TC2)>" 

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
id0=$2;g0=$3;sd0=$4;r0=$5;threshold=$6;bs=$7;gs=$8;metric=$9;sd1=${10};r1=${11};cluster0=${12}

#if [[ "$metric" != "VOX" && "$metric" != "REG" && "$metric" != "TXT" && "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TXT2" && "$metric" != "AGE" && "$metric" != "PETSTACK" && "$metric" != "PETSTACKCONC" && "$metric" != "TC3" && "$metric" != "AGE2" && "$metric" != "TC4" && "$metric" != "AGE3" && "$metric" != "SEPARATE" && "$metric" != "WITHPET" && "$metric" != "TC5" && "$metric" != "GLMWMPARCLIST" && "$metric" != "ING10000" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" ]];then
#    echo "metric = $metric  Unknown. Needs to be either VOX, REG, TXT, TC, TC2, TXT2, AGE, PETSTACK, PETSTACKCONC, TC3, AGE2, TC4, AGE3, SEPARATE, WITHPET, TC5, GLMWMPARCLIST, ING10000, MEANTR,SDTR or TC4CONC"
#    exit
#fi
#START220305
if [[ "$metric" != "VOX" && "$metric" != "REG" && "$metric" != "TXT" && "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TXT2" && "$metric" != "AGE" && "$metric" != "PETSTACK" && "$metric" != "PETSTACKCONC" && "$metric" != "TC3" && "$metric" != "AGE2" && "$metric" != "TC4" && "$metric" != "AGE3" && "$metric" != "SEPARATE" && "$metric" != "WITHPET" && "$metric" != "TC5" && "$metric" != "GLMWMPARCLIST" && "$metric" != "ING10000" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC"  && "$metric" != "WMH" ]];then
    echo "metric = $metric  Unknown. Needs to be either VOX, REG, TXT, TC, TC2, TXT2, AGE, PETSTACK, PETSTACKCONC, TC3, AGE2, TC4, AGE3, SEPARATE, WITHPET, TC5, GLMWMPARCLIST, ING10000, MEANTR, SDTR, TC4CONC or WMH"
    exit
fi





if [[ "$1" = "NONE" ]];then
    echo -e "#!/bin/bash\n" > $bs
    echo -e "P0=${gs}\n" >> $bs
    superbird=($(more ${cluster0}))
    for((j=0;j<${#superbird[@]};++j));do
        IFS=$'\n' read -d '' -ra csv0 < ${superbird[j]}
        roinames=(${roinames[@]} ${csv0[@]})
    done
    elephantpool=($(more ${g0}))

    #lovepirate=($(more ${sd0}))
    #START220311
    [ "${sd0}" != "NONE" ] && lovepirate=($(more ${sd0}))

    for((i=0;i<${#roinames[@]};++i));do
        echo "${roinames[i]}"

        #printf 'FILES=(' >> $bs
        #START220311
        [ "${sd0}" != "NONE" ] && printf 'FILES=(' >> $bs || printf 'AGE=(' >> $bs

        for((j=0;j<${#elephantpool[@]};++j));do
            if((j>0));then

                #printf '       '  >> $bs
                #START220311
                [ "${sd0}" != "NONE" ] && printf '       '  >> $bs || printf '     '  >> $bs 

            fi

            #printf '%s' "${id0}/${elephantpool[j]}_${roinames[i]}.ext" >> $bs
            #START220311
            [ "${r1}" = "NONE" ] && superbird="${id0}/${elephantpool[j]}_${roinames[i]}.ext" || superbird="${id0}/${elephantpool[j]}_${r1}_${roinames[i]}.ext"
            printf '%s' "${superbird}" >> $bs

            if((j<(${#elephantpool[@]}-1)));then
                printf ' \\\n' >> $bs
            else
                printf ')\n' >> $bs
            fi
        done

        #printf 'AGE=(' >> $bs
        #for((j=0;j<${#lovepirate[@]};++j));do
        #    if((j>0));then
        #        printf '     '  >> $bs
        #    fi
        #    printf '%s' "${lovepirate[j]}" >> $bs
        #    if((j<(${#lovepirate[@]}-1)));then
        #        printf ' \\\n' >> $bs
        #    else
        #        printf ')\n' >> $bs
        #    fi
        #done
        #echo "OUT=${r0}/${roinames[i]}.ext" >> $bs
        #echo -e '${P0} -files ${FILES[@]} -age ${AGE[@]} -out $OUT'"\n" >> $bs
        #START220311
        if [ "${sd0}" != "NONE" ];then 
            printf 'AGE=(' >> $bs
            for((j=0;j<${#lovepirate[@]};++j));do
                if((j>0));then
                    printf '     '  >> $bs
                fi
                printf '%s' "${lovepirate[j]}" >> $bs
                if((j<(${#lovepirate[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
        fi
        [ "${r1}" = "NONE" ] && echo "OUT=${r0}/${roinames[i]}.ext" >> $bs || echo "OUT=${r0}/${r1}_${roinames[i]}.ext" >> $bs
        [ "${sd0}" != "NONE" ] && echo -e '${P0} -files ${FILES[@]} -age ${AGE[@]} -out $OUT'"\n" >> $bs || echo -e '${P0} -age ${AGE[@]} -out $OUT'"\n" >> $bs

    done
    chmod +x $bs
    echo "Output written to $bs"
    exit
elif [[ "$1" = "CONC" ]];then
    rm -f $bs;touch $bs
    superbird=($(more ${cluster0}))
    for((j=0;j<${#superbird[@]};++j));do
        IFS=$'\n' read -d '' -ra csv0 < ${superbird[j]}
        roinames=(${roinames[@]} ${csv0[@]})
    done
    elephantpool=($(more ${g0}))
    [[ "${r1}" != "NONE" && "${r1}" != "dummy" ]] && lovepirate=${r1} || lovepirate=

    #for((i=0;i<${#roinames[@]};++i));do
    #    echo "${roinames[i]}"
    #    o0=${r0}/${roinames[i]}.conc
    #    for((j=0;j<${#elephantpool[@]};++j));do
    #        c0=${id0}/${elephantpool[j]}_${roinames[i]}.conc 
    #        echo $c0
    #        if((j==0));then
    #            $(cat ${c0} > ${o0})
    #        else
    #            $(cat ${c0} >> ${o0})
    #        fi
    #    done
    #    echo "Output written to $o0"
    #    echo $o0 >> $bs
    #    echo $gs/${roinames[i]}.ext >> $bs 
    #done
    #START220314
    if [ "${sd0}" = "NONE" || "${sd0}" = "dummy" ];then
        for((i=0;i<${#roinames[@]};++i));do
            echo "${roinames[i]}"
            o0=${r0}/${roinames[i]}.conc
            for((j=0;j<${#elephantpool[@]};++j));do
                c0=${id0}/${elephantpool[j]}_${roinames[i]}.conc
                if((j==0));then
                    $(cat ${c0} > ${o0})
                else
                    $(cat ${c0} >> ${o0})
                fi
            done
            echo "Output written to $o0"
            echo $o0 >> $bs
            echo $gs/${lovepirate}${roinames[i]}.ext >> $bs
        done
    else 
        IFS=$',\n' read -d '' -ra crb <<< ${sd0}
        for((i=0;i<${#roinames[@]};++i));do
            echo "${roinames[i]}"

            #o0=${r0}/${roinames[i]}.conc
            o0=${r0}/${lovepirate}${crb[0]}_${roinames[i]}.conc

            for((j=0;j<${#elephantpool[@]};++j));do
                c0=${id0}/${elephantpool[j]}_${roinames[i]}.conc
                if((j==0));then
                    $(cat ${c0} > ${o0})
                else
                    $(cat ${c0} >> ${o0})
                fi
            done
            #echo "Output written to $o0"
            for((j=0;j<${#crb[@]};++j));do
                if((j==0));then
                    o1=${o0} 
                else
                    o1=${r0}/${lovepirate}${crb[j]}_${roinames[i]}.conc
                    cp $o0 $o1 
                fi
                echo $o1 >> $bs
                echo $gs/${lovepirate}${crb[j]}_${roinames[i]}.ext >> $bs
            done
        done
    fi

    echo "Output written to $bs"
    exit
elif [[ "$1" = "SHORT" ]];then
    rm -f $bs;touch $bs
    superbird=($(more ${cluster0}))
    for((j=0;j<${#superbird[@]};++j));do
        IFS=$'\n' read -d '' -ra csv0 < ${superbird[j]}
        roinames=(${roinames[@]} ${csv0[@]})
    done
    for((i=0;i<${#roinames[@]};++i));do
        echo "${roinames[i]}"
        echo "${roinames[i]}" >> $bs
        o0=${r0}/${roinames[i]}_short.txt
        $(cat ${o0} >> $bs)
        echo '' >> $bs
    done
    echo "Output written to $bs"
    exit
elif [[ "$1" = "PETTC" ]];then
    echo -e "#!/bin/bash\n" > $bs
    echo -e "P0=${gs}\n" >> $bs
    superbird=($(more ${cluster0}))
    for((j=0;j<${#superbird[@]};++j));do
        IFS=$'\n' read -d '' -ra csv0 < ${superbird[j]}
        roinames=(${roinames[@]} ${csv0[@]})
    done
    for((i=0;i<${#roinames[@]};++i));do
        echo "${roinames[i]}"
        echo "GLM_FILES=(${id0}/${roinames[i]}.glm)" >> $bs
        echo "TC=(1 2 3 5 6 7 9 10 11 13 14 15)" >> $bs
        echo "REGIONAL_AVGSTAT_NAME=(${roinames[i]}.txt)" >> $bs
        echo "FRAMES=(1 1 1 1 1 1 1 1 1 1 1 1)" >> $bs 
        echo -e '${P0} -glm_files ${GLM_FILES[@]} -tc ${TC[@]} -frames ${FRAMES[@]} -regional_avgstat_name ${REGIONAL_AVGSTAT_NAME[@]} -within_subject_sd -print_unscaled_tc -dont_print_scaled_tc -columns'"\n" >> $bs
    done
    chmod +x $bs
    echo "Output written to $bs"
    exit
elif [[ "$1" = "PLOT" ]];then
    rm -f $bs;touch $bs
    superbird=($(more ${cluster0}))
    for((j=0;j<${#superbird[@]};++j));do
        IFS=$'\n' read -d '' -ra csv0 < ${superbird[j]}
        roinames=(${roinames[@]} ${csv0[@]})
    done
    echo ${#roinames[@]}
    elephantpool=($(more ${g0}))
    printf '\t%s' "${roinames[@]}" >> $bs;printf '\n' >> $bs
    for((i=0;i<12;++i));do
        printf '%s' "${elephantpool[i]}" >> $bs
        for((j=0;j<${#roinames[@]};++j));do
            IFS=$'\n' read -d '' -ra csv0 < ${id0}/${roinames[j]}.txt
            IFS=$'\n\t ' read -d '' -ra line <<< ${csv0[((i+4))]}
            printf '\t%s %s' "${line[1]} ${line[2]}" >> $bs
        done
        printf '\n' >> $bs
    done
    echo "Output written to $bs" 
    exit
fi
if [[ "$metric" = "TC" || "$metric" = "TC3" || "$metric" = "TC4" || "$metric" = "SEPARATE" || "$metric" = "TC5" ]];then
    lut0=${12}
fi

echo "sd1=${sd1}"
echo "r1=${r1}"

cl1=${cluster0##*/}
cl1=_${cl1%%.*}
echo "cl1=${cl1}"

b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
c0=("Movement_AbsoluteRMS_mean.txt")
bm0="vglab/T1w/brainmask_fs.nii.gz"

#START220119
nl0="_nonlin_mask.nii.gz"

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

if [[ "$metric" = "WITHPET" ]];then
    IFS=$'\n' read -d '' -ra withpet0 < ${cluster0}
    echo ${csv[0]} > $bs 
    echo ${csv[1]} >> $bs 
elif [[ "$metric" = "ING10000" || "$metric" = "MEANTR" || "$metric" = "SDTR" ]];then
    dir=${bs%/*}
    mkdir -p $dir
    echo -e "#!/bin/bash\n" > $bs
    if [[ "$metric" = "MEANTR" || "$metric" = "SDTR" ]];then
        scratchdir=${r0}/SCRATCH_$(date +%y%m%d%H%M%S)/
        echo "scratchdir=$scratchdir"
        mkdir -p $scratchdir
    fi


#elif [[ "$metric" != "AGE" && "$metric" != "PETSTACKCONC" && "$metric" != "AGE2" && "$metric" != "AGE3" && "$metric" != "GLMWMPARCLIST" ]];then
#START220306
elif [[ "$metric" != "AGE" && "$metric" != "PETSTACKCONC" && "$metric" != "AGE2" && "$metric" != "AGE3" && "$metric" != "GLMWMPARCLIST" && "$metric" != "WMH" ]];then

    if [[ "${lut0}" != "NONE" && "$bs" != "NONE" ]];then
        echo -e "#!/bin/bash\n" > $bs
        echo "LUT=$lut0" >> $bs
    else
        rm -f $gs
    fi

fi

if [[ "$metric" = "TXT" ]];then
    printf 'CLUSTER=(' >> $bs
    for((j=0;j<${#cluster0[@]};++j));do
        if((j>0));then
            printf '         '  >> $bs
        fi
        printf '%s' "${cluster0[j]}" >> $bs
        if((j<(${#cluster0[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    labels0=(fdg ho om)
    if [[ "${sd0}" != "NONE" ]];then
        IFS=$',\n' read -d '' -ra labels0 <<< ${sd0}
        echo "labels0=${labels0[@]}"
    fi
    IFS=$',\n' read -d '' -ra superbird <<< ${g0}
    printf 'LABELS=(' >> $bs
    for((j=0;j<${#superbird[@]};++j));do
        printf '%s' "${superbird[j]}" >> $bs
        if((j<(${#superbird[@]}-1)));then
            printf ' ' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    echo "out=${gs}${cl1}.ext" >> $bs
elif [[ "$metric" = "PETSTACK" ]];then
    labels0=(fdg ho om)

    if [[ "${sd0}" != "NONE" ]];then
        IFS=$',\n^M' read -d '' -ra labels0 <<< ${sd0}
        echo "labels0=${labels0[@]}"
    fi

    echo -e "P0=${gs}\n" >> $bs
    superbird=($(more ${g0}))
    printf 'CLUSTER=(' >> $bs
    for((j=0;j<${#superbird[@]};++j));do
        if((j>0));then
            printf '         '  >> $bs
        fi
        printf '%s' "${superbird[j]}" >> $bs
        if((j<(${#superbird[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    echo "out=${cluster0}" >> $bs
elif [[ "$metric" = "PETSTACKCONC" ]];then
    labels0=(fdg ho om)
    if [[ "${sd0}" != "NONE" ]];then
        IFS=$',\n^M' read -d '' -ra labels0 <<< ${sd0}
        echo "labels0=${labels0[@]}"
    fi
    for((j=0;j<${#labels0[@]};++j));do
        #echo "$bs/${labels0[j]}.conc"
        #conc0=($conc0 $bs/${labels0[j]}.conc)
        #conc0[j]=$bs/${gs}_${labels0[j]}.conc
        #conc0[j]=$bs/${gs}_${labels0[j]}_${cluster0}.conc
        conc0[j]=$bs/${gs}_${labels0[j]}
        if [[ "${cluster0}" != "NONE" ]];then
            conc0[j]=${conc0[j]}_${cluster0}
        fi
        conc0[j]=${conc0[j]}.conc

        rm -f ${conc0[j]};touch ${conc0[j]}
    done
    #echo "${#conc0[@]}"
    #echo "${conc0[@]}"
    #exit

elif [[ "$metric" = "TXT2" ]];then
    IFS=$',\n' read -d '' -ra labels0 <<< ${sd1}

    IFS=$',\n' read -d '' -ra superbird <<< ${g0}
    printf 'LABELS=(' >> $bs
    for((j=0;j<${#superbird[@]};++j));do
        printf '%s' "${superbird[j]}" >> $bs
        if((j<(${#superbird[@]}-1)));then
            printf ' ' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done

    IFS=$'\n' read -d '' -ra roinames < ${cluster0} 
    printf '%s\n' "${roinames[@]}"
    echo "${#roinames[@]}"

    printf 'ROINAMES=(' >> $bs
    for((j=0;j<${#roinames[@]};++j));do
        if((j>0));then
            printf '          '  >> $bs
        fi
        printf '%s' "${roinames[j]}" >> $bs
        if((j<(${#roinames[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    echo ''>> $bs
    echo 'for((i=0;i<${#ROINAMES[@]};++i));do' >> $bs
    echo "    out=${gs}_"'${ROINAMES[i]}.ext' >> $bs

elif [[ "$metric" = "AGE" ]];then
    labels0=(fdg ho om)
    IFS=$'\n' read -d '' -ra age0 < $cluster0
    #echo 'age' > $bs
    echo ${g0} > $bs
elif [[ "$metric" = "AGE2" || "$metric" = "AGE3" ]];then
    labels0=${r1}
    IFS=$'\n' read -d '' -ra age0 < $cluster0
    echo ${g0} > $bs
    rm -f $gs;touch $gs
elif [[ "$metric" = "TC5" ]];then
    IFS=$',\n' read -d '' -ra r1 <<< ${r1}
    echo "r1=${r1[@]}"
elif [[ "$metric" = "GLMWMPARCLIST" ]];then
    rm -f $bs;touch $bs

#START220305
elif [[ "$metric" = "WMH" ]];then

    #START220330
    wmhdat0=${1%.*}_${metric}.dat 
    #echo "wmhdat0=$wmhdat0"
    #exit
    rm -f ${wmhdat0};touch ${wmhdat0}


    #IFS=$'\n' read -d '' -ra wmh0 < ${g0}
    #START220306
    IFS=$'\n' read -d '' -ra wmh0 < ${sd0}

    rm -f ${sd1};touch ${sd1};rm -f ${bs};touch ${bs};rm -f ${gs};touch ${gs};
    IFS=$'\n' read -d '' -ra age0 < $cluster0



elif [[ "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TC3" && "$metric" != "TC4" && "$metric" != "SEPARATE" && "$metric" != "WITHPET" && "$metric" != "GLMWMPARCLIST" && "$metric" != "ING10000" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" ]];then
#START220305
#elif [[ "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TC3" && "$metric" != "TC4" && "$metric" != "SEPARATE" && "$metric" != "WITHPET" && "$metric" != "GLMWMPARCLIST" && "$metric" != "ING10000" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" && "$metric" != "WMH" ]];then

    if [[ "$metric" = "VOX" ]];then
        cluster0=($(more ${cluster0}))
    fi
    printf 'CLUSTER=(' >> $bs
    for((j=0;j<${#cluster0[@]};++j));do
        if((j>0));then
            printf '         '  >> $bs
        fi
        printf '%s' "${cluster0[j]}" >> $bs
        if((j<(${#cluster0[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
fi

#if [[ "$metric" != "TC2" && "$metric" != "AGE" && "$metric" != "AGE2" && "$metric" != "AGE3" && "$metric" != "PETSTACKCONC" && "$metric" != "WITHPET" ]];then
#START220306
if [[ "$metric" != "TC2" && "$metric" != "AGE" && "$metric" != "AGE2" && "$metric" != "AGE3" && "$metric" != "PETSTACKCONC" && "$metric" != "WITHPET" && "$metric" != "WMH" ]];then

    if [[ "${cluster0}" != "NONE" ]];then
        echo '' >> $bs
    fi
fi

bs0=0;r2i=0;bs1=0;cnt0=0
for((i=0;i<${#csv[@]};++i));do

    IFS=$',\n ' read -ra line <<< ${csv[i]}

    if [[ "${line[0]:0:1}" = "#" ]];then
        echo "Skipping line $((l+1)): ${line[0]}"
        continue
    fi
    ((cnt0++))

    echo ${line[0]}
    str="${line[0]////_}"

    #IFS=$',\n/ ' read -ra s0 <<< ${csv[i]}
    #START220306
    root=${line[0]%%/*};s0=$root
    root1=${line[0]##*/}

    if [[ "${id0}" = "NONE" || $threshold = "NONE" ]];then
        lcsd=1
        #r2=${r0}/${str}${r1}
    else
        lcsd=0
        b1="${id0}/${line[0]}/${b0}"
        w1="${id0}/${line[0]}/${w0}"
        bm1="${id0}/${line[0]}/${bm0}"
        elephantpool=
        j0=0;k1=0;lcblank=0
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

                    #lovepirate=${b1}/${superbird}/${k}
                    #if [ ! -f "${lovepirate}" ];then
                    #    elephantpool[k0]="File ${lovepirate} does not exist"
                    #    echo "        ${elephantpool[j0]}"
                    #else
                    #    elephantpool[k0]=$(more ${lovepirate})
                    #START220119
                    mo0=${b1}/${superbird}/${k}
                    if [ ! -f "${mo0}" ];then
                        elephantpool[k0]="File ${mo0} does not exist"
                        echo "        ${elephantpool[j0]}"
                    else
                        elephantpool[k0]=$(more ${mo0})


                        if(( $(echo "${elephantpool[k0]} < ${threshold}" |bc -l) ));then
                            if [[ "$metric" = "GLMWMPARCLIST" ]];then
                                g1=${g0}/${str}_${j}.glm
                                echo ${g1} >> $bs
                                echo ${w1} >> $bs
                            elif [[ "$metric" = "ING10000" ]];then
                                echo "fslmaths ${lovepirate} -mas ${bm1} -mas ${id0}/${line[0]}/vglab/${superbird}/${superbird}${nl0} -thr 0 -ing 10000 ${r0}/${str}_${superbird}_ing10k.nii.gz -odt float" >> $bs
                                lcblank=1
                            elif [[ "$metric" = "MEANTR" || "$metric" = "SDTR" ]];then # see old/211101glm_sd.sh
                                g1=${g0}/${str}_${j}.glm
                                if [ ! -f "${g1}" ];then
                                    echo "        **** ${g1} GLM does not exist ****"
                                    continue
                                fi
                                conc0=($(more ${g1} | grep "name of data file" -a -m 1))
                                conc0=${conc0[((${#conc0[@]}-1))]}
                                if [ ! -f "${conc0}" ];then
                                    echo "        **** ${conc0} does not exist ****"
                                    continue
                                fi
                                mask0=($(more ${g1} | grep "glm mask file" -a -m 1))
                                mask0=${mask0[((${#mask0[@]}-1))]}
                                if [ ! -f "${mask0}" ];then
                                    mask0=${gs}/${mask0##*/}
                                    if [ ! -f "${mask0}" ];then
                                        continue
                                        echo "        **** ${mask0} does not exist ****"
                                    fi
                                fi

                                tc2=
                                if [ "${sd1}" != "NONE" ];then 
                                    tc2=" -retain_estimates"
                                    IFS=$'\n, ' read -d '' -ra tc0 <<< ${sd1}
                                    for((l0=0;l0<${#tc0[@]};++l0));do
                                        tc1=($(more ${g1} | grep ${tc0[l0]} -a -A 2 -m 1))
                                        ((tc1=${tc1[((${#tc1[@]}-1))]}+1))
                                        tc2+=" ${tc1}"
                                    done
                                fi
                                [[ "$metric" = "MEANTR" ]] && tc3="-meanTR" || tc3="-sdTR" 

                                root0=${str}_${j}_res
                                root2=${str}_${j}
                                tc_files=${scratchdir}${root0}.conc
                                echo "${P4} -glm_file ${g1} -bold_files ${conc0}${tc2} -mask ${mask0} -root ${root0} -scratchdir ${scratchdir} -float" >> $bs
                                echo -e "${P5} -tc_names eyesopen -tc_cond 0 -root ${root2} -tc_files ${tc_files} -cond_and_frames ${sd0} -mask ${mask0} ${tc3} -clean_up\n" >> $bs
                                lcblank=1

                            #elif [[ "${sd1}" = "NONE" || "$metric" = "TC" || "$metric" = "TC2" || "$metric" = "TC3" || "$metric" = "TC4" || "$metric" = "SEPARATE" || "$metric" = "TC5" || "$metric" = "TC4CONC" ]];then
                            #START220305
                            #elif [[ "${sd1}" = "NONE" || "$metric" = "TC" || "$metric" = "TC2" || "$metric" = "TC3" || "$metric" = "TC4" || "$metric" = "SEPARATE" || "$metric" = "TC5" || "$metric" = "TC4CONC" || "$metric" = "WMH" ]];then
                            #START220311
                            elif [[ "${sd1}" = "NONE" || "$metric" = "TC" || "$metric" = "TC2" || "$metric" = "TC3" || "$metric" = "TC4" || "$metric" = "SEPARATE" || "$metric" = "TC5" || "$metric" = "TC4CONC" || "$metric" = "WMH" || "$metric" = "TXT2" ]];then

                                lcsd=1
                            else
                                sd2=${sd0}/${str}_${j}${sd1}
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
                            fi
                        else

                            #echo "        ${lovepirate} ${elephantpool[k0]} EXCLUDED"
                            #START220119
                            echo "        ${mo0} ${elephantpool[k0]} EXCLUDED"

                        fi
                    fi
                    ((k0+=4));((k1++))
                done
            else
                elephantpool[j0]=$j
                elephantpool[((j0+4))]=$j
            fi
        done
        if((lcblank==1));then

            #echo "" >> $bs
            #START220125
            [[ "$metric" = "ING10000" ]] && echo "" >> $bs

            ((bs0++))
        fi
    fi 

    if((lcsd==1));then
        r2=${r0}/${str}${r1}
        if [ "${id0}" != "NONE" ];then
            w1=${id0}/${line[0]}/${w0}
            if [ ! -f "${w1}" ];then
                echo "    **** ${w1} does not exist 0****"
            else
                flag=0
                if [ "${r1}" != "NONE" ];then
                    #r2=${r0}/${str}${r1}
                    if [ ! -f "${r2}" ];then
                        echo "    **** ${r2} does not exist 1****"
                        flag=1
                    fi
                fi
                if((flag==0));then

                    #if [[ "$metric" = "TXT" ]];then
                    #START210526
                    #if [[ "$metric" = "TXT" || "$metric" = "PETSTACK" ]];then
                    if [[ "$metric" = "TXT" || "$metric" = "PETSTACK" || "$metric" = "PETSTACKCONC" ]];then

                        for((j=0;j<${#labels0[@]};++j));do
                            pet0[j]=${r0}/${str}_${labels0[j]}.nii.gz
                            if [ ! -f "${pet0[j]}" ];then
                                echo "    **** ${pet0[j]} does not exist 2****"
                                break
                            fi
                        done
                        if((j==${#labels0[@]}));then
                            if [[ "$metric" = "TXT" || "$metric" = "PETSTACK" ]];then
                                printf 'PET=(' >> $bs
                                #echo "WMPARC=${w1}" >> $bs
                                for((j=0;j<${#pet0[@]};++j));do
                                    if((j>0));then
                                        printf '     '  >> $bs
                                    fi
                                    printf '%s' "${pet0[j]}" >> $bs
                                    if((j<(${#pet0[@]}-1)));then
                                        printf ' \\\n' >> $bs
                                    else
                                        printf ')\n' >> $bs
                                    fi
                                done
                                echo "WMPARC=${w1}" >> $bs
                            elif [[ "$metric" = "PETSTACKCONC" ]];then
                                for((j=0;j<${#conc0[@]};++j));do

                                    #ribbit=${g0}/${str}_${labels0[j]}_${cluster0}.nii.gz
                                    ribbit=${g0}/${str}_${labels0[j]}
                                    if [[ "${cluster0}" != "NONE" ]];then
                                        ribbit=${ribbit}_${cluster0}
                                    fi
                                    ribbit=${ribbit}.nii.gz

                                    if [ ! -f "${ribbit}" ];then
                                        #echo "    **** ${pet0[j]} does not exist 3****"
                                        echo "    **** ${ribbit} does not exist 3****"
                                        break
                                    fi
                                    echo "${ribbit}" >> ${conc0[j]}
                                done
                            fi
                            if [[ "$metric" = "TXT" ]];then
                                if((bs0==0));then 
                                    echo -e "${P1}"' -lut ${LUT} -cluster ${CLUSTER[@]} -wmparc ${WMPARC} -pet ${PET[@]} -labels ${LABELS[@]} > $out'"\n" >> $bs
                                else
                                    echo -e "${P1}"' -lut ${LUT} -cluster ${CLUSTER[@]} -wmparc ${WMPARC} -pet ${PET[@]} >> $out'"\n" >> $bs
                                fi
                            elif [[ "$metric" = "PETSTACK" ]];then
                                echo -e '${P0} -lut ${LUT} -cluster ${CLUSTER[@]} -wmparc ${WMPARC} -pet ${PET[@]} -out $out'"\n" >> $bs
                            fi
                            ((bs0++))
                        fi
                    elif [[ "$metric" = "TXT2" ]];then
                        for((j=0;j<${#labels0[@]};++j));do
                            pet0[j]=${sd0}/${str}_${labels0[j]}.nii.gz
                            if [ ! -f "${pet0[j]}" ];then
                                echo "    **** ${pet0[j]} does not exist ****"
                                break
                            fi
                        done
                        if((j==${#labels0[@]}));then
                            printf '    PET=(' >> $bs
                            for((j=0;j<${#pet0[@]};++j));do
                                if((j>0));then
                                    printf '         '  >> $bs
                                fi
                                printf '%s' "${pet0[j]}" >> $bs
                                if((j<(${#pet0[@]}-1)));then
                                    printf ' \\\n' >> $bs
                                else
                                    printf ')\n' >> $bs
                                fi
                            done
                            echo "    WMPARC=${w1}" >> $bs
                            if((bs0==0));then 
                                echo -e "    ${P1}"' -lut ${LUT} -cluster ${ROINAMES[i]} -wmparc ${WMPARC} -pet ${PET[@]} -labels ${LABELS[@]} > $out'"\n" >> $bs
                            else
                                echo -e "    ${P1}"' -lut ${LUT} -cluster ${ROINAMES[i]} -wmparc ${WMPARC} -pet ${PET[@]} >> $out'"\n" >> $bs
                            fi
                            ((bs0++))
                        fi

                    elif [[ "$metric" = "TC" || "$metric" = "TC3" ]];then
                        if [ "${sd0}" != "NONE" ];then
                            for((j=0;j<${#labels0[@]};++j));do
                                sd2=${sd0}/${str}_${labels0[j]}.nii.gz
                                if [ ! -f "${sd2}" ];then
                                    echo "    **** ${sd2} does not exist ****"
                                    break
                                fi
                            done
                        else
                            j=${#labels0[@]}
                        fi
                        if((j==${#labels0[@]}));then
                            sd2=${g0}/${str}_${sd1}.nii.gz
                            if [ ! -f "${sd2}" ];then
                                echo "    **** ${sd2} does not exist ****"
                                continue
                            fi 
                            r20[bs0]=${r2}
                            s20[bs0]=${sd2}
                            ((bs0++))
                        fi
                    elif [[ "$metric" = "TC2" ]];then
                        for((j=0;j<${#labels0[@]};++j));do
                            sd2=${sd0}/${str}_${labels0[j]}.nii.gz
                            if [ ! -f "${sd2}" ];then
                                echo "    **** ${sd2} does not exist ****"
                                break 
                            fi
                        done
                        if((j==${#labels0[@]}));then
                            r20[bs0]=${r2}
                            s20[bs0]=${w1}
                            ((bs0++))
                        fi

                    elif [[ "$metric" = "TC4" ||  "$metric" = "SEPARATE" ]];then
                        r20[bs0]=${r2}
                        s20[bs0]=${w1}
                        t20[bs0]=${bm1}
                        ((bs0++))

                    elif [[ "$metric" = "TC4CONC" ]];then
                        r20[bs0]=${r2}
                        s20[bs0]=${w1}
                        t20[bs0]=${bm1}
                        ((bs0++))
                    elif [[ "$metric" = "WMH" ]];then
                        for((j=1;j<${#wmh0[@]};++j));do
                            IFS=$',\n' read -ra line2 <<< ${wmh0[j]}
                            IFS=$'/' read -ra mrd <<< ${line2[1]}
                            for((k=0;k<2;++k));do
                                ((${#mrd[k]}<2)) && mrd[k]=0${mrd[k]}
                            done
                            mrd0=${line2[0]}/${mrd[2]:2:2}${mrd[0]}${mrd[1]}
                            #echo "mrd0=${mrd0} line[0]=${line[0]}"

                            #if [[ "${line2[0]}" = "${root}" ]];then
                            if [[ "${mrd0}" = "${root}/${root1:0:6}" ]];then

                                for((k=0;k<${#age0[@]};++k));do
                                    IFS=$',\n ' read -ra line0 <<< ${age0[k]}
                                    if [ "${line0[0]}" = "$root" ];then
                                        echo "${w1},${line2[4]}" >> $gs
                                        echo ${line0[1]} >>$bs
                                        echo ${r2} >> ${sd1}

                                        #START220330
                                        echo ${line[@]} >> $wmhdat0

                                        break 
                                    fi
                                done
                                if((k==${#age0[@]}));then
                                    echo "***** $root not found *****"
                                else
                                    ((bs0++))
                                    echo "    ${line0[0]} ${bs0}"
                                    break
                                fi

                            fi
                        done
                        ((j==${#wmh0[@]})) && echo "    ${root} not found"

                    #START220107
                    elif [[ "$metric" = "TC5" ]];then
                        bs0=0
                        for((j=0;j<${#r1[@]};++j));do
                            r2=${r0}/${str}${r1[j]}
                            echo "r2=${r2}"
                            if [ ! -f "${r2}" ];then
                                echo "    **** ${r2} does not exist ****"
                                break 
                            fi
                            r20[bs0]=${r2}
                            s20[bs0]=${w1}
                            t20[bs0]=${bm1}
                            ((bs0++))
                        done
                        printf 'TC_FILES=(' >> $bs
                        for((j=0;j<${#r20[@]};++j));do
                            if((j>0));then
                                printf '          '  >> $bs
                            fi
                            printf '%s' "${r20[j]}" >> $bs
                            if((j<(${#r20[@]}-1)));then
                                printf ' \\\n' >> $bs
                            else
                                printf ')\n' >> $bs
                            fi
                        done
                        printf 'REGION_FILE=(%s)\n' "${s20[0]}" >> $bs
                        printf 'FOI=(' >> $bs
                        for((j=1;j<=${#r20[@]};++j));do
                            printf '%s' "$j" >> $bs
                            if((j<(${#r20[@]})));then
                                printf ' ' >> $bs
                            else
                                printf ')\n' >> $bs
                            fi
                        done
                        superbird=
                        [[ "${sd0}" != "dummy" ]] && superbird=${sd0}
                        echo "superbird=${superbird}"
                        echo -e ${P2}' -tc_files ${TC_FILES[@]} -frames_of_interest ${FOI[@]} -region_file ${REGION_FILE[@]} -lut $LUT '"-conc ${gs}/${str}.conc\n" >> $bs

                    elif [[ "$metric" = "AGE" ]];then
                        for((j=0;j<${#labels0[@]};++j));do
                            pet0[j]=${sd0}/${str}_${labels0[j]}.nii.gz
                            if [ ! -f "${pet0[j]}" ];then
                                echo "    **** ${pet0[j]} does not exist ****"
                                break
                            fi
                        done
                        if((j==${#labels0[@]}));then
                            root=${line[0]%%/*}
                            for((j=0;j<${#age0[@]};++j));do
                                IFS=$',\n ' read -ra line0 <<< ${age0[j]}
                                if [ "${line0[0]}" = "$root" ];then
                                    echo ${line0[1]} >>$bs
                                    break
                                fi
                            done
                            if((j==${#age0[@]}));then
                                echo "***** $root not found *****"
                            else
                                ((bs0++))
                                echo "    ${line0[1]} ${bs0}"
                            fi
                        fi
                    elif [[ "$metric" = "AGE2" ]];then

                        #START220306
                        #root=${line[0]%%/*}
                        #root1=${line[0]##*/}
                        ##echo "root=$root root1=$root1"

                        for((j=0;j<${#age0[@]};++j));do
                            #echo "${age0[j]}"
                            IFS=$',\n ' read -ra line0 <<< ${age0[j]}
                            #echo "${line0[@]}"
                            lizard=${line0[1]}
                            if [ -z "${line0[1]}" ];then
                                lizard=${line0[0]} 
                            fi
                            #echo "lizard=$lizard root=$root line0[2]=${line0[2]} root1=$root1"
                            if [ "$lizard" = "$root" ] && [ "${line0[2]}" = "$root1" ];then
                                echo ${line0[3]} >>$bs
                                echo ${r2} >>$gs 
                                break
                            fi
                        done
                        if((j==${#age0[@]}));then
                            echo "***** $root not found *****"
                        else
                            ((bs0++))
                            echo "    ${line0[1]} ${bs0}"
                        fi

                    elif [[ "$metric" = "AGE3" ]];then

                        #START220306
                        #root=${line[0]%%/*}
                        #root1=${line[0]##*/}
                        ##echo "root=$root root1=$root1"

                        for((j=0;j<${#age0[@]};++j));do
                            #echo "${age0[j]}"
                            IFS=$',\n^M ' read -ra line0 <<< ${age0[j]}
                            lizard=${line0[0]}
                            #echo "lizard=$lizard root=$root line0[2]=${line0[2]} root1=$root1"
                            if [ "$lizard" = "$root" ];then
                                echo ${line0[1]} >>$bs
                                echo ${r2} >>$gs
                                break
                            fi
                        done
                        if((j==${#age0[@]}));then
                            echo "***** $root not found *****"
                        else
                            ((bs0++))
                            echo "    ${line0[0]} ${bs0}"
                        fi
                    elif [[ "$metric" != "REG" && "$metric" != "WITHPET" ]];then
                        echo "WMPARC=${w1}" >> $bs
                        echo "OUT=$str${cl1}.nii.gz" >> $bs
                        echo -e ${P0}' -lut ${LUT} -cluster ${CLUSTER[@]} -wmparc ${WMPARC} -out ${OUT}'"\n" >> $bs
                        ((bs0++))
                    else
                        ((bs0++))
                        for((j=1;j<${#withpet0[@]};++j));do
                            IFS=$',\n' read -ra line2 <<< ${withpet0[j]}
                            #echo "line2[0]=${line2[0]} s0[0]=${s0[0]}"
                            if [[ "${line2[0]}" = "${s0[0]}" ]];then
                                #echo "line2[4]=${line2[4]} s0[1]=${s0[1]}"
                                #exit
                                if [[ "${line2[4]}" = "${s0[1]}" ]];then
                                    ((bs1++))
                                    echo ${line[@]} >> $bs
                                    break
                                fi
                            fi
                        done


                    fi
                fi
            fi
        else
            if [ ! -f "${r2}" ];then
                echo "    **** ${r2} does not exist ****"
            else
                echo ${r2} >> $bs
                ((bs0++))
            fi
        fi
    fi
done

if [[ "$metric" = "TC" || "$metric" = "TC3" || "$metric" = "TC4" || "$metric" = "TC4CONC" ]];then
    if [[ "$cluster0" = "NONE" ]];then
        for((j=0;j<${#r20[@]};++j));do
            echo ${r20[j]} >> $gs
        done
    else
        printf 'TC_FILES=(' >> $bs
        for((j=0;j<${#r20[@]};++j));do
            if((j>0));then
                printf '          '  >> $bs
            fi
            printf '%s' "${r20[j]}" >> $bs
            if((j<(${#r20[@]}-1)));then
                printf ' \\\n' >> $bs
            else
                printf ')\n' >> $bs
            fi
        done
        if [[ "${g0}" = "brainmask" ]];then
            printf 'REGION_FILE=(' >> $bs
            for((j=0;j<${#t20[@]};++j));do
                if((j>0));then
                    printf '          '  >> $bs
                fi
                printf '%s' "${t20[j]}" >> $bs
                if((j<(${#t20[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
        else
            printf 'REGION_FILE=(' >> $bs
            for((j=0;j<${#s20[@]};++j));do
                if((j>0));then
                    printf '          '  >> $bs
                fi
                printf '%s' "${s20[j]}" >> $bs
                if((j<(${#s20[@]}-1)));then
                    printf ' \\\n' >> $bs
                else
                    printf ')\n' >> $bs
                fi
            done
        fi
        printf 'FOI=(' >> $bs
        for((j=1;j<=${#r20[@]};++j));do
            printf '%s' "$j" >> $bs
            if((j<(${#r20[@]})));then
                printf ' ' >> $bs
            else
                printf ')\n' >> $bs
            fi
        done
        if [[ "$metric" = "TC" ]];then
            echo -e ${P2}' -tc_files ${TC_FILES[@]} -frames_of_interest ${FOI[@]} -region_file ${REGION_FILE[@]} -regions_of_interest INDIVIDUAL -lut $LUT -label '"${sd1} -conc ${gs}\n" >> $bs
        elif [[ "$metric" = "TC3" ]];then
            superbird=${bs##*/}
            superbird=${superbird%%.*}
            echo -e ${P2}' -tc_files ${TC_FILES[@]} -frames_of_interest ${FOI[@]} -region_file ${REGION_FILE[@]} -regions_of_interest INDIVIDUAL -lut $LUT -label '"${gs} -regnames ${sd1} -avgacrossfiles ${superbird}.txt \n" >> $bs
        elif [[ "$metric" = "TC4" ]];then
            superbird=
            [[ "${sd0}" != "dummy" ]] && superbird=${sd0}
            echo -e ${P2}' -tc_files ${TC_FILES[@]} -frames_of_interest ${FOI[@]} -region_file ${REGION_FILE[@]} -regions_of_interest INDIVIDUAL -lut $LUT '"-conc ${gs} ${superbird}\n" >> $bs
        fi
    fi
elif [[ "$metric" = "TC2" ]];then
    printf 'TC_FILES=(' >> $bs
    for((j=0;j<${#r20[@]};++j));do
        if((j>0));then
            printf '          '  >> $bs
        fi
        printf '%s' "${r20[j]}" >> $bs
        if((j<(${#r20[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    printf 'REGION_FILE=(' >> $bs
    for((j=0;j<${#s20[@]};++j));do
        if((j>0));then
            printf '          '  >> $bs
        fi
        printf '%s' "${s20[j]}" >> $bs
        if((j<(${#s20[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    superbird=($(more ${cluster0}))
    #echo ${#superbird[@]}
    printf 'ROINAMES=(' >> $bs
    for((j=0;j<${#superbird[@]};++j));do
        if((j>0));then
            printf '          '  >> $bs
        fi
        printf '%s' "${superbird[j]}" >> $bs
        if((j<(${#superbird[@]}-1)));then
            printf ' \\\n' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    printf 'FOI=(' >> $bs
    for((j=1;j<=${#r20[@]};++j));do
        printf '%s' "$j" >> $bs
        #if((j<(${#r20[@]}-1)));then
        if((j<(${#r20[@]})));then
            printf ' ' >> $bs
        else
            printf ')\n' >> $bs
        fi
    done
    echo -e ${P2}' -tc_files ${TC_FILES[@]} -frames_of_interest ${FOI[@]} -region_file ${REGION_FILE[@]} -regions_of_interest INDIVIDUAL -lut $LUT -roinames ${ROINAMES[@]} '"-conc ${gs}\n" >> $bs

#START211115
elif [[ "$metric" = "SEPARATE" ]];then
    for((j=0;j<${#r20[@]};++j));do
        #echo -e ${P3}' -file '${r20[j]}' -lut $LUT'>>$bs
        echo -e ${P3}' -file '${r20[j]}' -lut $LUT '${gs}>>$bs
    done
fi

if [[ "$metric" = "TXT2" ]];then
    echo '    echo "Output written to $out"' >> $bs
    echo "done" >> $bs
fi

if [[ "$metric" != "WITHPET" ]];then

    #echo "$1 $((cnt0)) sessions"
    #echo "$bs ${bs0} sessions" 
    #START220306
    #echo "$1 $((cnt0)) sessions > ${bs0} sessions"
    echo "$1 $((cnt0))  >  ${bs0} sessions"

else
    echo "$1 $((${#csv[@]}-2)) sessions ${bs0} with BOLD ${bs1} with PET"
fi

if [[ "$metric" != "PETSTACKCONC" ]];then
    if [[ "$metric" != "AGE" &&  "$metric" != "AGE2" && "$metric" != "AGE3" ]];then

        #chmod +x $bs
        if [[ "$bs" != "NONE" ]];then
            chmod +x $bs
        fi

    fi

    #echo "Output written to $bs"
    #START211110
    if [[ "$bs" != "NONE" ]];then
        echo "Output written to $bs"
    else 
        echo "Output written to $gs"
    fi

    #if [[ "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TC3" && "$metric" != "PETSTACK" && "$metric" != "TC4" && "$metric" != "SEPARATE" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" ]];then
    #START220311
    if [[ "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TC3" && "$metric" != "PETSTACK" && "$metric" != "TC4" && "$metric" != "SEPARATE" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" && "$metric" != "TXT2" ]];then
    #START220305
    #if [[ "$metric" != "TC" && "$metric" != "TC2" && "$metric" != "TC3" && "$metric" != "PETSTACK" && "$metric" != "TC4" && "$metric" != "SEPARATE" && "$metric" != "MEANTR" && "$metric" != "SDTR" && "$metric" != "TC4CONC" && "$metric" != "WMH" ]];then

        echo "Output written to $gs"
    fi
else 
    for((j=0;j<${#conc0[@]};++j));do
        echo "Output written to ${conc0[j]}"
    done
fi
#if [[ "$bs" = "NONE" && "$metric" = "WMH" ]];then
if [[ "$metric" = "WMH" ]];then
    echo "Output written to $sd1"

    #START220330
    echo "Output written to $wmhdat0"

fi

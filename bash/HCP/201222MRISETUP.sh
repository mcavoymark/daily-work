#!/bin/bash

if [ ${#@} != 3 ]; then
    echo "$0 <col of MR IDs or MRI.dat or 5 field cnda csv> <indir> <MRI.dat style output file>"
    echo ''
    echo "    <col of MR IDs or MRI.dat or 5 field cnda csv>"
    echo "        12-5-20 If MRI.dat then T1set and T2set are appended on MRI.dat_<date>."
    echo "        This should be modified to also take the three field csv (ie Project,Subject label,MR ID)"
    echo ''
    echo "    <indir>"
    echo "        /data/nil-bluearc/vlassenko/RAW_IMAGES/MRI"
    echo ''
    echo "    <MRI.dat style output file>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    exit
fi
id=$2;of=$3
IFS=$'\n' read -d '' -ra csv < $1

t1=(T1w MPRAGE t1_mpr_1mm_p2 t1_mprage_sag Sagittal_3D_Accelerated_T1 3D_T1_MP_RAGE)
t2=(T2w t2_spc_1mm_p2 T2_Space 3DT2 T2_SPC_1MM_P2)
fl=FLAIR
sb=SBRef
r0=(REST bold_connect ep2d_boldWU rsfMRI bold_Anim bold_Stroop BOLD)
fm=(SpinEchoFieldMap FieldMAP)

title="subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
echo $title > $of
dash="---------------------------------------------------------------------------------------------------"
echo $dash >> $of

#for i in ${csv[@]}; do

elephantpool=
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}

    if [[ "${line[0]}" = "subject" ]];then
        elephantpool=$1_$(date +%y%m%d%H%M%S) 
        echo $title > $elephantpool
        continue
    elif [[ "${line[0]:0:1}" = "-" ]];then
        echo $dash >> $elephantpool
        continue
    fi

    #IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
    #lovepirate=${s0[0]}/${s0[1]:0:9}
    if((${#line[@]}==5));then
        lovepirate=${line[3]}/${line[4]:0:9}
        lizard=${line[3]}/${line[4]}
    else
        IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
        lovepirate=${s0[0]}/${s0[1]:0:9}
        lizard=${line[0]}
    fi

    echo "lovepirate=$lovepirate"
    echo "lizard=$lizard"

    T1set=NONE;lct1set=0
    T1=NONE;lct1=() 
    for j in ${!t1[@]};do
        lct1+=(0)
    done
    T2set=NONE;lct2set=0
    T2=NONE;lct2=()
    for j in ${!t2[@]};do
        lct2+=(0)
    done
    FL=NONE
    k=0;SB=( NONE NONE NONE NONE )
    l=0;R0=( NONE NONE NONE NONE )
    m=0;FM=( NONE NONE NONE NONE )

    #for j in $(ls $id/$i | sort -n);do
    #for j in $(ls $id/${line[0]} | sort -n);do
    for j in $(ls $id/${lovepirate} | sort -n);do

        #echo $j

        for n in ${!t1[@]};do
            if [[ "$j" = *"${t1[n]}"* ]] && [[ "$j" != *"DIS"* ]];then
                if [[ "$j" = *"setter"* ]];then
                    T1set=$j
                    ((lct1set++))
                else  
                    T1=$j
                    ((lct1[n]++))
                fi
            fi
        done
        for n in ${!t2[@]};do
            if [[ "$j" = *"${t2[n]}"* ]];then
                if [[ "$j" = *"setter"* ]];then
                    T2set=$j
                    ((lct2set++))
                else  
                    T2=$j
                    ((lct2[n]++))
                fi
            fi
        done

        if [[ "$j" = *"${fl}"* ]]; then
            FL=$j
        fi

        if [[ "$j" = *"${sb}"* ]];then
            SB[k]=$j
            ((k++))
        else
            for n in ${!r0[@]};do
                if [[ "$j" = *"${r0[n]}"* ]] && [[ "$j" != *"MoCoLog"* ]] && [[ "$j" != *"Mosaics"* ]]; then
                    R0[l]=$j
                    ((l++))
                fi
            done
        fi
        for n in ${!fm[@]};do
            if [[ "$j" = *"${fm[n]}"* ]] && [[ "$j" != *"ASL"* ]];then
                FM[m]=$j 
                ((m++)) 
            fi
        done
    done

    if((lct1set==0));then
        echo "    Missing T1_setter" 
    elif((lct1set>1));then
        echo "    WARNING: T1_setter multiply defined. Last one will be placed in $of" 
    fi
    ((sumlct1=${lct1[@]/%/+}0))
    if((sumlct1==0));then
        echo "    Missing T1" 
    elif((sumlct1>1));then
        echo "    WARNING: T1 multiply defined. Last one will be placed in $of" 
    fi
    if((lct2set==0));then
        echo "    Missing T2_setter" 
    elif((lct1set>1));then
        echo "    WARNING: T2_setter multiply defined. Last one will be placed in $of" 
    fi
    ((sumlct2=${lct2[@]/%/+}0))
    if((sumlct2==0));then
        echo "    Missing T2" 
    elif((sumlct2 > 1));then
        echo "    WARNING: T2 multiply defined. Last one will be placed in $of" 
    fi

    echo "    number of bolds = $l"
    echo "    number of spin echo field maps = $m"

    #echo "${i} ${T1} ${T2} ${FL} ${R0[@]} ${SB[@]} ${FM[@]} ${T1set} ${T2set}"
    #echo "${i} ${T1} ${T2} ${FL} ${R0[@]} ${SB[@]} ${FM[@]}" >> $of 
    #superbird="${i} ${T1} ${T2} ${FL} ${R0[@]} ${SB[@]} ${FM[@]} ${T1set} ${T2set}"
    #superbird="${line[0]} ${T1} ${T2} ${FL} ${R0[@]} ${SB[@]} ${FM[@]} ${T1set} ${T2set}"
    superbird="${lizard} ${T1} ${T2} ${FL} ${R0[@]} ${SB[@]} ${FM[@]} ${T1set} ${T2set}"
    echo "superbird=$superbird"
    echo $superbird  >> $of

    if [[ -n ${elephantpool} ]];then
        echo "${line[@]} ${T1set} ${T2set}"  >> $elephantpool
    fi

done
echo "Output written to $of"

if [[ -n ${elephantpool} ]];then
    echo "Output written to $elephantpool"
fi

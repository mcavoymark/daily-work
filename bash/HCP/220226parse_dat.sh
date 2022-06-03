#!/bin/bash

if [ ${#@} != 4 ];then
    echo ${#@}
    echo "$0 <MRI.dat> <ASRC.csv> <VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv> <agecutoff>"
    echo 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "Checks from 108001 to 108285. Looks for a *RES*."
    exit
fi
agecutoff=$4

IFS=$'\n' read -d '' -ra csv < $1
IFS=$'\n' read -d '' -ra csv2 < $2
IFS=$'\n' read -d '' -ra csv3 < $3

root=${1%%.*}
#echo "root=$root"

g0=${root}_parsed0.dat;rm -f $g0;touch $g0;g0c=0
g1=${root}_parsed1.dat;rm -f $g1;touch $g1;g1c=0
g2=${root}_parsed2.dat;rm -f $g2;touch $g2;g2c=0
g3=${root}_parsed3.dat;rm -f $g3;touch $g3;g3c=0
g4=${root}_parsed3Non-AD.dat;rm -f $g4;touch $g4;g4c=0
g5=${root}_parsedNotAssigned.dat;rm -f $g5;touch $g5;g5c=0

for((l=0;l<${#csv[@]};++l));do
    IFS=$',\n ' read -ra line <<< ${csv[l]}
    if [[ "${line[0]:0:1}" = "#" ]];then
        echo "Skipping line $((l+1)): ${line[0]}"
        continue 
    fi
    #IFS=$',\n\ ' read -ra line1 <<< ${line[0]}
    #s0=${line1[0]};s1=${line1[1]}
    s0=${line[0]%/*}
    #echo "s0=${s0}"

    #ASRC.csv
    group=;age=;cog=;amy=
    for((k=5;k<${#csv2[@]};++k));do
        superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[k]})
        IFS=$',\n' read -ra line2 <<< $superbird 
        if [[ "${line2[1]}" = "1" ]];then
            if [[ "${line[0]}" = "${line2[11]}/${line2[12]}" ]];then
                    #echo "${line[0]} ${line2[11]}/${line2[12]}"
                    group=${line2[2]}
                    age=${line2[6]}
                    cog=${line2[3]}
                    amy=${line2[4]}
                    break
            fi
        fi
    done
            
    #VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv
    age0=
    for((i=1;i<${#csv3[@]};++i));do
        IFS=$',\n' read -ra line3 <<< ${csv3[i]}
        if [[ "${line3[0]}" = "${s0}" ]];then
            age0=${line3[1]}
            break;
        fi
    done


    if [[ "$group" = "Cognitively normal; Amyloid status unknown" || "$group" = "1" ]] && (( $(echo "${age} < ${agecutoff}" |bc -l) ));then
        echo "${line[@]}" >> $g0
        ((g0c++)) 
    elif [[ "$group" = "0" ]];then
        echo "${line[@]}" >> $g0
        ((g0c++)) 
    elif [[ "$group" = "1" ]];then
        echo "${line[@]}" >> $g1
        ((g1c++)) 
    elif [[ "$group" = "2" ]];then
        echo "${line[@]}" >> $g2
        ((g2c++)) 
    elif [[ "$group" = "3" ]];then
        echo "${line[@]}" >> $g3
        ((g3c++)) 
    elif [[ "$group" = "3 Non-AD" || "$group" =  "3Non-AD" ||  "$group" =  "Non-AD" ]];then
        echo "${line[@]}" >> $g4
        ((g4c++)) 
    else
        echo "${line[@]}" >> $g5
        ((g5c++)) 
    fi

    printf '%s\n' "${s0},${line[0]},${group},$cog,$amy,${age},${age0}"
done
echo "Output written to $g0 ${g0c}"
echo "Output written to $g1 ${g1c}"
echo "Output written to $g2 ${g2c}"
echo "Output written to $g3 ${g3c}"
echo "Output written to $g4 ${g4c}"
echo "Output written to $g5 ${g5c}"

#!/bin/bash

#if [ ${#@} != 6 ];then
if [ ${#@} != 5 ];then
    echo ${#@}
    #echo "$0 <MRI.dat> <ASRC.csv> <DF01.csv> <VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv> <agecutoff> <csv - output>"
    echo "$0 <MRI.dat> <ASRC.csv> <DF01.csv> <agecutoff> <csv - output>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    exit
fi
agecutoff=$4;of=$5

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

IFS=$'\n' read -d '' -ra csv2 < $2
IFS=$'\n' read -d '' -ra csv3 < $3

echo "REDCAP or MAP,MRID,Group,$1,$3" > $of

root=${of%%.*}
#echo "root=$root"
#exit

g0=${root}0.csv;rm -f $g0;touch $g0;g0c=0
g1=${root}1.csv;rm -f $g1;touch $g1;g1c=0
g2=${root}2.csv;rm -f $g2;touch $g2;g2c=0
g3=${root}3.csv;rm -f $g3;touch $g3;g3c=0
g4=${root}3Non-AD.csv;rm -f $g4;touch $g4;g4c=0
g5=${root}NotAssigned.csv;rm -f $g5;touch $g5;g5c=0
g6=${root}NoMR.csv;rm -f $g6;touch $g6;g6c=0

#ASRC.csv
for((i=5;i<${#csv2[@]};++i));do
    superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[i]})
    IFS=$',\n' read -ra line2 <<< $superbird
    if [[ "${line2[1]}" = "1" ]];then
        if [[ ${line2[11]:6:3} = "PMR" ]];then
            s1=${line2[10]}
            s2=${line2[11]}
            group=${line2[2]}
            age=${line2[5]}
            ADstatus=;k=0
            if [[ -z "${s1}" ]];then
                s1=${line2[9]}
            else
                #DF01.csv
                s4=;Modality=
                for((j=1;j<${#csv3[@]};++j));do
                    IFS=$',\n' read -ra line <<< ${csv3[j]}
                    if [[ "${line[0]}" = "${s1}" ]];then
                        if [[ "${line[4]}" = "${s2}" ]];then
                            s4[k]=${line[4]}
                            ADstatus[k]=${line[15]}
                            Modality[k]=${line[18]}
                            ((++k))
                        fi
                    fi
                done
            fi 

            #MRI.dat
            superbird=${s1}/${s2}
            s3=
            for((j=2;j<${#csv[@]};++j));do
                IFS=$',\n ' read -ra line <<< ${csv[j]}
                if [[ "${line[0]}" = "${superbird}" ]];then
                    s3=${line[0]}
                    break
                fi
            done

            if [[ "$group" = "Cognitively normal; Amyloid status unknown" || "$group" = "1" ]] && (( $(echo "${age} < ${agecutoff}" |bc -l) ));then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g0
                ((g0c++))
            elif [[ "$group" = "1" ]];then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g1
                ((g1c++))
            elif [[ "$group" = "2" ]];then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g2
                ((g2c++))
            elif [[ "$group" = "3" ]];then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g3
                ((g3c++))
            elif [[ "$group" = "3 Non-AD" ]];then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g4
                ((g4c++))
            elif [[ -n "$group" ]];then
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g5
                ((g5c++))
            else
                echo "${superbird},${s3},${group},${ADstatus[0]},$age" >> $g6
                ((g6c++))
            fi

            printf '%s' "${s1},${s2},${group},${s3}" >> ${of}
            for((j=0;j<k;++j));do
                printf '%s' ",${s4[j]},${ADstatus[j]},${Modality[j]}" >> ${of}
            done
            printf '\n' >> ${of}
        fi
    fi
done
echo "Output written to $of"
echo "Output written to $g0"
echo "Output written to $g1"
echo "Output written to $g2"
echo "Output written to $g3"
echo "Output written to $g4"
echo "Output written to $g5"
echo "Output written to $g6"

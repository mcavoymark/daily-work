#!/bin/bash

#if [ ${#@} != 5 ];then
if [ ${#@} != 6 ];then
    echo ${#@}
    #echo "$0 <MRI.dat> <ASRC.csv> <DF01.csv> <VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv> <csv - output>"
    echo "$0 <MRI.dat> <ASRC.csv> <DF01.csv> <VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv> <agecutoff> <csv - output>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "Checks from 108001 to 108285. Looks for a *RES*."
    exit
fi
#of=$5
agecutoff=$5;of=$6

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

IFS=$'\n' read -d '' -ra csv2 < $2
IFS=$'\n' read -d '' -ra csv3 < $3
IFS=$'\n' read -d '' -ra csv4 < $4

echo "REDCAP,MRID,Group,$1,$3" > $of

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

for((l=1;l<=285;++l));do
    if((l<10));then
        s1=10800$l 
    elif((l<100));then
        s1=1080$l
    else
        s1=108$l
    fi
    echo $s1

    #ASRC.csv
    s2=;group=
    for((k=5;k<${#csv2[@]};++k));do
        superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[k]})
        IFS=$',\n' read -ra line2 <<< $superbird 
        if [[ "${line2[1]}" = "1" ]];then
            if [[ ${line2[10]} = "${s1}" ]];then
                if [[ ${line2[11]:6:3} = "RES" ]];then
                    s2=${line2[11]} 
                    group=${line2[2]}
                    age=${line2[5]}
                    break
                fi
            fi
        fi
    done

    #MRI.dat
    s3=;#s22=${s2}
    if [[ -n "${s2}" ]];then
        superbird=${s1}/${s2}
        for((i=2;i<${#csv[@]};++i));do
            IFS=$',\n ' read -ra line <<< ${csv[i]}
            if [[ "${line[0]}" = "${superbird}" ]];then
                s3=${line[0]}
                break
            fi 
        done
    else 
        for((i=2;i<${#csv[@]};++i));do
            IFS=$',\n ' read -ra line <<< ${csv[i]}
            IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
            if [[ "${s0[0]}" = "${s1}" ]];then
                if [[ ${s0[1]:6:3} = "RES" ]];then
                    s3=${line[0]}
                    #s22=${s0[0]}
                    break
                fi
            fi
        done
    fi

    #DF01.csv
    #declare -a s4;declare -a ADstatus;declare -a Modality;k=0
    s4=;ADstatus=;Modality=;k=0
    for((i=1;i<${#csv3[@]};++i));do
        IFS=$',\n' read -ra line <<< ${csv3[i]}
        #echo "here0 line[0]=${line[0]}"
        if [[ "${line[0]}" = "${s1}" ]];then
            #echo "here1"
            if [[ ${line[4]:6:3} = "RES" ]];then
                s4[k]=${line[4]}
                ADstatus[k]=${line[15]}
                Modality[k]=${line[18]}
                ((++k))
            fi
        fi
    done
    echo "    k=$k ADstatus[0]=${ADstatus[0]} ADstatus=$ADstatus"

    #VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv
    age0=
    for((i=1;i<${#csv4[@]};++i));do
        IFS=$',\n' read -ra line <<< ${csv4[i]}
        if [[ "${line[0]}" = "${s1}" ]];then
            age0=${line[1]}
        fi
    done

    #if [[ "$group" = "Cognitively normal; Amyloid status unknown" ]] && (( $(echo "${age} < 56" |bc -l) ));then
    if [[ "$group" = "Cognitively normal; Amyloid status unknown" || "$group" = "1" ]] && (( $(echo "${age} < ${agecutoff}" |bc -l) ));then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g0
        ((g0c++)) 
    elif [[ "$group" = "1" ]];then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g1
        ((g1c++)) 
    elif [[ "$group" = "2" ]];then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g2
        ((g2c++)) 
    elif [[ "$group" = "3" ]];then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g3
        ((g3c++)) 
    elif [[ "$group" = "3 Non-AD" ]];then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g4
        ((g4c++)) 
    elif [[ -n "$group" ]];then
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g5
        ((g5c++)) 
    else
        echo "${s3},${group},${ADstatus[0]},$age,${age0}" >> $g6
        ((g6c++)) 
    fi

    printf '%s' "${s1},${s2},${group},${s3}" >> ${of}
    for((i=0;i<k;++i));do
        printf '%s' ",${s4[i]},${ADstatus[i]},${Modality[i]}" >> ${of}
    done
    printf '\n' >> ${of}
done
echo "Output written to $of"
echo "Output written to $g0"
echo "Output written to $g1"
echo "Output written to $g2"
echo "Output written to $g3"
echo "Output written to $g4"
echo "Output written to $g5"
echo "Output written to $g6"

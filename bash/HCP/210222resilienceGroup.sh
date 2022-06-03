#!/bin/bash

P0="/home/usr/mcavoy/FIDL/build/fidl_hdr"

if [ ${#@} != 3 ];then
    echo ${#@}
    echo "$0 <MRI.dat> <csv - main spreadsheet> <csv - output>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "    <csv - main spreadsheet>"
    echo "        Ex. ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm210114vlasfold.csv"
    echo "        Matches row for row the output spreadsheet to facilitate copy and pasting."
    echo ""
    echo "    <csv - output>"
    echo "        Number of setter frames will be added to this file, so you can copy and paste the columns in the main spreadsheet." 
    exit
fi
of=$3

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

IFS=$'\n' read -d '' -ra csv2 < $2

rm -f $of;touch $of;ofc=0

root=${of%%.*}
#echo "root=$root"
#exit

g0=${root}0.csv;rm -f $g0;touch $g0;g0c=0
g1=${root}1.csv;rm -f $g1;touch $g1;g1c=0
g2=${root}2.csv;rm -f $g2;touch $g2;g2c=0
g3=${root}3.csv;rm -f $g3;touch $g3;g3c=0
g4=${root}3Non-AD.csv;rm -f $g3;touch $g4;g4c=0
g5=${root}NotAssigned.csv;rm -f $gNA;touch $g5;g5c=0

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n^M ' read -ra line <<< ${csv[i]}
    IFS=$',\n^M/ ' read -ra s0 <<< ${line[0]}

    if [[ ${s0[1]:6:3} = "RES" ]];then

        for((k=4;k<8;++k));do
            if [[ "${line[k]}" != "NONE" && "${line[k]}" != "NOTUSEABLE" ]];then
                break
            fi
        done 
        if((k<8));then
            for((k=0;k<${#csv2[@]};++k));do
                superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[k]})
                IFS=$',\n' read -ra line2 <<< $superbird 

                #if [[ "${line2[7]}" = "${s0[0]}" || "${line2[8]}" = "${s0[0]}" ]] && [[ "${line2[9]}" = "${s0[1]}" ]];then
                if [[ "${line2[36]}" = "${s0[0]}" || "${line2[37]}" = "${s0[0]}" ]] && [[ "${line2[38]}" = "${s0[1]}" ]];then
                    #echo "${line[0]}  ${line2[1]}"
                    #echo "${line[0]},${line2[1]}" >> $of 
                    echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}"
                    echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $of 
                    ((ofc++))

                    if(( $(echo "${line2[31]} < 55" |bc -l) ));then
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g0
                        ((g0c++))
                    elif [[ "${line2[28]}" = "1" ]];then
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g1 
                        ((g1c++))
                    elif [[ "${line2[28]}" = "2" ]];then
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g2 
                        ((g2c++))
                    elif [[ "${line2[28]}" = "3" ]];then
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g3 
                        ((g3c++))
                    elif [[ "${line2[28]}" = "3 Non-AD" ]];then
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g4 
                        ((g4c++))
                    else
                        echo "    NOT ASSIGNED"
                        echo "${line[0]},${line2[28]},${line2[29]},${line2[30]},${line2[31]}" >> $g5 
                        ((g5c++))
                    fi

                fi
            done
        fi
    fi
done
echo "Output written to $of $ofc"
echo "Output written to $g0 $g0c"
echo "Output written to $g1 $g1c"
echo "Output written to $g2 $g2c"
echo "Output written to $g3 $g3c"
echo "Output written to $g4 $g4c"
echo "Output written to $g5 $g5c"

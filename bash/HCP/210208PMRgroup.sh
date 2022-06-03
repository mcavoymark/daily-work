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

rm -f $of;touch $of

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    IFS=$',\n/ ' read -ra s0 <<< ${line[0]}

    #if [[ ${s0[1]:6:3} = "RES" ]];then
    if [[ ${s0[1]:6:3} = "PMR" ]];then


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
                if [[ "${line2[8]}" = "${s0[0]}" || "${line2[9]}" = "${s0[0]}" ]] && [[ "${line2[10]}" = "${s0[1]}" ]];then

                    echo "${line[0]}  ${line2[1]}"
                    echo "${line[0]},${line2[1]}" >> $of 

                fi
            done
        fi
    fi
done
echo "Output written to $of"

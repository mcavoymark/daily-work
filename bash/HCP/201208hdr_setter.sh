#!/bin/bash

P0="/home/usr/mcavoy/FIDL/build/fidl_hdr"

if [ ${#@} != 4 ];then
    echo ${#@}
    echo "$0 <MRI.dat> <input directory> <csv - main spreadsheet> <csv - output>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "    <input directory>"
    echo "        Ex. For the first line of MRI.dat, the niftis are fetched from" 
    echo "            <input directory>/108008/180328RES" 
    echo ""
    echo "    <csv - main spreadsheet>"
    echo "        Ex. ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm201205_vlasfold.csv"
    echo "        Matches row for row the output spreadsheet to facilitate copy and pasting."
    echo ""
    echo "    <csv - output>"
    echo "        Number of setter frames will be added to this file, so you can copy and paste the columns in the main spreadsheet." 
    exit
fi
id=$2;of=$4;

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

IFS=$'\n' read -d '' -ra csv2 < $3

rm -f $of;touch $of

for((k=0;k<${#csv2[@]};++k));do
#for((k=5;k<${#csv2[@]};++k));do
#for((k=33;k<${#csv2[@]};++k));do

    #IFS=$',\n ' read -ra line2 <<< ${csv2[k]}
    #line2=($(awk -v FPAT='[^,]*|"[^"]*"' '{for (i=1;i<=NF;i++) print i, $i}' ${csv2[k]}))
    #line2=($(awk -v FPAT='[^,]*|"[^"]*"' '{for (i=1;i<=NF;i++) print i, $i}' <<< ${csv2[k]}))
    #line2=($(awk -v FPAT='[^,]*|"[^"]*"' '{for (i=1;i<=NF;i++) print $i}' <<< ${csv2[k]}))
    #line2=($(awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 1' <<< ${csv2[k]}))
    superbird=$(awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 1' <<< ${csv2[k]})
    #echo ${superbird}
    IFS=$',\n' read -ra line2 <<< $superbird 

    #echo ${line2[@]}
    #echo ${line2[4]}
    #echo "line2[4] = ${line2[4]}"
    #exit

    #echo ${line2[0]}
    str="${line2[4]},${line2[5]},${line2[6]}"

    for((i=2;i<${#csv[@]};++i));do
        IFS=$',\n ' read -ra line <<< ${csv[i]}
        #echo ${line[0]}
        IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
        lovepirate=${s0[0]}/${s0[1]:0:9}
        #echo "lovepirate=$lovepirate"

        if [[ "${line2[4]}" = "${s0[0]}" || "${line2[5]}" = "${s0[0]}" ]] && [[ "${line2[6]}" = "${s0[1]}" ]];then

            for j in ${line[@]:16};do
                #echo "    ${j}"
                if [ "${j}" = "NONE" ];then
                    str="${str},"
                elif [ "${j}" = "NOTUSEABLE" ];then
                    str="${str},N"
                else
                    #echo "${P0} -files $id/${lovepirate}/${j}.nii.gz"
                    ${P0} -files $id/${lovepirate}/${j}.nii.gz
                    dims=($(${P0} -files $id/${lovepirate}/${j}.nii.gz))
                    #echo "    ${dims[@]}"
                    #echo "    ${dims[5]}"
                    str="${str},${dims[5]}"
                fi
            done
            break
        fi
    done
    echo $str >> $of
done
echo "Output written to $of"

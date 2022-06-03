#!/bin/bash

if [ ${#@} != 3 ];then
    echo ${#@}
    echo "$0 <csv - Tony spredsheet> <csv - main spreadsheet> <csv - output>"
    echo ""
    echo "    <csv - Tony spredsheet>"
    echo "        age and amyloid status are pulled from this spreadsheet"
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
IFS=$'\n' read -d '' -ra csv2 < $2

printf '\n\n\n\n' > $of

echo "MAP #,RedCap #,vglab ID,RedCap #,MAP #,Sex,V1 Metabolic PET Date,V1 Age,V1 AB status,V1 MR Date,V1 MR Age,PostV1 AB status,PostV1 MR Date,PostV1 MR Age,V2 Metabolic PET Date,V2 Age,V2 AB status,V2 MR Date,V2 MR Age,PostV2 AB status,PostV2 MR Date,PostV2 MR Age,V3 Metabolic PET Date,V3 Age,V3 AB status,V3 MR Date,V3 MR Age" >> $of

for((i=5;i<${#csv2[@]};++i));do
    superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[i]})
    IFS=$',\n' read -ra line2 <<< $superbird 

    str="${line2[8]},${line2[9]},${line2[10]}"

    #echo "${line2[8]}"

    for((k=0;k<${#csv[@]};++k));do
        superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv[k]})
        IFS=$',\n' read -ra line <<< $superbird 

        if [ "${line2[9]}" = "${line[0]}" ];then
            str="${str},${line[0]},${line[1]},${line[7]},${line[12]},${line[13]},${line[16]},${line[22]},${line[23]},${line[40]},${line[46]},${line[47]},${line[62]},${line[63]},${line[66]},${line[72]},${line[73]},${line[89]},${line[95]},${line[96]},${line[111]},${line[112]},${line[115]},${line[121]},${line[122]}"
            break
        fi
    done
    echo "${str}"
    echo "${str}" >> $of
done
echo "Output written to $of"

#!/bin/bash

P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix200331/dcm2niix -w 0 -z i" #-w 0 skip duplicates

if [ ${#@} != 5 ];then
    echo "$0 <csv> <input directory> <output directory> <where to write dcm2niix scripts> <batch script>"
    echo ""
    echo "    <csv >"
    echo "        Ex. 108080/140912PMR 35-Axial_T2_TSE_with_Fat_Sat 48-Axial_T2_TSE_with_Fat_Sat"
    echo ""
    echo "    <input directory>"
    echo "        Ex. /data/nil-bluearc/vlassenko/RAW_IMAGES/MRI"
    echo ""
    echo "    <output directory>"
    echo "        Ex. /data/nil-bluearc/vlassenko/mcavoy/HCP"
    exit
fi
id=$2;od=$3;sd=$4;bs=$5;

IFS=$'\n' read -d '' -ra csv < $1

mkdir -p $od
mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]};
    echo $s0

    str="${s0////_}"
    echo "str = $str"
    f0=$sd/${str}.sh 

    echo "#!/bin/bash" > $f0

    od1=${od}/nii/${s0}
    if [ ! -d "$od1" ];then 
        echo "" >> $f0
        echo "mkdir -p $od1" >> $f0
    fi
    for j in ${line[@]:1};do
        echo "    ${j}"
        if [ "${j}" != "NONE" ];then
            dir0=${id}/${s0}/${j}/DICOM
            echo "" >> $f0
            echo "${P0} -o ${od1} -f ${j} ${dir0}" >> $f0
        fi
    done
    echo "${f0} > ${f0}.txt &" >> $bs
done

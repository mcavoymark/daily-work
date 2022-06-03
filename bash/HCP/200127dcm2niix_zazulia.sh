#!/bin/bash

P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix20190902/dcm2niix -w 0 -z i" #-w 0 skip duplicates

if [ ${#@} != 5 ];then
    echo "$0 <MRI.dat> <input directory> <output directory> <where to write dcm2niix scripts> <batch script>"
    echo ""
    echo "    <MRI.dat> /export/scratch/zazulia/zazuliaMRI_dcm2niix.dat"
    echo "        MRID PATH T1 T1 T2 BOLD BOLD BOLD"
    echo "        ---------------------------------"
    echo "        10045_090212_TC29297 DICOM/RAW 4_MPRAGE 5_MPRAGE 6_3DT2          10_BOLD 11_BOLD NONE"
    echo ""
    echo "    <input directory> /export/scratch/zazulia/raw"
    echo "        Ex. For the first line of MRI.dat, the DICOMS are fetched from" 
    echo "            <input directory>/10045_090212_TC29297/scans/<label>/<PATH>" 
    echo ""
    echo "    <output directory>"
    echo "        Ex. For the first line of MRI.dat, the output goes to <output directory>/10045_090212_TC29297/nii"
    exit
fi
id=$2;od=$3;sd=$4;bs=$5;

echo "here0 $1"

IFS=$'\n' read -d '' -ra csv < $1

echo "here1"



#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

echo "#!/bin/bash" > $bs
echo "" >> $bs

echo "here2"

for ((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]};p0=${line[1]}

    echo "s0 = ${s0}    p0 = ${p0}"

    od1=${od}/${s0}/nii

    c0="mkdir ${od}/${s0}";echo $c0; $c0
    c0="mkdir ${od}/${s0}/nii";echo $c0; $c0

    f0=$sd/${s0}.sh 
    echo "#!/bin/bash" > $f0

    echo $s0
    for j in ${line[@]:2}; do
        echo "    ${j}"
        if [ "${j}" != "NONE" ];then
            dir0=${id}/${s0}/scans/${j}/${p0}
            echo "" >> $f0
            echo "${P0} -o ${od1} -f ${s0}_${j} ${dir0}" >> $f0
        fi
    done
    echo "${f0} > ${f0}.txt &" >> $bs
done

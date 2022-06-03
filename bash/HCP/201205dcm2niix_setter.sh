#!/bin/bash

#P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix20190902/dcm2niix -w 0 -z i" #-w 0 skip duplicates
#P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix200331/dcm2niix -w 0 -z i" #-w 0 skip duplicates
#P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix201102/dcm2niix -w 0 -z i" #-w 0 skip duplicates
#START201206
P0="/data/nil-bluearc/vlassenko/PKG/dcm2niix201102/dcm2niix -w 0 -z i -m y" #-w 0 skip duplicates

if [ ${#@} != 5 ];then
    echo "$0 <MRI.dat> <input directory> <output directory> <where to write dcm2niix scripts> <batch script>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        20020262A_MR_v1 2-MPRAGE_GRAPPA2 3-Axial_T2_Star NONE 31-ep2d_boldWU__EYES_OPEN_ 32-ep2d_boldWU__EYES_OPEN_ NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE"
    echo ""
    echo "    <input directory>"
    echo "        Ex. For the first line of MRI.dat, the DICOMS are fetched from" 
    echo "            <input directory>/AGBR-048/scans/resources/DICOM/files" 
    echo ""
    echo "    <output directory>"
    echo "        Ex. For the first line of MRI.dat, the output goes to <output directory>/108015/nii"
    exit
fi
id=$2;od=$3;sd=$4;bs=$5;

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

mkdir -p $od
mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    echo ${line[0]}

    IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
    if((${#s0[1]}==9));then

        f0= 
        for j in ${line[@]:16};do
            echo "    ${j}"
            if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
                if [ -z "$f0" ];then
                    str="${line[0]////_}"
                    #echo "str = $str"
                    f0=$sd/${str}.sh 
                    echo "#!/bin/bash" > $f0
                    echo "" >> $f0
                    od1=${od}/nii/${line[0]}
                    echo "mkdir -p ${od1}" >> $f0
                fi
                if [ -n "$f0" ];then
                    dir0=${id}/${line[0]}/${j}/DICOM
                    echo "${P0} -o ${od1} -f ${j} ${dir0}" >> $f0
                fi
            fi
        done
        if [ -n "$f0" ];then
            #echo "${f0} > ${f0}.txt &" >> $bs
            echo "${f0} > ${f0}.txt" >> $bs
        fi
    fi
done
echo "Output written to $bs"

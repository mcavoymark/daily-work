#!/bin/bash

if [ ${#@} != 4 ];then
    echo "$0 <MRI.dat> <HCP directory> <redo MRI.dat> <rm.sh>"
    echo ""
    echo "    <HCP directory>"
    echo "        Ex. /data/nil-bluearc/vlassenko/HCP/sub" 
    echo "            Check for existence of /data/nil-bluearc/vlassenko/HCP/sub/20020262A_MR_v1/vglab" 
    echo ""
    exit
fi
id=$2;of=$3;r0=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

#rm -f $of
echo "subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4" > $of
echo "---------------------------------------------------------------------------------------" >> $of

echo "#!/bin/bash" > $r0
echo '' >> $r0

for ((i=2;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}
    echo $s0

    if [[ "${line[1]}" = "NONE" || "${line[1]}" = "NOTUSEABLE" ]];then
        echo "    T1 = ${line[1]}"
        continue
    fi

    d0=${id}/${s0}/vglab
    f0=${d0}/T1w/vglab/stats/aseg.stats
    f1=${d0}/T1w/wmparc.nii.gz
    if [ ! -d "${d0}" ];then
        echo "    ${d0} does not exist"
        echo ${csv[i]} >> $of
        echo "rm -rf ${d0}" >> $r0
        continue
    fi
    if [ ! -f "${f0}" ];then
        echo "    ${f0} does not exist"
        echo ${csv[i]} >> $of
        echo "rm -rf ${d0}" >> $r0
        continue
    fi
    if [ ! -f "${f1}" ];then
        echo "    ${f1} does not exist"
        echo ${csv[i]} >> $of
        echo "rm -rf ${d0}" >> $r0
        continue
    fi
done

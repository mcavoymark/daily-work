#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_slicetimertxt
P1=/usr/local/pkg/fsl5.0.11/bin/slicetimer

if [ ${#@} != 2 ]; then
    echo "$0 <MRI.dat> <input and output directory>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        131017_CC377881 4-t1_mpr_1mm_p2_pos50 5-t2_spc_1mm_p2 NONE 9-ep2d_bold_connect 19-ep2d_bold_connect NONE NONE NONE NONE NONE NONE 17-gre_field_mapping_e2 18-gre_field_mapping_e2_ph NONE NONE"
    echo ""
    echo "    <input and output directory>"
    echo "        Ex. /data/nil-bluearc/vlassenko/mcavoy/HCP/sub"
    echo "            Files to be slicetimed are grabbed from /data/nil-bluearc/vlassenko/mcavoy/HCP/sub/131017_CC377881/nii"
    echo "            Sicetimed are written to /data/nil-bluearc/vlassenko/mcavoy/HCP/sub/131017_CC377881/slctmd"
    exit
fi
id=$2

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

for ((i=2;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]};T1=${line[1]};T2=${line[2]};FLAIR=${line[3]}
    id1=${id}/${s0}
    if [ ! -d "${id1}" ];then
        id1="${id1/noT2/}"
    fi
    echo "id1 = $id1"

    echo "${s0}"
    for j in ${line[@]:4:4}; do
        echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then

            json=${id1}/${j}.json
            mapfile -t RepetitionTime < <( grep RepetitionTime $json )
            #echo "RepetitionTime = ${RepetitionTime}"
            IFS=$' ,' read -ra line0 <<< ${RepetitionTime}
            #echo "line0 = ${line0[@]}"
            #echo "line0[1] = ${line0[1]}"
            TR=${line0[1]}
            echo "        TR = ${TR}"

            #if(( $(echo "$TR > 1" |bc -l) ));then
            if(( $(echo "$TR > 1.33" |bc -l) ));then
                echo "        slice timing"
                superbird=($(${P0} -json $json))
                ${P1} -i ${id1}/${j}.nii.gz -o ${id1}/${j}_slctmd.nii.gz --tcustom=${superbird}
            fi
        fi
    done
    echo ''
done

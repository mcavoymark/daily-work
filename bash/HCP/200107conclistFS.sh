#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "$0 <csv> <nifti directory> <directory to write concs> <list name>"
    echo ""
    echo "    <csv>"
    echo "        BOLD,structural"
    echo ""
    echo "        If BOLD and structural are the same, then only need one field."
    echo ""
    echo "        Ex. AGBR-048,108050"
    echo "            108209"
    echo ""
    exit
fi
id=$2;od=$3;ln=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm ${ln}; touch ${ln}
for ((i=0;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 
    s0=${line[0]}
    echo ${s0}

    if (( ${#line[@]} > 1 ));then
        #echo "    ${#line[@]}"
        s1=${line[1]}
    else
        s1=${line[0]}
    fi
    
    echo "    s1=${s1}"

    conc=${od}/${s0}.conc
    if [ ! -f "$conc" ];then
        echo "    $conc not found. Creating ..."
        touch ${conc}
        for j in ${id}/${s0}*.gz;do
            echo ${j} >> ${conc}
        done
    fi

    if [ -f "$conc" ];then
        ev=
        superbird=($(cat $conc | wc -l)) 
        if ((superbird==4));then
            ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/fourruns.fidl
        elif ((superbird==2));then
            elephantpool=($(cat $conc | head -1))
            if [[ "$elephantpool" = *"rfMRI_REST"* ]];then
                ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/tworuns.fidl
            else
                ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/tworuns_project5.fidl
            fi
        elif ((superbird==1));then
            ev=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun_project5.fidl
        fi
        if [ -z "${ev}" ];then
            echo "    ERROR: No event file superbird=$superbird"
        else

            #if [ -d "/data/nil-bluearc/vlassenko/MAN/Chang/${s0}" ];then
            #    hippo1=($(ls -t /data/nil-bluearc/vlassenko/MAN/Chang/${s0}/*${s0}*.gz | head -1))
            #    if [ ! -z "${hippo1}" ];then
            #        echo ${conc} >> ${ln}
            #        echo ${ev} >> ${ln}
            #        echo ${hippo1} >> ${ln}
            #        echo '' >> ${ln}
            #    fi
            #fi
            #if [ -d "/data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}" ];then
            #    hippo2=($(ls -t /data/nil-bluearc/vlassenko/MAN/mcavoy/${s0}/*${s0}*.gz | head -1))
            #    if [ ! -z "${hippo2}" ];then
            #        echo ${conc} >> ${ln}
            #        echo ${ev} >> ${ln}
            #        echo ${hippo2} >> ${ln}
            #        echo '' >> ${ln}
            #    fi
            #fi 

    
            hippo=/data/nil-bluearc/vlassenko/HCP/sub/${s1}/vglab/T1w/wmparc.nii.gz
            if [ -f "$hippo" ];then
                echo ${conc} >> ${ln}
                echo ${ev} >> ${ln}
                echo ${hippo} >> ${ln}
                echo '' >> ${ln}
            else
                echo "    $hippo not found"
            fi
            hippo=/data/nil-bluearc/vlassenko/HCP/sub/${s1}/6.0vglab/T1w/wmparc.nii.gz
            if [ -f "$hippo" ];then
                echo ${conc} >> ${ln}
                echo ${ev} >> ${ln}
                echo ${hippo} >> ${ln}
                echo '' >> ${ln}
            else
                echo "    $hippo not found"
            fi

        fi
    fi
done
echo "List written to ${ln}"

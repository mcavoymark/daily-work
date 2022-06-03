#!/bin/bash
D0=/home/usr/mcavoy/HCP/scripts
#ES=${D0}/SetUpHCPPipeline_mm.sh
ES=${D0}/220209SetUpHCPPipeline.sh
#SCRIPT0=${D0}/GenericfMRIVolumeProcessingPipelineBatch_mm.sh

if [ ${#@} != 6 ];then
    echo "$0 <MRI.dat> <nii dir> <hcp dir> <where to write the subject scripts> <batch script> <which HCP pipe script to run>" 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4"
    echo "        -----------------------------------------------------------------------"
    echo "        AGBR-048 10-T1w_MPR_vNav_4e_RMS 26-T2w_SPC_vNav 27-3D_FLAIR_Sag 14-rfMRI_REST1_AP 16-rfMRI_REST2_PA 18-rfMRI_REST2_AP 20-rfMRI_REST2_PA 13-rfMRI_REST1_AP_SBRef 15-rfMRI_REST2_PA_SBRef 17-rfMRI_REST2_AP_SBRef 19-rfMRI_REST2_PA_SBRef"
    echo ""
    echo "    HCP output written to <hcpdir>/subject/<hostname>" 
    echo ""
    echo "    <which HCP pipe script to run>"
    echo "        Ex. 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh"
    echo ""
    exit
fi
id0=$2;od0=$3;sd=$4;bs=$5;SCRIPT0=${D0}/$6

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

#for i in ${csv[@]:2}; do
#    echo "i = $i"
#    IFS=$',\n' read -ra line <<< $i
for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}

    #d0=${id0}/${line[0]}
    #if [ ! -d "$d0" ];then
    #    d0="${d0/noT2/}"
    #    if [ ! -d "$d0" ];then
    #        echo "$d0 does not exist"
    #        continue
    #    fi
    #fi
    #START201022
    d0=${id0}/${line[0]}
    if [ ! -d "$d0" ];then
        d0="${d0/noT2/}"
        if [ ! -d "$d0" ];then
            d0="${d0/edit/}"
            if [ ! -d "$d0" ];then
                echo "$d0 does not exist"
                continue
            fi
        fi
    fi



    s0=${line[0]}
    str="${s0////_}"
    F0=$sd/${str}.sh
    echo "F0 = ${F0}"

    echo "#!/bin/bash" > ${F0}
    echo "" >> ${F0}
    echo 'ES='${ES} >> ${F0}
    echo 'P0='${SCRIPT0} >> ${F0}
    echo 'S0='${line[0]} >> ${F0}
    echo 'S1='${od0}'/${S0}' >> ${F0}
    echo "" >> ${F0}
    echo '${P0} \' >> ${F0}
    echo '    --StudyFolder=${S1} \' >> ${F0}
    echo '    --Subject=$(hostname) \' >> ${F0}
    echo '    --runlocal \' >> ${F0}
    echo '    --fMRITimeSeries="\' >> ${F0}

    end7quote=;end6quote=;end5quote=;end4quote=;
    if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
        end7quote='"'
    elif [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
        end6quote='"'
    elif [ "${line[5]}" != "NONE" ] && [ "${line[5]}" != "NOTUSEABLE" ];then
        end5quote='"'
    else
        end4quote='"'
    fi 

    #d0=${id0}/${line[0]}
    #if [ ! -d "$d0" ];then
    #    d0="${d0/noT2/}"
    #    if [ ! -d "$d0" ];then
    #        echo "    $d0 does not exist"
    #        exit
    #    fi
    #fi

    if [ "${line[4]}" != "NONE" ] && [ "${line[4]}" != "NOTUSEABLE" ];then
        superbird=${d0}/${line[4]}_slctmd.nii.gz 
        if [ ! -f "$superbird" ];then
            superbird=${d0}/${line[4]}.nii.gz
            if [ ! -f "$superbird" ];then
                echo "    $superbird does not exist"
                str="${s0/__/_}" 
                continue
            fi
        fi
        echo '        '${superbird}${end4quote}' \' >> ${F0}
    fi
    if [ "${line[5]}" != "NONE" ] && [ "${line[5]}" != "NOTUSEABLE" ];then
        superbird=${d0}/${line[5]}_slctmd.nii.gz 
        if [ ! -f "$superbird" ];then
            superbird=${d0}/${line[5]}.nii.gz
        fi
        echo '        '${superbird}${end5quote}' \' >> ${F0}
    fi
    if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
        superbird=${d0}/${line[6]}_slctmd.nii.gz 
        if [ ! -f "$superbird" ];then
            superbird=${d0}/${line[6]}.nii.gz
        fi
        echo '        '${superbird}${end6quote}' \' >> ${F0}
    fi
    if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
        superbird=${d0}/${line[7]}_slctmd.nii.gz 
        if [ ! -f "$superbird" ];then
            superbird=${d0}/${line[7]}.nii.gz
        fi
        echo '        '${superbird}${end7quote}' \' >> ${F0}
    fi
    if [ "${line[8]}" != "NONE" ] && [ "${line[8]}" != "NOTUSEABLE" ];then
        echo '    --fMRISBRef="\' >> ${F0}
        if [ "${line[4]}" != "NONE" ] && [ "${line[4]}" != "NOTUSEABLE" ];then
            echo '        '${d0}/${line[8]}.nii.gz${end4quote}' \' >> ${F0}
        fi
        if [ "${line[5]}" != "NONE" ] && [ "${line[5]}" != "NOTUSEABLE" ];then
            echo '        '${d0}/${line[9]}.nii.gz${end5quote}' \' >> ${F0}
        fi
        if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
            echo '        '${d0}/${line[10]}.nii.gz${end6quote}' \' >> ${F0}
        fi
        if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
            echo '        '${d0}/${line[11]}.nii.gz${end7quote}' \' >> ${F0}
        fi
    fi

    #if [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ];then
    #START200914
    #if [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ] || [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ];then
    #if [[ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ]] || [[ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ]];then
    #if [ [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ] ] || [ [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ] ];then
    #if [[ [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ] ]] || [[ [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ] ]];then
    if [[ "${line[12]}" != "NOTUSEABLE" && "${line[12]}" != "NONE" ]] || [[ "${line[14]}" != "NOTUSEABLE" && "${line[14]}" != "NONE" ]];then

        echo '    --SpinEchoPhaseEncodeNegative="\' >> ${F0}
        if [ "${line[4]}" != "NONE" ] && [ "${line[4]}" != "NOTUSEABLE" ];then

            #superbird=${d0}/${line[12]}.nii.gz
            if [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ];then
                superbird=${d0}/${line[12]}.nii.gz
            else
                superbird=${d0}/${line[14]}.nii.gz
            fi

            echo '        '${superbird}${end4quote}' \' >> ${F0}
        fi
        if [ "${line[5]}" != "NONE" ] && [ "${line[5]}" != "NOTUSEABLE" ];then

            #superbird=${d0}/${line[12]}.nii.gz
            #echo '        '${superbird}${end5quote}' \' >> ${F0}
            #START200821
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[12]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            elif [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ];then
                superbird=${d0}/${line[14]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            else
                superbird=${d0}/${line[12]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            fi

        fi
        if [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ];then
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[14]}.nii.gz
                echo '        '${superbird}${end6quote}' \' >> ${F0}
            fi
            if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[14]}.nii.gz
                echo '        '${superbird}${end7quote}' \' >> ${F0}
            fi
        else
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[12]}.nii.gz
                echo '        '${superbird}${end6quote}' \' >> ${F0}
            fi
            if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[12]}.nii.gz
                echo '        '${superbird}${end7quote}' \' >> ${F0}
            fi
        fi
        echo '    --SpinEchoPhaseEncodePositive="\' >> ${F0}
        if [ "${line[4]}" != "NONE" ] && [ "${line[4]}" != "NOTUSEABLE" ];then

            #superbird=${d0}/${line[13]}.nii.gz
            if [ "${line[12]}" != "NOTUSEABLE" ] && [ "${line[12]}" != "NONE" ];then
                superbird=${d0}/${line[13]}.nii.gz
            else
                superbird=${d0}/${line[15]}.nii.gz
            fi

            echo '        '${superbird}${end4quote}' \' >> ${F0}
        fi
        if [ "${line[5]}" != "NONE" ] && [ "${line[5]}" != "NOTUSEABLE" ];then

            #superbird=${d0}/${line[13]}.nii.gz
            #echo '        '${superbird}${end5quote}' \' >> ${F0}
            #START200821
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[13]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            elif [ "${line[14]}" != "NOTUSEABLE" ] && [ "${line[14]}" != "NONE" ];then
                superbird=${d0}/${line[15]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            else
                superbird=${d0}/${line[13]}.nii.gz
                echo '        '${superbird}${end5quote}' \' >> ${F0}
            fi

        fi
        if [ "${line[15]}" != "NOTUSEABLE" ] && [ "${line[15]}" != "NONE" ];then
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[15]}.nii.gz
                echo '        '${superbird}${end6quote}' \' >> ${F0}
            fi
            if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[15]}.nii.gz
                echo '        '${superbird}${end7quote}' \' >> ${F0}
            fi
        else
            if [ "${line[6]}" != "NONE" ] && [ "${line[6]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[13]}.nii.gz
                echo '        '${superbird}${end6quote}' \' >> ${F0}
            fi
            if [ "${line[7]}" != "NONE" ] && [ "${line[7]}" != "NOTUSEABLE" ];then
                superbird=${d0}/${line[13]}.nii.gz
                echo '        '${superbird}${end7quote}' \' >> ${F0}
            fi
        fi
    fi


    echo '    --native \' >> ${F0}
    echo '    --FinalFMRIResolution=0.7 \' >> ${F0}
    echo '    --EnvironmentScript=${ES}' >> ${F0}

    echo "${F0} > ${F0}.txt 2>&1 &" >> $bs
done
echo "Output written to $bs"

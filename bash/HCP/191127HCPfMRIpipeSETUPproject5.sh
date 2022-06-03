#!/bin/bash
D0=/home/usr/mcavoy/HCP/scripts
ES=${D0}/SetUpHCPPipeline_mm.sh
SCRIPT0=${D0}/GenericfMRIVolumeProcessingPipelineBatch_mm.sh

if [ ${#@} != 4 ]; then
    echo "$0 <MRI.dat> <hcp dir> <where to write the subject scripts> <batch script>"
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        131017_CC377881 4-t1_mpr_1mm_p2_pos50 5-t2_spc_1mm_p2 NONE 9-ep2d_bold_connect 19-ep2d_bold_connect NONE NONE NONE NONE NONE NONE 17-gre_field_mapping_e2 18-gre_field_mapping_e2_ph NONE NONE"
    echo ""
    echo "    HCP output written to <hcpdir>/subject/<hostname>" 
    exit
fi
od0=$2;sd=$3;bs=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo "#!/bin/bash" > $bs
echo "" >> $bs

#for i in ${csv[@]:2}; do
#    echo "i = $i"
#    IFS=$',\n' read -ra line <<< $i
for ((i=2;i<${#csv[@]};++i)); do
    #echo ${csv[i]}
    IFS=$',\n ' read -ra line <<< ${csv[i]}

    #echo "line = ${line[@]}"

    F0=${sd}/${line[0]}.sh
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

    #echo '    --fMRITimeSeries="\' >> ${F0}
    #echo '        ${S1}/slctmd/${S0}_'${line[4]}'_slctmd.nii.gz \' >> ${F0}
    #echo '        ${S1}/slctmd/${S0}_'${line[5]}'_slctmd.nii.gz" \' >> ${F0}
    #START191127
    echo '    --fMRITimeSeries="\' >> ${F0}
    if [ "${line[5]}" != "NONE" ];then
        echo '        ${S1}/slctmd/${S0}_'${line[4]}'_slctmd.nii.gz \' >> ${F0}
        echo '        ${S1}/slctmd/${S0}_'${line[5]}'_slctmd.nii.gz" \' >> ${F0}
    else
        echo '        ${S1}/slctmd/${S0}_'${line[4]}'_slctmd.nii.gz" \' >> ${F0}
    fi

#    echo '    --MagnitudeInputName="\' >> ${F0}
#    echo '        ${S1}/nii/${S0}_'${line[12]}'.nii.gz \' >> ${F0}
#    echo '        ${S1}/nii/${S0}_'${line[12]}'.nii.gz" \' >> ${F0}
#    echo '    --PhaseInputName="\' >> ${F0}
#    echo '        ${S1}/nii/${S0}_'${line[13]}'.nii.gz \' >> ${F0}
#    echo '        ${S1}/nii/${S0}_'${line[13]}'.nii.gz" \' >> ${F0}
    echo '    --native \' >> ${F0}
    echo '    --FinalFMRIResolution=0.7 \' >> ${F0}
    echo '    --EnvironmentScript=${ES}' >> ${F0}

    echo "${F0} > ${F0}.txt &" >> $bs
done

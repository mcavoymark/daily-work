#!/bin/bash
D0=/home/usr/mcavoy/HCP/scripts
ES=${D0}/SetUpHCPPipeline_mm.sh
#SCRIPT0=${D0}/GenericfMRIVolumeProcessingPipelineBatch_mm.sh
SCRIPT0=${D0}/200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

if [ ${#@} != 4 ]; then
    echo "$0 <single column of MR IDs> <hcp dir> <where to write the subject scripts> <batch script>"
    echo ""
    echo "    HCP output written to <hcpdir>/subject/<hostname>" 
    exit
fi
od0=$2;sd=$3;bs=$4

IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

for ((i=0;i<${#csv[@]};++i)); do
    IFS=$',\n ' read -ra line <<< ${csv[i]}

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

    superbird=/data/nil-bluearc/vlassenko/HCP/sub/${line[0]}/slctmd
    array=($(ls ${superbird}))
    echo "    bolds = ${#array[@]}" 
    echo '    --fMRITimeSeries="\' >> ${F0}
    if ((${#array[@]} == 1));then
        echo '        '${superbird}/${array[0]}'" \' >> ${F0}
    else
        echo '        '${superbird}/${array[0]}' \' >> ${F0}
        echo '        '${superbird}/${array[1]}'" \' >> ${F0}
    fi

    echo '    --native \' >> ${F0}
    echo '    --FinalFMRIResolution=0.7 \' >> ${F0}
    echo '    --EnvironmentScript=${ES}' >> ${F0}

    echo "${F0} > ${F0}.txt &" >> $bs
done

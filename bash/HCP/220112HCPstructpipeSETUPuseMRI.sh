#!/bin/bash

D0=/home/usr/mcavoy/HCP/scripts

#SCRIPT1=${D0}/SetUpHCPPipeline_mm.sh
#START220211
SCRIPT1=${D0}/220209SetUpHCPPipeline.sh

SCRIPT0=${D0}/201105PreFreeSurferPipelineBatch_mm.sh
SCRIPT2=${D0}/200305FreeSurferPipelineBatch_editFS.sh
SCRIPT3=${D0}/220107PostFreeSurferPipelineBatch.sh





if [ ${#@} != 5 ];then
    echo "$0 <MRI.dat> <hcpdir> <where to write the subject scripts> <batch script> <niidir>"
    echo ""
    echo "    HCP output written to <hcpdir>/subject/<hostname>" 
    exit
fi
od0=$2;sd=$3;bs=$4;nd=$5

IFS=$'\n' read -d '' -ra csv < $1

mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}

    echo ${s0}

    if [[ "${line[1]}" = "NONE" || "${line[1]}" = "NOTUSEABLE" ]];then
        echo "    ${line[1]}"
        continue
    fi
    od=${od0}/${s0}

    s1=${s0}
    T1f=${nd}/${s0}/${line[1]}.nii.gz
    if [ ! -f "$T1f" ];then
        IFS='/' read -ra elephantpool <<< ${s0}

        #s0=${elephantpool[0]}/${elephantpool[1]:0:9}
        #T1f=${nd}/${s0}/${line[1]}.nii.gz
        #START210226
        s1=${elephantpool[0]}/${elephantpool[1]:0:9}
        T1f=${nd}/${s1}/${line[1]}.nii.gz


        if [ ! -f "$T1f" ];then
            echo "ERROR: $T1f not found"
            continue 
        fi 
    fi



    T2f=
    if [[ "${line[2]}" != "NONE" && "${line[2]}" != "NOTUSEABLE" ]];then

        #superbird=${nd}/${s0}/${line[2]}.nii.gz
        superbird=${nd}/${s1}/${line[2]}.nii.gz

        [ -f "${superbird}" ] && T2f=${superbird} || echo "    ${superbird} does not exist"
    fi

    echo "    T1f = $T1f"
    echo "    T2f = $T2f"

    #str="${s0////_}"
    #F0=$sd/${str}.sh
    F0=$sd/${s0////_}.sh

    echo "    ${F0}"

    echo "#!/bin/bash" > ${F0}
    echo "" >> ${F0}
    echo ${SCRIPT0}' \' >> ${F0}
    echo '    --StudyFolder='${od}' \' >> ${F0}
    echo '    --Subject=$(hostname) \' >> ${F0}
    echo '    --runlocal \' >> ${F0}
    echo '    --T1='${T1f}' \' >> ${F0}
    echo '    --T2='${T2f}' \' >> ${F0}
    echo '    --GREfieldmapMag="NONE" \' >> ${F0}
    echo '    --GREfieldmapPhase="NONE" \' >> ${F0}
    echo '    --EnvironmentScript='${SCRIPT1} >> ${F0}
    echo '' >> ${F0}
    echo ${SCRIPT2}' \' >> ${F0}
    echo '    --StudyFolder='${od}' \' >> ${F0}
    echo '    --Subject=$(hostname) \' >> ${F0}
    echo '    --runlocal \' >> ${F0}
    echo '    --EnvironmentScript='${SCRIPT1} >> ${F0}
    echo '' >> ${F0}
    echo ${SCRIPT3}' \' >> ${F0}
    echo '    --StudyFolder='${od}' \' >> ${F0}
    echo '    --Subject=$(hostname) \' >> ${F0}
    echo '    --runlocal \' >> ${F0}
    echo '    --EnvironmentScript='${SCRIPT1} >> ${F0}

    echo "${F0} > ${F0}.txt 2>&1 &" >> $bs
done
echo "Output written to $bs"

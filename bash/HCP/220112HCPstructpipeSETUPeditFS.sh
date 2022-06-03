#!/bin/bash
date0=$(date +%y%m%d)

D0=/home/usr/mcavoy/HCP/scripts
SCRIPT1=${D0}/SetUpHCPPipeline_mm.sh
SCRIPT2=${D0}/200305FreeSurferPipelineBatch_editFS.sh
#SCRIPT3=${D0}/200305PostFreeSurferPipelineBatch_mm.sh
SCRIPT3=${D0}/220107PostFreeSurferPipelineBatch.sh

if [ ${#@} != 4 ];then
    echo "$0 <MRI.dat> <hcpdir> <where to write the subject scripts> <batch script>"
    echo ""
    exit
fi
od0=$2;sd=$3;bs=$4
IFS=$'\n' read -d '' -ra csv < $1
mkdir -p $sd
echo "#!/bin/bash" > $bs
echo "" >> $bs

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    s0=${line[0]}
    echo ${s0}

    od=${od0}/${s0}

    str="${s0////_}"
    #F0=$sd/${str}_edit_${date0}.sh
    #F0=$sd/${str}_edit.sh
    F0=$sd/${str}.sh
    echo "    ${F0}"

    echo "#!/bin/bash" > ${F0}
    echo "" >> ${F0}
    echo ${SCRIPT2}' \' >> ${F0}
    echo '    --StudyFolder='${od}' \' >> ${F0}
    echo '    --Subject=$(hostname) \' >> ${F0}
    echo '    --runlocal \' >> ${F0}
    echo '    --editFS \' >> ${F0}
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

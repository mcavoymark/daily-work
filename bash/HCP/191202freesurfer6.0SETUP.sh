#!/bin/bash

if [ ${#@} != 4 ]; then
    echo "$0 <csv list> <HCP directory> <where to write the subject scripts> <batch script>"
    exit
fi
D=$2;sd=$3;bs=$4
IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

mkdir -p $sd

echo "#!/bin/bash" > $bs
echo "" >> $bs

for S in ${csv[@]};do

    F0=${sd}/${S}.sh
    echo "${F0}"

    echo "#!/bin/bash" > ${F0}
    echo "" >> ${F0}
    echo "export FREESURFER_HOME=/usr/local/pkg/freesurfer6.0" >> ${F0}
    echo "source $FREESURFER_HOME/SetUpFreeSurfer.csh" >> ${F0}
    echo "" >> ${F0}
    echo 'D='$D >> ${F0}
    echo 'S='$S >> ${F0}
    echo 'F=6.0$(hostname)' >> ${F0}
    echo "" >> ${F0}
    echo 'T1=${D}/${S}/$(hostname)/T1w/T1w_acpc.nii.gz' >> ${F0}
    echo 'T2=${D}/${S}/$(hostname)/T2w/T2w_acpc.nii.gz' >> ${F0}
    echo "" >> ${F0}
    echo 'recon-all -all -qcache -sd ${D}/${S} -s ${F} -i ${T1} -T2 ${T2} -T2pial -hippocampal-subfields-T1T2 ${T2} T2' >> ${F0}

    echo "${F0} > ${F0}.txt &" >> $bs
done

#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_wmparc

if [ ${#@} != 2 ];then
    echo "You have provided ${#@} parameters."
    echo ""
    echo "$0 <ex. 211202hippo_edit.csv> <out script>" 
    echo ""
    echo "Creates a script that replaces freesurfer regions with handdrawn."
    echo ""
    exit
fi
bs=$2
IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

echo -e "#!/bin/bash\n" > $bs

for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    #echo ${csv[i]}

    wmparc0=${line[7]}
    man0=${line[5]}

    str="${line[5]##*/}"
    #echo $str
    str="${str%%.nii.gz}"
    #echo $str
    out0=${str}_wmparc.nii.gz
    
    echo "WMPARC=${wmparc0}" >> $bs
    echo "MAN=${man0}" >> $bs
    echo "OUT=${out0}" >> $bs
    echo ${P0}' -wmparc ${WMPARC} -man ${MAN} -out ${OUT}' >> $bs
    echo "">>$bs
done
chmod +x $bs
echo "Output written to $bs"

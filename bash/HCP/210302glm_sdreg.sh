#!/bin/bash

P0=/home/usr/mcavoy/FIDL/build/fidl_timestr3
P1=/home/usr/mcavoy/FIDL/build/fidl_residuals
P2=/home/usr/mcavoy/FIDL/build/fidl_tc_ss

D0=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc
D1=/data/nil-bluearc/vlassenko/mcavoy/HCP/masks

w0=vglab/T1w/wmparc.nii.gz
lut0=/usr/local/pkg/freesurfer6.0/FreeSurferColorLUT.txt

#bfdat=/data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat

#if [ ${#@} != 5 ];then
if [ ${#@} != 6 ];then

    echo "You have provided ${#@} parameters."

    #echo "$0 <csv> <hcp dir> <out dir> <bfdat> <name of batch script>" 
    echo "$0 <csv> <hcp dir> <out dir> <bfdat> <name of batch script> <KEEPIT or GSR>" 

    echo "    <csv>"
    echo "        List of glms with path"
    echo "    <out dir>"
    echo "        Where individual scripts and output are written"
    echo "    <bfdat>"
    echo "        Bold frames files."
    echo "        Eg. For RES, /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat"
    echo "        Eg. For PMR, /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun164.dat"
    echo "    <KEEPIT or GSR>"
    echo "        KEEPIT No global signal regression. Global signal is retained."
    echo "        GSR    Global signal regression. Global signal is removed."
    echo ""
    exit
fi
h0=$2;od=$3;bfdat=$4;bs=$5;metric=$6
IFS=$'\n' read -d '' -ra csv < $1


if [[ "$metric" != "KEEPIT" && "$metric" != "GSR" ]];then
    echo "metric = $metric  Unknown. Needs to be either KEEPIT or GSR"
    exit
fi
retain0=
if [[ "$metric" != "GSR" ]];then
    retain0="-retain_estimates 1 2"
fi


echo "#!/bin/bash" > $bs
echo "" >> $bs

scratchdir=${od}/SCRATCH$(${P0})/
echo "scratchdir=$scratchdir"
mkdir -p $scratchdir

for((i=0;i<${#csv[@]};++i));do
    echo ${csv[i]}
    str=${csv[i]}
    str=${str##*/}
    str=${str%%.*}
    echo "    $str"
    conc=${D0}/$str.conc 

    IFS=$'\n_' read -d '' -ra line <<< $str
    id=${line[0]}_${line[1]}
    echo "    $id"
    mask=${D1}/${id}_brainmask_fs_LRreg.nii.gz
    echo "    $mask"
    root=${str}_res
    echo "    $root"

    tc_files=${scratchdir}${root}.conc

    superbird=${od}/fidl_tc_ss$(${P0}).sh
    echo "    $superbird"
    echo "#!/bin/bash" > $superbird
    echo "" >> $superbird
    #echo "nice -n 19 ${P1} -glm_file ${csv[i]} -bold_files ${conc} -retain_estimates 1 2 -percent_change -mask ${mask} -root ${root} -scratchdir ${scratchdir} -float" >> $superbird

    #echo "${P1} -glm_file ${csv[i]} -bold_files ${conc} -retain_estimates 1 2 -percent_change -mask ${mask} -root ${root} -scratchdir ${scratchdir} -float" >> $superbird
    #START210302
    echo "${P1} -glm_file ${csv[i]} -bold_files ${conc} ${retain0} -percent_change -mask ${mask} -root ${root} -scratchdir ${scratchdir} -float" >> $superbird

    echo "" >> $superbird
    #echo "nice -n 19 ${P2} -tc_names eyesopen -tc_cond 0 -root ${str} -tc_files ${tc_files} -cond_and_frames ${bfdat} -mask ${mask} -sdTR -clean_up" >> $superbird
    #echo "${P2} -tc_names eyesopen -tc_cond 0 -root ${str} -tc_files ${tc_files} -cond_and_frames ${bfdat} -mask ${mask} -sdTR -clean_up" >> $superbird

    echo "RF=${h0}/${line[0]}/${line[1]}/${w0}" >> $superbird
    echo "LUT=$lut0" >> $superbird
    echo "${P2} -tc_names eyesopen -tc_cond 0 -root ${str} -tc_files ${tc_files} -cond_and_frames ${bfdat} -region_file "'${RF}'" -lut "'${LUT}'" -sdTR -nii.gz ONLY -clean_up" >> $superbird
    
    #echo "${superbird} > ${superbird}.txt 2>&1 &" >> $bs
    echo "${superbird} > ${superbird}.txt 2>&1" >> $bs

    chmod +x ${superbird}

done
chmod +x $bs
echo "Output written to $bs"

#nice +19 $BIN/fidl_residuals -glm_file /vgpool/data1/mcavoy/HCP/conc/glm/108044_180911RES_14-rfMRI_REST1_AP.glm -bold_files /data/nil-bluearc/vlassenko/mcavoy/HCP/conc/108044_180911RES_14-rfMRI_REST1_AP.conc -retain_estimates 1 2 -percent_change -mask /data/nil-bluearc/vlassenko/mcavoy/HCP/masks/108044_180911RES_brainmask_fs_LRreg.nii.gz -root "108044_180911RES_14-rfMRI_REST1_AP_res" -scratchdir SCRATCH_210107:17:23:07:923845/ -float

#nice +19 $BIN/fidl_tc_ss -tc_names eyesopen -tc_cond 0 -root "108044_180911RES_14-rfMRI_REST1_AP" -tc_files SCRATCH_210107:17:23:07:923845/108044_180911RES_14-rfMRI_REST1_AP_res.conc -cond_and_frames "SCRATCH_210107:17:23:07:923845/108044_180911RES_14-rfMRI_REST1_AP_bf.dat" -mask /data/nil-bluearc/vlassenko/mcavoy/HCP/masks/108044_180911RES_brainmask_fs_LRreg.nii.gz -sdTR -event_file /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.fidl -clean_up

#/home/usr/mcavoy/FIDL/build/fidl_residuals -glm_file /vgpool/data1/mcavoy/HCP/conc/glm/108133_190826RES_20-rfMRI_REST2_PA.glm -bold_files /data/nil-bluearc/vlassenko/mcavoy/HCP/conc/108133_190826RES_20-rfMRI_REST2_PA.conc -retain_estimates 1 2 -percent_change -mask /data/nil-bluearc/vlassenko/mcavoy/HCP/masks/108133_190826RES_brainmask_fs_LRreg.nii.gz -root 108133_190826RES_20-rfMRI_REST2_PA_res -scratchdir SCRATCH/ -float

#/home/usr/mcavoy/FIDL/build/fidl_tc_ss -tc_names eyesopen -tc_cond 0 -root 108133_190826RES_20-rfMRI_REST2_PA -tc_files SCRATCH/108133_190826RES_20-rfMRI_REST2_PA_res.conc -cond_and_frames /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat -sdTR -region_file /data/nil-bluearc/vlassenko/HCP/sub/108133/190826RES/vglab/T1w/wmparc.nii.gz -lut /usr/local/pkg/freesurfer6.0/FreeSurferColorLUT.txt -nii.gz ONLY

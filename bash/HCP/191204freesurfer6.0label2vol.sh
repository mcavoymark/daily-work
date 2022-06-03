#!/bin/bash

if [ ${#@} != 2 ]; then
    echo "$0 <csv list> <HCP directory>"
    exit
fi
d0=$2
IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"

export FREESURFER_HOME=/usr/local/pkg/freesurfer6.0
source $FREESURFER_HOME/SetUpFreeSurfer.csh

for i in ${csv[@]};do
    echo $i
   
    o0=$d0/$i/6.0vglab/T1w
    mkdir -p $o0
    mri_label2vol --seg $d0/$i/6.0vglab/mri/wmparc.mgz --temp $d0/$i/vglab/T1w/T1w_acpc.nii.gz --o ${o0}/wmparc.nii.gz --regheader $d0/$i/6.0vglab/mri/wmparc.mgz

done

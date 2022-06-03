#!/bin/bash

#if [ ${#@} != 1 ]; then
#    echo "$0 <subject directory>"
#    echo "Ex.1 freeview /data/nil-bluearc/vlassenko/HCP/sub/<108 no. or MAP>/<session>"
#    exit
#fi

if [ ${#@} != 2 ]; then
    echo "$0 <subject directory> <MAN wmparc>"
    echo "Ex.1 freeview /data/nil-bluearc/vlassenko/HCP/sub/<108 no. or MAP>/<session>"
    exit
fi

#freeview -v \
#    $1/mri/T1.mgz \
#    $1/mri/wm.mgz \
#    $1/mri/brainmask.mgz \
#    $1/mri/aseg.mgz:colormap=lut:opacity=0.2 \
#    -f \
#    $1/surf/lh.white:edgecolor=blue \
#    $1/surf/lh.pial:edgecolor=red \
#    $1/surf/rh.white:edgecolor=blue \
#    $1/surf/rh.pial:edgecolor=red


#For hippocampus, the aparc+aseg will have a few more white matter voxels that are labeled as unknown in the aseg.

#freeview -v \
#    $1/mri/T1.mgz \
#    $1/mri/wm.mgz \
#    $1/mri/brainmask.mgz \
#    $1/mri/aparc+aseg.mgz:colormap=lut:opacity=0.2 \ 
#    -f \
#    $1/surf/lh.white:edgecolor=blue \ 
#    $1/surf/lh.pial:edgecolor=red \ 
#    $1/surf/rh.white:edgecolor=blue \ 
#    $1/surf/rh.pial:edgecolor=red

#freeview -v \
#    $1/mri/orig.mgz \
#    $1/mri/wmparc.mgz:colormap=lut:opacity=0.2 \
#    $1/mri/aseg.mgz:colormap=lut:opacity=0.2 \
#    -f \
#    $1/surf/lh.white:edgecolor=blue \
#    $1/surf/lh.pial:edgecolor=red \
#    $1/surf/rh.white:edgecolor=blue \
#    $1/surf/rh.pial:edgecolor=red

#freeview -v \
#    $1/mri/orig.mgz \
#    $1/mri/wmparc.mgz:colormap=lut:opacity=0.2 \
#    -f \
#    $1/surf/lh.white:edgecolor=blue \
#    $1/surf/lh.pial:edgecolor=red \
#    $1/surf/rh.white:edgecolor=blue \
#    $1/surf/rh.pial:edgecolor=red

#freeview -v \
#    $1/T1w/T1w_acpc.nii.gz \
#    $1/T1w/T1w_acpc_dc_restore.nii.gz \
#    $1/T1w/wmparc.nii.gz:colormap=lut:opacity=1.0 \
#    $1/T1w/aparc+aseg.nii.gz:colormap=lut:opacity=1.0

freeview -v \
    $1/T1w/T1w_acpc.nii.gz \
    $1/T1w/T1w_acpc_dc_restore.nii.gz \
    $1/T1w/wmparc.nii.gz:colormap=lut:opacity=1.0 \
    $1/T1w/aparc+aseg.nii.gz:colormap=lut:opacity=1.0 \
    $2:colormap=lut:opacity=1.0

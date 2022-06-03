#!/bin/bash

if [ ${#@} != 1 ]; then
    echo "$0 <subject directory>"
    echo "Ex. freeviewHCPedit.sh /data/nil-bluearc/vlassenko/HCP/sub/10045/090212ZAZ/vglab"
    exit
fi

if [ ! -f "$1/T1w/vglab/mri/brain.finalsurfs.manedit.mgz" ];then
    cp $1/T1w/vglab/mri/brain.finalsurfs.mgz $1/T1w/vglab/mri/brain.finalsurfs.manedit.mgz
fi

#freeview -v \
#    $1/T1w/vglab/mri/orig.mgz \
#    $1/T1w/vglab/mri/T1.mgz \
#    $1/T1w/vglab/mri/brainmask.mgz \
#    $1/T1w/vglab/mri/wm.mgz \
#    $1/T1w/vglab/mri/aseg.mgz:colormap=lut:opacity=0.2 \
#    $1/T1w/vglab/mri/brain.finalsurfs.manedit.mgz \
#    $1/T1w/vglab/mri/aparc.mgz:colormap=lut:opacity=0.2 \   DOESN'T EXIST
#    $1/T1w/vglab/mri/wmparc.mgz:colormap=lut:opacity=0.2 \
#    $1/T1w/vglab/mri/aparc+aseg.mgz:colormap=lut:opacity=0.2 \
#    -f \
#    $1/T1w/vglab/surf/lh.white:edgecolor=yellow \
#    $1/T1w/vglab/surf/lh.pial:edgecolor=red \
#    $1/T1w/vglab/surf/rh.white:edgecolor=yellow \
#    $1/T1w/vglab/surf/rh.pial:edgecolor=red

freeview -v \
    $1/T1w/vglab/mri/orig.mgz \
    $1/T1w/vglab/mri/T1.mgz \
    $1/T1w/vglab/mri/brainmask.mgz \
    $1/T1w/vglab/mri/wm.mgz \
    $1/T1w/vglab/mri/aseg.mgz:colormap=lut:opacity=0.2 \
    $1/T1w/vglab/mri/brain.finalsurfs.manedit.mgz \
    $1/T1w/vglab/mri/wmparc.mgz:colormap=lut:opacity=0.2 \
    $1/T1w/vglab/mri/aparc+aseg.mgz:colormap=lut:opacity=0.2 \
    -f \
    $1/T1w/vglab/surf/lh.white:edgecolor=yellow \
    $1/T1w/vglab/surf/lh.pial:edgecolor=red \
    $1/T1w/vglab/surf/rh.white:edgecolor=yellow \
    $1/T1w/vglab/surf/rh.pial:edgecolor=red

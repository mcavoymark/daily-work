#!/bin/bash
C3D=/data/nil-bluearc/vlassenko/mcavoy/ashs/ashs-fastashs_beta/ext/Linux/bin/c3d

if [ ${#@} != 3 ]; then
    echo "$0 <csv list> <indir> <outdir>"
    exit
fi
id=$2;od0=$3

IFS=$'\n' read -d '' -ra csv < $1
#echo "$1 number of lines = ${#csv[@]}"
#for i in ${csv[@]}; do
#    echo $i
#done
#echo ''

for i in ${csv[@]}; do
    echo $i
    T1=$id/$i/vglab/T1w/T1w_acpc.nii.gz
    T2=$id/$i/vglab/T2w/T2w_acpc.nii.gz
    echo "    T1 = $T1"
    echo "    T2 = $T2"

    od=$od0/$i
    mkdir -p $od
    cp -p $T1 $od
    cp -p $T2 $od
    $C3D $T1 -smooth 0.75vox -o $od/T1w_acpc_smooth0.75vox.nii.gz
    $C3D $T2 -smooth 0.75vox -o $od/T2w_acpc_smooth0.75vox.nii.gz

done

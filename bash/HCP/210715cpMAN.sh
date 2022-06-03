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

    #START210715
    $C3D $T1 -smooth 0.75vox -o $od/T1w_acpc_smooth0.75vox.nii.gz

    #cp -p $T2 $od
    #START210715
    if [ -f "$T2" ];then
        cp -p $T2 $od
        $C3D $T2 -smooth 0.75vox -o $od/T2w_acpc_smooth0.75vox.nii.gz
    elif [[ $T2 == *"noT2"* ]];then
        #echo "$T2 does not exist"
        superbird=${i%%noT2}
        T2b=$id/$superbird/vglab/T2w/T2w_acpc.nii.gz
        if [ -f "$T2b" ];then
            echo "$T2 does not exist, but $T2b exists"
            cp -p $T2b $od
            $C3D $T2b -smooth 0.75vox -o $od/T2w_acpc_smooth0.75vox.nii.gz
        else
            echo "$T2 does not exist and $T2b does not exist"
        fi
    fi

    #START210715
    #$C3D $T1 -smooth 0.75vox -o $od/T1w_acpc_smooth0.75vox.nii.gz
    #$C3D $T2 -smooth 0.75vox -o $od/T2w_acpc_smooth0.75vox.nii.gz

done

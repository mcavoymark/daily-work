#!/bin/bash
C3D=/data/nil-bluearc/vlassenko/mcavoy/ashs/ashs-fastashs_beta/ext/Linux/bin/c3d

if [ ${#@} != 2 ]; then
    echo "$0 <csv list> <indir>"
    exit
fi
id=$2;
IFS=$'\n' read -d '' -ra csv < $1

for i in ${csv[@]}; do
    echo $i

    cd $id/$i
    rm -r 53HCPvglab  6.0vglab  fsaverage  lh.EC_average  rh.EC_average
done

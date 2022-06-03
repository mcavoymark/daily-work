#!/bin/bash

if [ ${#@} != 1 ]; then
    echo "$0 <in dir>"
    echo ""
    exit
fi
id=$1

for i in $id/*;do

    #echo $i
    #for j in $i/scans/*;do
    #    echo "    $j"
    #    #if [ -d "$j/resources/DICOM" ];then
    #    #    c0="mv $j/resources/DICOM $j/DICOM"
    #    #    #echo "    $c0"
    #    #    $c0
    #    #fi
    #    if [ -d "$j/resources" ];then
    #        c0="rm -r $j/resources"
    #        #echo "    $c0"
    #        $c0
    #    fi
    #done    

    if [ -d "$i" ];then
        #echo $i
        for j in $i/*;do
            #echo "    $j"
            rm -f $j/*json $j/*gz $j/*gif
        done
    fi
done

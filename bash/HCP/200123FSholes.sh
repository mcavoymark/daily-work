#!/bin/bash

trim() {
    local var="$*"
    #remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    #remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
    }

if [ ${#@} != 2 ]; then
    echo "$0 <indir> <csv output file>"
    exit
fi
id=$1;of=$2

echo "MR ID,5.3 holes,6.0 holes" > $of
for i in $(ls -d $1/*/); do
    echo $i
    #echo "    ${i%%/}"
    superbird=${i%%/}
    #echo "    ${superbird##*/}"
    superbird=${superbird##*/}
    echo "    ${superbird}"
    line30=
    elephantpool=${i}vglab/T1w/vglab/stats
    if [ -d "$elephantpool" ];then
        echo "    $elephantpool exists"
        lovepirate="$elephantpool/aseg.stats"
        if [ -f "$lovepirate" ];then
            #g0=$(grep "Measure SurfaceHoles" $elephantpool/aseg.stats)
            #echo "    $g0"
            #IFS=$'\n,' read -d '' -ra line <<< $g0
            #echo "    ${line[3]}" 
            echo "        $lovepirate exists"
            IFS=$'\n,' read -d '' -ra line <<< $(grep "Measure SurfaceHoles" $lovepirate) 
            line30=$(trim ${line[3]})
            echo "        $line30"
        fi
    fi
    line31=
    elephantpool=${i}6.0vglab/stats
    if [ -d "$elephantpool" ];then
        echo "    $elephantpool exists"
        lovepirate="$elephantpool/aseg.stats"
        if [ -f "$lovepirate" ];then
            echo "        $lovepirate exists"
            IFS=$'\n,' read -d '' -ra line <<< $(grep "Measure SurfaceHoles" $lovepirate) 
            line31=$(trim ${line[3]})
            echo "        $line31"
        fi
    fi
    echo "$superbird,$line30,$line31" >> $of
done

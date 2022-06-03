#!/bin/bash

if [ ${#@} != 1 ]; then
    echo "$0 <input directory>"
    exit
fi
for i in $1/*;do
    echo "$i"
    str="${i// /_}"  
    echo "    $str"
    if [ "$i" != "$str" ];then
        mv "$i" $str
    fi
done


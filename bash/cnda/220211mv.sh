#!/bin/bash

if [ ${#@} != 2 ]; then
    echo "Usage: $0 <csv> <DIRNAME>"
    echo "    Ex. $0 220210missing_edit_cnda220211.csv /data/nil-bluearc/vlassenko/mcavoy/cnda/raw"
    echo ""
    echo "Example 220210missing_edit_cnda220211.csv"
    echo "    CCIR_00970,108185_B,108185_B,108185,190924RES"
    echo "    CCIR_00970,108205,108205_MR2_20211202,108205,211202RES"
    echo "    CCIR_00970,108181,108181_MR2_20211202,108181,211202RES"
    echo "    CCIR_00970,108194,108194_MR2_20211209,108194,211209RES"
    echo "    CCIR_00970,108187,108187_MR2_20211210,108187,211210RES"
    echo "    CCIR_00970,108297,108297,108297,210305RES"
    echo "    CCIR_00970,108300,108300,108300,210329RES"
    echo ""
    exit
fi
d0=$2; 
IFS=$'\n' read -d '' -ra csv < $1

for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    if [ "${line[2]}" = "${line[3]}" ];then
        mkdir -p ${d0}/${line[3]}/${line[4]}
        mv ${d0}/${line[3]}/* ${d0}/${line[3]}/${line[4]} 
        echo "Moved ${line[3]} to ${line[3]}/${line[4]}"
    fi
done

#!/bin/bash

trim() {
    local var="$*"
    #remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    #remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
    }

if [ ${#@} != 4 ];then
    echo "$0 <in csv - list of MR IDs> <in csv - flawless spreadsheet> <MAN dir> <out mv script>"
    echo ""
    exit
fi
md=$3;of=$4

IFS=$'\n' read -d '' -ra csv0 < $1
IFS=$'\n' csv1=($(awk -F'"' -v OFS='' '{ for (i=2; i<=NF; i+=2) gsub(",", "", $i) } 1' $2))
echo "nlines = ${#csv1[@]}"


#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

echo "#!/bin/bash" > ${of}
echo ""  >> ${of}

for((i=0;i<${#csv0[@]};++i));do
    IFS=$',\n ' read -ra l0 <<< ${csv0[i]} 
    #echo ${l0[0]}
    flag=0
    for((j=0;j<${#csv1[@]};++j));do
        IFS=$',\n' read -ra l1 <<< ${csv1[j]} 
        #IFS=$'\t\n' read -ra l1 <<< ${csv1[j]} 
        #echo "${l1[@]}"
        #echo "${#l1[@]} fields"

        superbird=$(trim "${l1[8]}")
        #echo "${l0[0]} $superbird"
        if [ "${l0[0]}" = "$superbird" ];then

            #echo "mkdir -p ${l1[4]}/${l1[5]}" >> ${of}
            #echo "mv ${l0[0]} ${l1[4]}/${l1[5]}" >> ${of} 
            #echo "mkdir -p ${l1[4]}/${l1[5]}" >> ${of}
            #echo "mv ${l0[0]} ${l1[4]}/${l1[5]}" >> ${of} 
            superbird="${l1[4]}"
            if [ -z "${l1[4]}" ];then
                superbird=${l1[3]}
            fi

            #echo "mkdir -p $md/${superbird}/${l1[5]}" >> ${of}

            if [ "${l0[0]}" = "$superbird" ];then 
                echo "mkdir -p $md/${superbird}/${l1[5]}" >> ${of}
                echo "mv $md/${l0[0]}/* $md/${superbird}/${l1[5]}" >> ${of} 
            else
                echo "mkdir -p $md/${superbird}" >> ${of}
                echo "mv $md/${l0[0]} $md/${superbird}/${l1[5]}" >> ${of} 
            fi

#mkdir -p /data/nil-bluearc/vlassenko/MAN/mcavoy/108166/170221PMR
#mv /data/nil-bluearc/vlassenko/MAN/mcavoy/20020262A_MR_v1 /data/nil-bluearc/vlassenko/MAN/mcavoy/108166/170221PMR


            echo "" >> ${of}
            flag=1
            continue
        fi 
    done
    if((flag==0));then
        echo "${l0[0]} not found"
    fi
    #echo ""
done
echo "Output written to ${of}"

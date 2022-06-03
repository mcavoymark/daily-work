#!/bin/bash

if [ ${#@} != 2 ];then
    echo ${#@}
    echo "$0 <pdf to excel.csv> <output.csv>" 
fi
IFS=$'\n' read -d '' -ra csv < $1
#printf '%s\n' "${csv[@]}"
of=$2

colS=-1;j=-1
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n' read -ra line <<< ${csv[i]}
    if((colS==-1));then
        for((j=0;j<${#line[@]};++j));do
            if [[ ${line[j]} = "Scan" ]];then
                colS=$j
            fi
            if [[ ${line[j]} = "Type" ]];then
                colT=$j
            fi
            if [[ ${line[j]} = "Usability" ]];then
                colU=$j
            fi
        done
    else 
        if [[ -n ${line[colS]} ]];then
            ((++j))
            if [[ ${line[colU]} = "useable" ]];then
                Scan[j]=${line[colS]}
                Type[j]=${line[colT]}
            fi
        else
            Type[j]=${Type[j]}${line[colT]}
        fi
    fi
done



#IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

#IFS=$'\n' read -d '' -ra csv2 < $2
#IFS=$'\n' read -d '' -ra csv3 < $3

if [[ "$1" != "NONE" ]];then
    IFS=$'\n' read -d '' -ra csv2 < $1
fi
IFS=$'\n' read -d '' -ra csv3 < $2
if [[ "$3" != "NONE" ]];then
    IFS=$'\n' read -d '' -ra csv4 < $3
fi

rm -f $of;touch $of;ofc=0
#echo "REDCAP,MRID,Group,$1,$3" > $of
#echo "MAP,REDCAP,MRID,Age" > $of

root=${of%%.*}
#echo "root=$root"
#exit

#g0=${root}0.csv;rm -f $g0;touch $g0;g0c=0
#g1=${root}1.csv;rm -f $g1;touch $g1;g1c=0
#g2=${root}2.csv;rm -f $g2;touch $g2;g2c=0
#g3=${root}3.csv;rm -f $g3;touch $g3;g3c=0
#g4=${root}3Non-AD.csv;rm -f $g3;touch $g4;g4c=0
#g5=${root}NotAssigned.csv;rm -f $gNA;touch $g5;g5c=0

#modality0=(fdg gi ho om);g0=;gc=
#for((m=0;m<${#modality0[@]};++m));do
#    g0[m]=${root}_${modality0[m]}.csv
#    rm -f ${g0[m]};touch ${g0[m]};gc[m]=0
#done

modality0=(fdg gi ho om);g0=;gc=;h0=;hc=
for((m=0;m<${#modality0[@]};++m));do
    g0[m]=${root}_${modality0[m]}.csv
    rm -f ${g0[m]};touch ${g0[m]};gc[m]=0
    h0[m]=${root}_${modality0[m]}_sort.csv
    rm -f ${h0[m]};touch ${h0[m]};hc[m]=0
done


for((l=1;l<=285;++l));do
    if((l<10));then
        s1=10800$l 
    elif((l<100));then
        s1=1080$l
    else
        s1=108$l
    fi
    #echo $s1

    #ASRC.csv
    #if [[ "$1" != "NONE" ]];then
    #    s2=;group=;petage=;mriage=;MAP=
    #    for((k=5;k<${#csv2[@]};++k));do
    #        superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[k]})
    #        IFS=$',\n' read -ra line2 <<< $superbird 
    #        if [[ "${line2[1]}" = "1" ]];then
    #            if [[ ${line2[10]} = "${s1}" ]];then
    #                #if [[ ${line2[11]:6:3} = "$three" ]];then
    #                if [[ ${line[11]:6:3} = "$three" || "$three" = "MORETHANONE" ]];then
    #                    s2=${line2[11]} 
    #                    group=${line2[2]}
    #                    petage=${line2[4]}
    #                    mriage=${line2[5]}
    #                    MAP=${line2[9]}
    #                    break
    #                fi
    #            fi
    #        fi
    #    done
    #    echo "MAP=$MAP"
    #fi

#    #MRI.dat
#    s3=
#    if [[ -n "${s2}" ]];then
#        superbird=${s1}/${s2}
#        for((i=2;i<${#csv[@]};++i));do
#            IFS=$',\n ' read -ra line <<< ${csv[i]}
#            if [[ "${line[0]}" = "${superbird}" ]];then
#                s3=${line[0]}
#                break
#            fi 
#        done
#    else 
#        for((i=2;i<${#csv[@]};++i));do
#            IFS=$',\n ' read -ra line <<< ${csv[i]}
#            IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
#            if [[ "${s0[0]}" = "${s1}" ]];then
#                if [[ ${s0[1]:6:3} = "RES" ]];then
#                    s3=${line[0]}
#                    break
#                fi
#            fi
#        done
#    fi

    #DF01.csv
    #declare -a s4;declare -a ADstatus;declare -a Modality;declare -a Age;declare -a FDGID;k=0
    #s4=;ADstatus=;Modality=;Age=;FDGDate=;FDGID=;k=0
    unset s4 ADstatus Modality Age FDGDate FDGID;k=0
    for((i=1;i<${#csv3[@]};++i));do
        IFS=$',\n' read -ra line <<< ${csv3[i]}
        if [[ "${line[0]}" = "${s1}" ]];then
            if [[ ${line[4]:6:3} = "$three" || "$three" = "MORETHANONE" ]];then
                s4[k]=${line[4]}
                ADstatus[k]=${line[15]}
                Modality[k]=${line[18]}
                Age[k]=${line[6]}
                FDGDate[k]=${line[1]}
                FDGID[k]=${line[2]}
                ((++k))
            fi
        fi
    done
    if((k>5));then
        ((morethanone++))
    fi
    echo "$s1 $((k/5))"
    p0=$((k/5))

    #ASRC.csv
    if [[ "$1" != "NONE" ]];then
        if [[ "$three" != "MORETHANONE" ]] || ((k>5));then
            #s2=;group=;petage=;mriage=;MAP=;n=0
            unset s2 group petage mriage MAP;n=0
            for((k=5;k<${#csv2[@]};++k));do
                superbird=$(awk -F'"' -v OFS='' '{ for (j=2; j<=NF; j+=2) gsub(",", "", $j) } 1' <<< ${csv2[k]})
                IFS=$',\n' read -ra line2 <<< $superbird
                if [[ "${line2[1]}" = "1" ]];then
                    #echo "here0 ${s1}"
                    if [[ ${line2[10]} = "${s1}" ]];then
                        #echo "here1"
                        #if [[ ${line2[11]:6:3} = "$three" ]];then
                        if [[ ${line[11]:6:3} = "$three" || "$three" = "MORETHANONE" ]];then
                            #echo "here2"
                            #s2=${line2[11]}
                            group=${line2[2]}
                            petage=${line2[4]}
                            #mriage=${line2[5]}
                            MAP=${line2[9]}
                            #break
                            s2[n]=${line2[11]}
                            mriage[n]=${line2[5]}
                            ((++n))
                        fi
                    fi
                fi
            done
            echo "MAP=${MAP}"
        fi
    fi


    #VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv
    if [[ "$3" != "NONE" ]];then
        age0=
        for((i=1;i<${#csv4[@]};++i));do
            IFS=$',\n^M' read -ra line <<< ${csv4[i]}
            if [[ "${line[0]}" = "${s1}" ]];then
                age0=${line[1]}
            fi
        done
    else
        age0=${mriage}
    fi

    #printf '%s' "${s1},${s2},${group},${s3}" >> ${of}
    #for((i=0;i<k;++i));do
    #    printf '%s' ",${s4[i]},${ADstatus[i]},${Modality[i]}" >> ${of}
    #done
    #printf '\n' >> ${of}

    printf '%s\n' "${s1},${s2},${group},MRage=${age0},PETage=${petage}" >> ${of}
    for((i=0;i<k;++i));do
        printf '    %s\n' "${s4[i]},${ADstatus[i]},${Modality[i]},${Age[i]}" >> ${of}
    done

    if [[ "$three" != "MORETHANONE" ]];then
        for((i=0;i<k;++i));do
            for((m=0;m<${#modality0[@]};++m));do
                if [[ "${Modality[i]}" = "${modality0[m]}" ]];then
                    printf '%s\n' ",${s1},${s4[i]},${Age[i]}" >> ${g0[m]}
                fi
            done
        done
    elif [[ "$three" = "MORETHANONE" ]] && ((k>5));then
        echo "here0 p0=${p0}"

        #for((m=0;m<${#modality0[@]};++m));do
        for((m=0;m<1;++m));do

            #printf '%s\n' "${s1},$MAP" >> ${g0[m]}
            printf '%s\n' "${s1},$MAP,${p0} PET" >> ${h0[m]}

            unset ribbit
            for((i=0;i<${p0};++i));do

                if [[ "${Modality[i]}" = "${modality0[m]}" ]];then
                    #printf '%s\n' "    ,PET,${FDGDate[i]},${FDGID[i]},${Age[i]},${ADstatus[i]}" >> ${g0[m]}
                    printf '%s\n' "${s1},$MAP,PET,${FDGDate[i]},${FDGID[i]},${Age[i]},${ADstatus[i]}" >> ${g0[m]}
                    ##printf '%s' "    ,${FDGDate[i]},${FDGID[i]},${Age[i]},${ADstatus[i]}" >> ${g0[m]}

                    ribbit[i]="    ,${FDGDate[i]},${FDGID[i]},${Age[i]},${ADstatus[i]}"
                    #echo "ribbit = ${ribbit[i]}" >> ${g0[m]}
                fi
            done
            for((j=0;j<n;++j,++i));do
                superbird=${s2[j]:2:2}
                if((${s2[j]:2:1}==0));then
                    superbird=${s2[j]:3:1}
                fi
                elephantpool=${s2[j]:4:2}
                if((${s2[j]:4:1}==0));then
                    elephantpool=${s2[j]:5:1}
                fi
                printf '%s\n' "${s1},$MAP,MRI,$superbird/$elephantpool/20${s2[j]:0:2},${s2[j]},${mriage[j]}" >> ${g0[m]}
                ribbit[i]="    ,$superbird/$elephantpool/20${s2[j]:0:2},${s2[j]},${mriage[j]}"
                #echo "ribbit = ${ribbit[i]}" >> ${g0[m]}
            done
            #echo "ribbit=${ribbit[@]}"

            #superbird=
            unset superbird
            for((i=0;i<${p0};++i));do
                IFS=$'/' read -ra line <<< ${FDGDate[i]}
                for((j=0;j<2;++j));do
                    if((${line[j]}<10));then
                        line[j]=0${line[j]}
                    fi
                done
                superbird[i]=${line[2]:2:2}${line[0]}${line[1]}
            done
            echo "here0 #superbird=${#superbird[@]}"
            superbird=(${superbird[@]} ${s2[@]})
            read line <<< ${superbird[@]}
            #read -d '' line <<< ${superbird[@]}
            echo "here1 #superbird=${#superbird[@]}"
            echo "line=${line}END"
            elephantpool=$(cat -n <(echo "$line" | sed 's/ /\n/g') | sort -k +2 | cut -f1 | tr '\n' ' ')
            read -ra line <<< ${elephantpool[@]}
            for((i=0;i<${#line[@]};++i));do
                echo "${ribbit[((${line[i]}-1))]}" >> ${h0[m]}
            done

        done

        #superbird=
        #for((i=0;i<${p0};++i));do
        #    IFS=$'/' read -ra line <<< ${FDGDate[i]}
        #    for((j=0;j<2;++j));do
        #        if((${line[j]}<10));then
        #            line[j]=0${line[j]}
        #        fi 
        #    done 
        #    superbird[i]=${line[2]:2:2}${line[0]}${line[1]}
        #done
        #superbird=(${superbird[@]} ${s2[@]}) 
        #read line <<< ${superbird[@]}
        #elephantpool=$(cat -n <(echo "$line" | sed 's/ /\n/g') | sort -k +2 | cut -f1 | tr '\n' ' ')
        #read -ra line <<< ${elephantpool[@]} 
        #echo '' >> ${g0[0]}
        #for((i=0;i<${#line[@]};++i));do
        #    echo "${ribbit[((${line[i]}-1))]}" >> ${g0[0]}
        #done


    fi

done
echo "Output written to $of"
#for((m=0;m<${#modality0[@]};++m));do
for((m=0;m<1;++m));do
    echo "Output written to ${g0[m]}"
done
#for((m=0;m<${#modality0[@]};++m));do
for((m=0;m<1;++m));do
    echo "Output written to ${h0[m]}"
done
echo "morethanone=$morethanone"

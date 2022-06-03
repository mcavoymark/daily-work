#!/bin/bash

if [ ${#@} != 3 ]; then
    echo "$0 <MRI.dat> <nii dir> <output file>"
    echo ""
    echo "    <MRI.dat>"

    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108130/150202TRI 4-t1_mpr_1mm_p2_pos50 5-t2_spc_1mm_p2 NOTUSEABLE 9-ep2d_bold_connect 19-ep2d_bold_connect NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE"
    echo ""
    echo "    <nii dir>"
    echo "        Ex. /data/nil-bluearc/vlassenko/mcavoy/HCP/bold"
    echo "            Json's are grabbed from /data/nil-bluearc/vlassenko/mcavoy/HCP/bold/108130/150202TRI"
    exit
fi
id=$2;of=$3

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

rm -f $of
echo -e "DON'T USE\tNOTES\tsubject\tFieldMap\tFieldMap\tERR\tSBRef\tREST\tERR\tSBRef\tREST\tERR\tSBRef\tREST\tERR\tSBRef\tREST\tERR\tFieldMap\tFieldMap\tERR" > $of

#for((i=2;i<${#csv[@]};++i));do
for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]} 

    if [ "${line[0]:0:1}" = "#" ];then
        echo "Skiping line $((i+1)): ${line[0]}"
        continue
    fi

    s0=${line[0]};T1=${line[1]};T2=${line[2]};FLAIR=${line[3]}

    #id1=${id}/${s0}/nii
    id1=${id}/${s0}

    echo "${s0}"

    declare -a PED
    declare -a n0 
    notes=;lcnotes=0
    errors=;lcerrors=0
    lcprint=0

    #echo "n0 = ${n0[@]}"

    for ((k=4;k<16;k++));do
        j=${line[k]}
        #echo "    ${j}"
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then

            json=${id1}/${j}.json

            #START200715
            if [ ! -f $json ];then
                json="${json/noT2/}"
                if [ ! -f $json ];then
                    echo "    $json not found"
                    exit
                fi
            fi


            mapfile -t PhaseEncodingDirection < <( grep PhaseEncodingDirection $json )
            IFS=$' ,' read -ra line0 <<< ${PhaseEncodingDirection}
            IFS=$'"' read -ra line1 <<< ${line0[1]}
            PED[k]=${line1[1]}
            #echo "        ${json} ${PED[k]}"
            echo "        ${j} ${PED[k]}"
        fi
    done
    for((k=4;k<8;k++));do
        j=${line[k]}
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then

            ((lcprint++))

            if [[ "${PED[k]}" != "${PED[k+4]}" ]];then
                json=${id1}/${s0}_${j}.json
                #echo "        ${json} ${PED[k]}" 
                json=${id1}/${s0}_${line[k+4]}.json
                #echo "        ${json} ${PED[k+4]}" 

                n0[k]="ERR"

                ((lcerrors > 0)) && errors="${errors},"
                errors="${errors} ${line[k+4]}"
                ((lcerrors++))
         
            fi
            #echo "    ${j}"
            if [[ "${j}" = *"AP"* ]];then
                #echo "here0 ${j} ${PED[k]}"
                if [[ "${PED[k]}" != "j-" ]];then
                    json=${id1}/${s0}_${j}.json
                    echo "        ${json} ${PED[k]} Should be j-" 

                    ((lcnotes > 0)) && notes="${notes},"
                    notes="${notes}${j} wrong orientation"
                    ((lcnotes++))

                fi 
            elif [[ "${j}" = *"PA"* ]];then
                #echo "here1 ${j} ${PED[k]}"
                if [ "${PED[k]}" != "j" ];then
                    json=${id1}/${s0}_${j}.json
                    echo "        ${json} ${PED[k]} Should be j" 

                    ((lcnotes > 0)) && notes="${notes},"
                    notes="${notes}${j} wrong orientation"
                    ((lcnotes++))

                fi
            fi
        fi
    done

    echo "PED = ${PED[@]}"

    for((k=12;k<16;k+=2));do
        j=${line[k]}
        if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then
            if [[ "${PED[k]}" = "${PED[k+1]}" ]];then
                json=${id1}/${s0}_${j}.json
                echo "        ${json} ${PED[k]}" 
                json=${id1}/${s0}_${line[k+1]}.json
                echo "        ${json} ${PED[k+1]}" 
                echo "        ERROR: Phases should be opposite!"

                n0[k]="ERR"
                ((lcerrors > 0)) && errors="${errors},"
                errors="${errors}${line[k]},${line[k+1]}"
                ((lcerrors++))
            fi
            #else
                for((l=k;l<k+2;l++));do


                    #if [[ "${line[l]}" = *"AP"* ]];then
                    #if [[ "${line[l]}" = *"AP"* ]] || [[ "${line[l]}" = *"ap"* ]];then
                    if [[ "${line[l]}" = *"SpinEchoFieldMap"*"AP" ]] || [[ "${line[l]}" = *"se-ap-FieldMAP" ]];then

                        #echo "here2 ${j} ${PED[l]}"
                        #echo "here2 ${line[l]} ${PED[l]}"

                        if [[ "${PED[l]}" != "j-" ]];then
                            json=${id1}/${s0}_${line[l]}.json
                            echo "        ${json} ${PED[l]} Should be j-" 

                            ((lcnotes > 0)) && notes="${notes},"
                            notes="${notes}${line[l]} wrong orientation"
                            ((lcnotes++))

                            if [[ "${n0[k]}" != "ERR" ]];then
                                n0[k]="ERR"
                                ((lcerrors > 0)) && errors="${errors},"
                                errors="${errors}${line[k]},${line[k+1]}"
                                ((lcerrors++))
                            fi

                        fi 

                    #elif [[ "${line[l]}" = *"PA"* ]];then
                    #elif [[ "${line[l]}" = *"PA"* ]] || [[ "${line[l]}" = *"pa"* ]];then
                    elif [[ "${line[l]}" = *"SpinEchoFieldMap"*"PA" ]] || [[ "${line[l]}" = *"se_pa_FieldMAP" ]];then

                        #echo "here3 ${line[l]} ${PED[l]}"
                        if [ "${PED[l]}" != "j" ];then
                            json=${id1}/${s0}_${line[l]}.json
                            echo "        ${json} ${PED[l]} Should be j" 

                            ((lcnotes > 0)) && notes="${notes},"
                            notes="${notes}${line[l]} wrong orientation"
                            ((lcnotes++))

                            if [[ "${n0[k]}" != "ERR" ]];then
                                n0[k]="ERR"
                                ((lcerrors > 0)) && errors="${errors},"
                                errors="${errors}${line[k]},${line[k+1]}"
                                ((lcerrors++))
                            fi

                        fi
                    fi
                done
            #fi 
        fi
    done
    echo ''
    if ((lcprint>0));then
        echo -e "${errors}\t${notes}\t${s0}\t${PED[12]}\t${PED[13]}\t${n0[12]}\t${PED[8]}\t${PED[4]}\t${n0[4]}\t${PED[9]}\t${PED[5]}\t${n0[5]}\t${PED[10]}\t${PED[6]}\t${n0[6]}\t${PED[11]}\t${PED[7]}\t${n0[7]}\t${PED[14]}\t${PED[15]}\t${n0[14]}" >> $of
    fi

    unset PED;unset n0

done
echo "Output written to $of"

#!/bin/bash

if [ ${#@} != 3 ];then
    echo "$0 <MRI.dat> <input directory> <output script>"
    echo ""
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4 T1set T2set"
    echo "        ---------------------------------------------------------------------------------------------------"
    echo "        108008/180328RES 13-T1w_MPR_vNav_4e_RMS 29-T2w_SPC_vNav 30-3D_FLAIR_Ax 17-rfMRI_REST1_AP 19-rfMRI_REST1_PA 21-rfMRI_REST2_AP 23-rfMRI_REST2_PA 16-rfMRI_REST1_AP_SBRef 18-rfMRI_REST1_PA_SBRef 20-rfMRI_REST2_AP_SBRef 22-rfMRI_REST2_PA_SBRef 14-SpinEchoFieldMap1_AP 15-SpinEchoFieldMap1_PA 24-SpinEchoFieldMap2_AP 25-SpinEchoFieldMap2_PA 8-T1w_setter 27-T2w_setter"
    echo ""
    echo "    <input directory>"
    echo "        Ex. For the first line of MRI.dat, the niftis are fetched from"
    echo "            <input directory>108008/180328RES"
    echo ""
    exit
fi
id=$2;bs=$3

echo "#!/bin/bash" > $bs
echo "" >> $bs

IFS=$'\n' read -d '' -ra csv < $1
#printf "line 1: %s\n" "${csv[0]}"
#printf "line 2: %s\n" "${csv[1]}"
#printf "line 3: %s\n" "${csv[2]}"
#printf '%s\n' "${csv[@]}"

for((i=2;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    echo ${line[0]}

    IFS=$',\n/ ' read -ra s0 <<< ${line[0]}
    if((${#s0[1]}==9));then

        f0= 
        for j in ${line[@]:16};do
            echo "    ${j}"
            if [ "${j}" != "NONE" ] && [ "${j}" != "NOTUSEABLE" ];then

                od1=${id}/${line[0]}
                echo "rm ${od1}/${j}_*" >> $bs


            fi
        done
    fi
done
echo "Output written to $bs"

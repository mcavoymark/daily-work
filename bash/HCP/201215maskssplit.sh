#!/bin/bash
FSL=/usr/local/pkg/fsl5.0.11/bin

#J0=aparc+aseg
J0=wmparc

P0=/home/usr/mcavoy/FIDL/build/fidl_split2

if [ ${#@} != 3 ];then
    echo "$0 <MRI.dat or csv> <input directory> <output directory>"
    echo "" 
    echo "    <MRI.dat>"
    echo "        subject T1 T2 FLAIR REST1 REST2 REST3 REST4 SBRef1 SBRef2 SBRef3 SBRef4 FM1 FM2 FM3 FM4"
    echo "        ---------------------------------------------------------------------------------------"
    echo "        108001 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA"
    echo "        108002 12-T1w_MPR_vNav_4e_RMS 28-T2w_SPC_vNav 29-3D_FLAIR_Ax 16-rfMRI_REST1_AP 18-rfMRI_REST1_PA 20-rfMRI_REST2_AP 22-rfMRI_REST2_PA 15-rfMRI_REST1_AP_SBRef 17-rfMRI_REST1_PA_SBRef 19-rfMRI_REST2_AP_SBRef 21-rfMRI_REST2_PA_SBRef 13-SpinEchoFieldMap1_AP 14-SpinEchoFieldMap1_PA 23-SpinEchoFieldMap2_AP 24-SpinEchoFieldMap2_PA" 
    echo "" 
    echo "        NOTE: <csv> is just a single column of subject identifiers" 
    echo "              108001" 
    echo "              108002" 
    echo "" 
    echo "    <input directory>"
    echo "        Currently /data/nil-bluearc/vlassenko/HCP/sub" 
    echo "" 
    echo "    <output directory>"
    echo "        Masks are written to <output directory>"
    echo ""
    exit
fi

id=$2;od=$3
IFS=$'\n' read -d '' -ra csv < $1

mkdir -p $od

for((i=0;i<${#csv[@]};++i));do
    IFS=$',\n ' read -ra line <<< ${csv[i]}
    if [[ "${line[0]}" = "subject" || "${line[0]:0:1}" = "-" ]];then
        continue
    fi

    str="${line[0]////_}" 
    echo "str = $str"

    #s0=${line[0]};
    #echo "${s0}"

    D0=$id/${line[0]}/vglab/T1w

    n0=brainmask_fs
    n1=brainmask_fs
    c0="${P0} -files ${D0}/${n0}.nii.gz -roots ${od}/${str}_${n1}";#echo $c0
    $c0

    F0=${D0}/${J0}.nii.gz
    #echo "F0 = $F0"

    n0=whitematter
    n1=wm
    l0=(2 41 3000 4000 5001 251)
    u0=(2 41 3035 4035 5002 255)
    for k in ${!l0[@]};do
        c0="${FSL}/fslmaths ${F0} -thr ${l0[k]} -uthr ${u0[k]} ${od}/${str}_${n0}${l0[k]}-${u0[k]}.nii.gz";#echo $c0
        $c0   
    done
    c0="cp ${od}/${str}_${n0}${l0[0]}-${u0[0]}.nii.gz ${od}/${str}_${n0}.nii.gz";#echo $c0
    $c0
    for((k=1;k<${#l0[@]};k++));do
        c0="${FSL}/fslmaths ${od}/${str}_${n0}.nii.gz -add ${od}/${str}_${n0}${l0[k]}-${u0[k]}.nii.gz ${od}/${str}_${n0}.nii.gz";#echo $c0
        $c0
    done
    c0="${FSL}/fslmaths ${od}/${str}_${n0}.nii.gz -bin ${od}/${str}_${n0}.nii.gz";echo $c0
    $c0

#    for k in 1 2 3; do
    for k in 1 ; do
        c0="${FSL}/fslmaths ${od}/${str}_${n0}.nii.gz -kernel 3D -ero ${od}/${str}_${n1}${k}.nii.gz";#echo $c0
        $c0
        c0="${P0} -files ${od}/${str}_${n1}${k}.nii.gz -roots ${od}/${str}_${n1}${k}";#echo $c0
        $c0
        c0="rm ${od}/${str}_${n1}${k}.nii.gz";#echo $c0
        $c0
    done
    c0="rm ${od}/${str}_${n0}*";#echo $c0
    $c0

    echo ''

    n0=cerebrospinalfluid
    n1=csf
    l0=(4 14 24 43)
    u0=(5 15 24 44)
    for k in ${!l0[@]};do
        c0="${FSL}/fslmaths ${F0} -thr ${l0[k]} -uthr ${u0[k]} ${od}/${str}_${n0}${l0[k]}-${u0[k]}.nii.gz";#echo $c0
        $c0
    done
    c0="cp ${od}/${str}_${n0}${l0[0]}-${u0[0]}.nii.gz ${od}/${str}_${n0}.nii.gz";#echo $c0
    $c0
    for((k=1;k<${#l0[@]};k++));do
        c0="${FSL}/fslmaths ${od}/${str}_${n0}.nii.gz -add ${od}/${str}_${n0}${l0[k]}-${u0[k]}.nii.gz ${od}/${str}_${n0}.nii.gz";#echo $c0
        $c0
    done
    c0="${FSL}/fslmaths ${od}/${str}_${n0}.nii.gz -bin ${od}/${str}_${n1}0.nii.gz";#echo $c0
    $c0

    c0="${P0} -files ${od}/${str}_${n1}0.nii.gz -roots ${od}/${str}_${n1}0";#echo $c0
    $c0
    c0="rm ${od}/${str}_${n1}0.nii.gz";#echo $c0
    $c0

#    for k in 1 2 3; do
#        ${FSL}/fslmaths ${od}/${n0}.nii.gz -kernel 3D -ero ${od}/${n0}.nii.gz
#        cp -p ${od}/${n0}.nii.gz ${od}/${s0}_${n1}${k}.nii.gz
#    done

    c0="rm ${od}/${str}_${n0}*";#echo $c0
    $c0

done

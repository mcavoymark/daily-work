#!/bin/bash

if((${#@}<1));then
    echo "$0 directory_name input_file.zip"
    echo "    unzips and does everything else"
    echo "$0 directory_name"
    echo "    does everything else"
    exit
fi
DIRNAME=$1

if((${#@}==2));then
    INFILE=$2
    if zip -Tq "$INFILE" > /dev/null;then
        mkdir -p $DIRNAME
        unzip -oqq "${INFILE}" -d $DIRNAME
    else
        echo "Problem with $INFILE"
        exit
    fi
fi

# sends files to ${DIRNAME}/scans/2-Axial_FLAIR/resources/DICOM/files/*
# Move them up to ${DIRNAME}/scans/2-Axial_FLAIR/resources/DICOM
flag=0
for resource_foldername in ${DIRNAME}/scans/*/resources/*; do
    if [ -d "$resource_foldername/files" ];then
        mv $resource_foldername/files/* $resource_foldername/.
        rm -r $resource_foldername/files
        flag=1
    fi
done
if((flag==0));then
    for resource_foldername in ${DIRNAME}/*/resources/*; do
        if [ -d "$resource_foldername/files" ];then
            mv $resource_foldername/files/* $resource_foldername/.
            rm -r $resource_foldername/files
            flag=1
        fi
    done
fi
if((flag==0));then
    for resource_foldername in ${DIRNAME}/scans/*/*; do
        #echo "here0 $resource_foldername"
        if [ -d "$resource_foldername/files" ];then
            mv $resource_foldername/files/* $resource_foldername/.
            rm -r $resource_foldername/files
            flag=1
        fi
    done
fi

echo "here1 flag = $flag"

if((flag==0));then
    for resource_foldername in ${DIRNAME}/*/*; do
        #echo "here1 $resource_foldername"
        if [ -d "$resource_foldername/files" ];then
            mv $resource_foldername/files/* $resource_foldername/.
            rm -r $resource_foldername/files
            flag=1
        elif [ -d "$resource_foldername/RAW" ];then
            mv $resource_foldername/RAW/* $resource_foldername/.
            rm -r $resource_foldername/RAW
            flag=1
        fi
    done
fi

echo "here2 flag = $flag"

# Now they are in ${DIRNAME}/scans/2-Axial_FLAIR/resources/DICOM
# Move them up to ${DIRNAME}/scans/2-Axial_FLAIR/DICOM

flag=0
for scan_foldername in ${DIRNAME}/scans/*; do
    if [ -d "$scan_foldername/resources" ];then
        mv $scan_foldername/resources/* $scan_foldername/.
        rm -r $scan_foldername/resources
        flag=1
    fi
done

echo "here3 flag = $flag"

if((flag==0));then
    for scan_foldername in ${DIRNAME}/*; do
        if [ -d "$scan_foldername/resources" ];then
            mv $scan_foldername/resources/* $scan_foldername/.
            rm -r $scan_foldername/resources
            flag=1
        fi
    done
fi

echo "here4 flag = $flag"


# Now they are in ${DIRNAME}/scans/2-Axial_FLAIR/DICOM
# Move them up to ${DIRNAME}/2-Axial_FLAIR/DICOM
if [ -d "${DIRNAME}/scans" ];then
    mv ${DIRNAME}/scans/* ${DIRNAME}/.
    rm -r ${DIRNAME}/scans                 
    flag=1
fi

echo "here5 flag = $flag"



for i in ${DIRNAME}/*;do
    str="${i// /_}"
    str="${str//(}"
    str="${str//)}"
    if [ "$i" != "$str" ];then
        mv "$i" $str
    fi
done

#rm -rf ${DIRNAME}/*/BIDS
#rm -rf ${DIRNAME}/*/NIFTI
#START200726
if [ -d "${DIRNAME}/*/DICOM" ];then
    rm -rf ${DIRNAME}/*/NIFTI
else
    echo "No DICOM folders"
    for scan_foldername in ${DIRNAME}/*; do
        echo $scan_foldername
        if [ -d "$scan_foldername/BIDS" ];then
            #superbird=$(ls $scan_foldername/BIDS)
            #echo "    $superbird"
            mv $scan_foldername/BIDS/* $scan_foldername/NIFTI
        fi
    done
fi

rm -rf ${DIRNAME}/*/BIDS
rm -rf ${DIRNAME}/*/SNAPSHOTS
rm -rf ${DIRNAME}/*/REGISTERED_711-2B
rm -rf ${DIRNAME}/*/ROI_711-2B
rm -rf ${DIRNAME}/assessors

chmod -R 775 $DIRNAME

echo "Done with ${DIRNAME}"

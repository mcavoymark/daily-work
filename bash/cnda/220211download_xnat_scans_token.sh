#!/bin/bash
#
#================================================================
# download_xnat_scans_token.sh
#================================================================
#
# Usage: ./download_xnat_scans.sh <input_file.csv> <directory_name> <xnat_username_token> <xnat_password_token> <site> <scan_type>
# 
# Download scans of a specified type from an XNAT site and organize the files - uses "tar" instead of "zip"
#
# Required inputs:
# <input_file.csv> - A Unix formatted, comma-separated file containing the following columns:
#       Project ID
#       Subject ID
#       Experiment Label (e.g. OAS30001_MR_d0129)
# <directory_name> - A directory path (relative or absolute) to save the scan files to
# <xnat_username_token> - An XNAT "alias" token from https://xnat.site/data/services/tokens/issue
# <xnat_password_token> - An XNAT "secret" token from https://xnat.site/data/services/tokens/issue
# <site> - the full path to the xnat site you are using, ie. https://cnda.wustl.edu
# <scan_type> - (Optional) The scan type of the scan you want to download. (e.g. T1w, angio, bold, fieldmap, FLAIR)
#       You can also enter multiple scan types separated by a comma with no whitespace (e.g. T2w,swi,bold)
#       Without this argument, all scans for the given experiment_id will be downloaded.
#
# This script organizes the files into folders like this:
#
# directory_name/MR_Label/scan_description/BIDS/file.json
# directory_name/MR_Label/scan_description/NIFTI/file.nii.gz
# directory_name/MR_Label/scan_description/DICOM/file.dcm
#
#
# Last Updated: 1/17/2020
# Author: Sarah Keefe
#


# Downloads a resource from a URL and stores the results to the specified path. The first parameter
# should be the destination path and the second parameter should be the URL.
# Authenticates using a username and password token that are sent to the script.
# USERNAME and PASSWORD variables must be set before calling this function.
download() {
    local OUTPUT=${1}
    local URL=${2}
    curl -H 'Expect:' --keepalive-time 2 -k -u ${USERNAME}:${PASSWORD} -o ${OUTPUT} ${URL}
}

# usage instructions
if [ ${#@} == 0 ]; then
    echo ""
    echo "XNAT scan download script"
    echo ""
    echo "This script downloads scans of the specified scan type from a specified XNAT site, "
    echo "based on a list of project ids, subject labels, and session labels in a csv file. "
    echo ""   
    echo "Usage: $0 input_file.csv directory_name xnat_username https://xnat.site scan_type"
    echo "<input_file>: A Unix formatted, comma separated file containing the following columns:"
    echo "    project_id (e.g. OASIS3)"
    echo "    subject_label (e.g. OAS30001)"
    echo "    experiment_label (e.g. OAS30001_MR_d0129)"
    echo "<directory_name>: Directory path to save scan files to"  
    echo "<xnat_username_token>: alias token from the requested XNAT site - copy and paste from https://[site]/data/services/tokens/issue"   
    echo "<xnat_password_token>: secret token from the requested XNAT site - copy and paste from https://[site]/data/services/tokens/issue"    
    echo "<site>: The url of the site you want to download from (e.g. https://cnda.wustl.edu)"   
    echo "<scan_type>: (Optional) scan type you would like to download (e.g. T1w). You can also enter multiple comma-separated scan types (e.g. swi,T2w). Without this argument, all scans for the given experiment_id will be downloaded. "   
else 

    # Get the input arguments
    INFILE=$1
    DIRNAME=$2
    USERNAME=$3
    PASSWORD=$4
    SITE=$5

    echo "DIRNAME = $DIRNAME"
    echo "USERNAME = $USERNAME"
    echo "PASSWORD = $PASSWORD"
    echo "SITE = $SITE"

    if [ $# -ge 6 ]
    then
        SCANTYPE=$6
    else
        SCANTYPE=ALL
    fi
    echo $SCANTYPE

    # Create the directory if it doesn't exist yet
    if [ ! -d $DIRNAME ]
    then
        mkdir $DIRNAME
    fi

    #cat $INFILE | while IFS="," read -r PROJECT_ID SUBJECT_LABEL EXPERIMENT_LABEL; do
    #START201029
    cat $INFILE | while IFS="," read -r PROJECT_ID SUBJECT_LABEL EXPERIMENT_LABEL superbird elephantpool; do

        echo ""
        if ! [ $SCANTYPE = "ALL" ];then
            echo "Checking for a ${SCANTYPE} scan for ${EXPERIMENT_LABEL}."
        else
            echo "Downloading all scans for ${EXPERIMENT_LABEL}."
        fi

        # Set up the download URL and make a cURL call to download the requested scans in tar.gz format
        download_url=${SITE}/data/archive/projects/${PROJECT_ID}/subjects/${SUBJECT_LABEL}/experiments/${EXPERIMENT_LABEL}/scans/${SCANTYPE}/files?format=zip

        echo $download_url
        download $DIRNAME/$EXPERIMENT_LABEL.zip $download_url
        echo "Using download URL: ${download_url}"

        # Check the zip file to make sure we downloaded something
        # If the zip file is invalid, we didn't download a scan so there is probably no scan of that type
        # If the zip file is valid, unzip and rearrange the files
        if zip -Tq $DIRNAME/${EXPERIMENT_LABEL}.zip > /dev/null; then
            unzip -oqq $DIRNAME/${EXPERIMENT_LABEL}.zip -d $DIRNAME
        else
            if ! [ $SCANTYPE = "ALL" ];then
                echo "There was a problem downloading the scan type ${SCANTYPE} for ${EXPERIMENT_LABEL}."
            else
                echo "There was a problem downloading all scans for ${EXPERIMENT_LABEL}."
            fi
            download_url=${SITE}/data/archive/projects/${PROJECT_ID}/subjects/${SUBJECT_LABEL}/experiments/${EXPERIMENT_LABEL}/scans/${SCANTYPE}/files?format=tar.gz

            echo $download_url
            download $DIRNAME/$EXPERIMENT_LABEL.tar.gz $download_url
            echo "Using download URL: ${download_url}"

            #if tar tf ${DIRNAME}/${EXPERIMENT_LABEL}.tar.gz > /dev/null;then
            if tar tf ${DIRNAME}/${EXPERIMENT_LABEL}.tar.gz &> /dev/null;then
                tar -xpzC $DIRNAME -f $DIRNAME/${EXPERIMENT_LABEL}.tar.gz
            else
                if ! [ $SCANTYPE = "ALL" ];then
                    echo "There was a problem downloading the scan type ${SCANTYPE} for ${EXPERIMENT_LABEL}."
                else
                    echo "There was a problem downloading all scans for ${EXPERIMENT_LABEL}."
                fi
                continue
            fi
        fi 

        # sends files to ${DIRNAME}/${EXPERIMENT_LABEL}/scans/2-Axial_FLAIR/resources/DICOM/files/*
        # Move them up to ${DIRNAME}/${EXPERIMENT_LABEL}/scans/2-Axial_FLAIR/resources/DICOM
        for resource_foldername in ${DIRNAME}/${EXPERIMENT_LABEL}/scans/*/resources/*; do
            if [ -d "$resource_foldername/files" ];then
                mv $resource_foldername/files/* $resource_foldername/.
                rm -r $resource_foldername/files
            fi
        done

        # Now they are in ${DIRNAME}/${EXPERIMENT_LABEL}/scans/2-Axial_FLAIR/resources/DICOM
        # Move them up to ${DIRNAME}/${EXPERIMENT_LABEL}/scans/2-Axial_FLAIR/DICOM
        for scan_foldername in ${DIRNAME}/${EXPERIMENT_LABEL}/scans/*; do
            if [ -d "$scan_foldername/resources" ];then
                mv $scan_foldername/resources/* $scan_foldername/.
                rm -r $scan_foldername/resources
            fi
        done                        

        # Now they are in ${DIRNAME}/${EXPERIMENT_LABEL}/scans/2-Axial_FLAIR/DICOM
        # Move them up to ${DIRNAME}/${EXPERIMENT_LABEL}/2-Axial_FLAIR/DICOM
        #START200205
        if [ -d "${DIRNAME}/${EXPERIMENT_LABEL}/scans" ];then
            mv ${DIRNAME}/${EXPERIMENT_LABEL}/scans/* ${DIRNAME}/${EXPERIMENT_LABEL}/.
            rm -r ${DIRNAME}/${EXPERIMENT_LABEL}/scans                 
        fi


        #for i in ${DIRNAME}/${EXPERIMENT_LABEL}/*;do
        #    str="${i// /_}"
        #    str="${str//(}"
        #    str="${str//)}"
        #    if [ "$i" != "$str" ];then
        #        mv "$i" $str
        #    fi
        #done
        #START210105
        #for i in ${DIRNAME}/${EXPERIMENT_LABEL}/*;do
        #    str="${i//(/ }"
        #    str="${str//)/ }"
        #    shopt -s extglob
        #    str="${str//+( )/ }" str="${str# }" str="${str% }"
        #    str="${str// /_}"
        #    if [ "$i" != "$str" ];then
        #        mv "$i" $str
        #    fi
        #done
        #START210108
        #for i in ${DIRNAME}/${EXPERIMENT_LABEL}/*;do
        #    str="${i%% }"          #remove trailing space 
        #    str="${str//(}"
        #    str="${str//)}"
        #    str="${str// /_}"
        #    str=$(echo ${str} | tr -s "_")
        #    str="${str%%_}"
        #    if [ "$i" != "$str" ];then
        #        mv "$i" $str
        #    fi
        #done
        #START210110
        for i in ${DIRNAME}/${EXPERIMENT_LABEL}/*;do
            str="${i// /_}"
            str="${str//(}"
            str="${str//)}"
            str=$(echo ${str} | tr -s "_")
            str="${str%%_}"
            if [ "$i" != "$str" ];then
                mv "$i" $str
            fi
        done



        rm -rf ${DIRNAME}/${EXPERIMENT_LABEL}/*/BIDS
        rm -rf ${DIRNAME}/${EXPERIMENT_LABEL}/*/NIFTI
        rm -rf ${DIRNAME}/${EXPERIMENT_LABEL}/*/SNAPSHOTS
        rm -rf ${DIRNAME}/${EXPERIMENT_LABEL}/assessors
        rm -rf ${DIRNAME}/${EXPERIMENT_LABEL}/REGISTERED_711-2B

        # Change permissions on the output files
        #chmod -R u=rwX,g=rwX $DIRNAME/$EXPERIMENT_LABEL/*
        chmod -R 775 ${DIRNAME}/${EXPERIMENT_LABEL}
        #START200205
        #chmod -R u=rwX,g=rwX $DIRNAME/$EXPERIMENT_LABEL/scans/*

        # Remove the scan zip file
        rm -r ${DIRNAME}/${EXPERIMENT_LABEL}.zip                      

        #mkdir -p ${DIRNAME}/${superbird}
        #mv ${DIRNAME}/${EXPERIMENT_LABEL} ${DIRNAME}/${superbird}/${elephantpool}
        #START220211
        if [ "${EXPERIMENT_LABEL}" != "${superbird}" ];then
            mkdir -p ${DIRNAME}/${superbird}
            mv ${DIRNAME}/${EXPERIMENT_LABEL} ${DIRNAME}/${superbird}/${elephantpool}
        else
            #This generates an error but still does the move 
            mkdir -p ${DIRNAME}/${superbird}/${elephantpool}
            mv ${DIRNAME}/${EXPERIMENT_LABEL}/* ${DIRNAME}/${superbird}/${elephantpool}
        fi

        echo "Done with ${EXPERIMENT_LABEL}."
        #echo ""

    done < $INFILE

fi

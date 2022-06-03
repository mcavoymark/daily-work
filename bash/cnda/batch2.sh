#!/bin/bash

C0=/data/nil-bluearc/vlassenko/mcavoy/cnda/raw
aliastoken="dba824bb-7b5b-46f0-aed2-881d39223e64";secrettoken="yWvvMbujUsk3WMMaf5X036U6zgzdn2IopVN6JS276dQ2jG5yXOhRac3WNSBzMCDD"
210105download_xnat_scans_token.sh 210106.csv $C0 $aliastoken $secrettoken https://cnda.wustl.edu 

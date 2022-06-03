#!/bin/bash

#190604dcm2niix.sh 190604MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub

D0=/data/nil-bluearc/vlassenko/mcavoy/HCP

#190604HCPstructpipeSETUP.sh 190604.csv $D0/sub $D0/scripts190604 $D0/scripts190604/batch.sh 

#190619dcm2niix.sh 190619MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190619.csv
#190619HCPstructpipeSETUP.sh 190619.csv $D0/sub $D0/scripts190619 $D0/scripts190619/batch.sh 

D5=/data/nil-bluearc/vlassenko/mcavoy/project5

#190627dcm2niixProject5.sh 190627.csv $D5/raw /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190627hcp.csv
#190619HCPstructpipeSETUP.sh 190627hcp.csv $D0/sub $D0/scripts190627 $D0/scripts190627/batch.sh #accidentally launched twice
#190627dcm2niixProject5.sh 190627b.csv $D5/raw /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190627bhcp.csv
#190619HCPstructpipeSETUP.sh 190627bhcp.csv $D0/sub $D0/scripts190627 $D0/scripts190627/batchb.sh 
#190627dcm2niix.sh 190627MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190627chcp.csv
#190619HCPstructpipeSETUP.sh 190627chcp.csv $D0/sub $D0/scripts190627 $D0/scripts190627/batchc.sh 

#190627dcm2niix.sh 190708MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190708HCP.csv
#190619HCPstructpipeSETUP.sh 190708HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190708.sh 

#190627dcm2niixProject5.sh 190711.csv $D5/raw $D0/sub 190711HCP.csv
#190711dcm2niixProject5.sh 190711.csv $D5/raw $D0/sub 190711HCP.csv
#190619HCPstructpipeSETUP.sh 190711HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190711.sh 

#190718dcm2niix.sh 190718MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190718HCP.csv
#190722dcm2niix.sh 190722MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190722HCP.csv

#190722dcm2niix.sh 190723MRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/sub 190723HCP.csv
#190619HCPstructpipeSETUP.sh 190723HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190723.sh 

#190809motion.sh AGBR-048_MRI.dat ${D0}/motion

#190814wm_csf_masks.sh 190814wm_csf_masks.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/masks

#190906dcm2niixProject5.sh 190906.dat $D5/raw $D0/sub 190906HCP.csv
#190619HCPstructpipeSETUP.sh 190906HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190906.sh 
#190906dcm2niixProject5.sh 190906b.dat $D5/raw $D0/sub 190906bHCP.csv
#190722dcm2niix.sh 190906MRI.dat $D0/sub 190906cHCP.csv
#190619HCPstructpipeSETUP.sh 190906bcHCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190906b.sh 

D0=/data/nil-bluearc/vlassenko/mcavoy/HCP
D5=/data/nil-bluearc/vlassenko/mcavoy/project5
DM=/data/nil-bluearc/vlassenko/MAN

#190906dcm2niixProject5.sh 190912.dat $D5/raw $D0/sub 190912HCP.csv
#190619HCPstructpipeSETUP.sh 190912HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190912.sh 

#190722dcm2niix.sh 190916MRI.dat $D0/sub 190916HCP.csv
#For the future, the MRI.dat file should just be a single subject. Just a run a bunch in parallel so you don't have to wait.
#190619HCPstructpipeSETUP.sh 190916HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP190916.sh 

#190917cpMAN.sh 190917.dat $D0/sub $DM/Chang
#190917cpMAN.sh 190919.dat $D0/sub $DM/mcavoy

#191003dcm2niixProject5.sh 191004.dat $D5/raw $D0/sub 191004HCP.csv
#190619HCPstructpipeSETUP.sh 191004HCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/191004HCP.sh 

#190917cpMAN.sh 191014.dat $D0/sub $DM/Chang
#190917cpMAN.sh 191014b.dat $D0/sub $DM/mcavoy

#191003dcm2niixProject5.sh 191015.dat $D5/raw $D0/sub 191015HCP.csv
#190722dcm2niix.sh 191015MRI.dat $D0/sub 191015bHCP.csv
#190619HCPstructpipeSETUP.sh 191015cHCP.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP191015.sh 

#191016dcm2niix.sh 191016MRI.dat $D0/sub junk.csv
#191016HCPfMRIpipeSETUP.sh 191016bMRI.dat $D0/sub $D0/scriptsHCPbold $D0/scriptsHCPbold/HCPbold191016.sh 

#191021motion.sh 191016bMRI.dat ${D0}/motion
#191022maskssplit.sh 191016cMRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/masks

#191022HCPstructpipeSETUP.sh 191022.csv $D0/sub $D0/scriptsHCP $D0/scriptsHCP/HCP191022.sh 
#191021glmSETUP.sh 191016cMRI.dat 191016chippo.dat $D0/conc $D0/conc/191022.list

#191016HCPfMRIpipeSETUP.sh 191016cMRI.dat $D0/sub $D0/scriptsHCPbold $D0/scriptsHCPbold/HCPbold191023.sh 

C0=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm/residGSR
#191024conc.sh 191024MRI.dat $C0 $C0 $C0/191024.list
#191024list.sh 191024MRI.dat $C0 $C0 $C0/191024.list
#191021motion.sh 191016cMRI.dat ${D0}/motion
#191022maskssplit.sh 191016cMRI.dat /data/nil-bluearc/vlassenko/mcavoy/HCP/masks
#191025glmSETUP.sh 191016cMRI.dat $D0/conc $D0/conc/191025glm.list

D0=/data/nil-bluearc/vlassenko/mcavoy/HCP
#190917cpMAN.sh 191029.dat $D0/sub $DM/mcavoy
#191003dcm2niixProject5.sh 191029.dat $D5/raw $D0/sub 191029.csv
#191024conc.sh 191016cMRI.dat $C0 $C0

#191024list.sh 191016cMRI.dat $C0 $C0 $C0/191024.list
#191030slicetimer.sh 191029MRI.dat $D0/sub
#191030checkphase.sh 191029MRI.dat $D0/sub

DV=/data/nil-bluearc/vlassenko/RAW_IMAGES/MRI
#191023dcm2niix.sh 191031MRI.dat $DV $D0/sub 191031.csv
#191030checkphase.sh 191031MRI.dat $D0/sub

#191101dcm2niix.sh 191101MRI.dat $DV $D0/sub 191101.csv
#191101dcm2niix.sh junk.dat $DV $D0/sub 191101.csv
#191030checkphase.sh 191101MRI.dat $D0/sub
#191101checkphase.sh 191101MRI.dat $D0/sub

#191101dcm2niix.sh junk.dat $DV $D0/sub 191101.csv

#190917cpMAN.sh 191105MAN.dat $D0/sub $DM/mcavoy
#190917cpMAN.sh 191105MAN.dat $D0/sub $DM/Chang

#191105checkphase.sh 191105MRI.dat $D0/sub 191106phase.txt

#190917cpMAN.sh 191125.dat $D0/sub $DM/Chang
#190917cpMAN.sh 191125.dat $D0/sub $DM/mcavoy

#190917cpMAN.sh 191126.dat $D0/sub $DM/Chang
#190917cpMAN.sh 191126.dat $D0/sub $DM/mcavoy

D0=/data/nil-bluearc/vlassenko/mcavoy/HCP
D1=/data/nil-bluearc/vlassenko/mcavoy/segment
D2=/data/nil-bluearc/vlassenko/mcavoy/project5/raw
#191127HCPfMRIpipeSETUPproject5.sh $D1/191127MRI.dat $D0/sub $D0/scriptsHCPbold $D0/scriptsHCPbold/HCPbold191127.sh 
#191105dcm2niix.sh $D1/191127bMRI.dat $D2 $D0/sub 191127.csv
#191030slicetimer.sh $D1/191127bMRI.dat $D0/sub
C0=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/resid
#191024conc.sh $C0/junk.dat $C0 $C0
#191024list.sh $C0/junk.dat $C0 $C0 $C0/191127.list

C1=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/residGSR
#191024conc.sh $C0/junk.dat $C1 $C1
#191024list.sh $C0/junk.dat $C1 $C1 $C1/191202.list
#191202freesurfer6.0SETUP.sh 191202.csv $D0/sub $D0/scripts6.0 $D0/scripts6.0/FS191202.sh

#191022maskssplit.sh $D1/191127MRI.dat $D0/masks
#191203motion.sh $D1/191127MRI.dat $D0/motion
#191203glmSETUP.sh $D1/191127MRI.dat $D0/conc $D0/conc/191203glm.list

#191204freesurfer6.0label2vol.sh 191202.csv $D0/sub
#191024conc.sh $C0/junk.dat $C0 $C0

#191205list.sh $C0/junk.dat $C0 $C0 $C0/191205.list
#191024conc.sh $C0/junk.dat $C1 $C1

D0=/data/nil-bluearc/vlassenko
#191212maskssplit.sh 191212.dat $D0/HCP/sub $D0/mcavoy/HCP/masks
#191212motion.sh 191212.dat $D0/HCP/sub $D0/mcavoy/HCP/motion
#191212glmSETUP.sh 191212.dat $D0/HCP/sub $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/191212.list
C0=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/resid
#191205list.sh $C0/191212.dat $C0 $C0 $C0/191212.list
C1=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/residGSR
#191205list.sh $C1/191212.dat $C1 $C1 $C1/191212.list

DR=/data/nil-bluearc/vlassenko/RAW_IMAGES/MRI
#191104MRISETUP.sh 191213.csv $DR 191216MRI.dat
#191205dcm2niix.sh 191216MRI.dat $DR $D0/HCP/sub 191216.csv

#191217checkforvglab.sh 191216MRI.dat $D0/HCP/sub 191217.csv
#191022HCPstructpipeSETUP.sh 191217.csv $D0/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP191217.sh 

#191016HCPfMRIpipeSETUP.sh $D0/mcavoy/HCP/191218MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCPbold191218.sh
#191127HCPfMRIpipeSETUPproject5.sh $D0/mcavoy/segment/191218MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCPbold191218b.sh

#cat $D0/mcavoy/HCP/191218MRI.dat $D0/mcavoy/segment/191218MRI.dat > 191219MRI.dat
#191212maskssplit.sh 191219MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/masks 
#191212motion.sh 191219MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/motion 
#191030slicetimer.sh $D0/mcavoy/segment/191218MRI.dat $D0/HCP/sub
#191212glmSETUP.sh $D0/mcavoy/HCP/191218MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/191219.list

#191220glmSETUP.sh 191218MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/191220.list
#191220glmSETUP.sh 191220MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/191220b.list
#C0=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/resid
#191205list.sh 191223.dat $C0 $C0 $C0/191223.list
#C1=/data/nil-bluearc/vlassenko/mcavoy/HCP/conc/glm_nohippo/residGSR
#191205list.sh 191223.dat $C1 $C1 $C1/191223.list

#200106conclist.sh 200106.dat $C0 $C0 $C0/200106.list
#200106conclist.sh 200106.dat $C1 $C1 $C1/200106.list

#191204freesurfer6.0label2vol.sh junk.csv $D0/HCP/sub
#200107conclistFS.sh 200107b.csv $C0/keep $C0 $C0/200107.list
#200107conclistFS.sh 200107b.csv $C1/keep $C1 $C1/200107.list

#200113cpCCIR_00675.sh 200113.csv /data/nil-bluearc/vlassenko/mcavoy/laterality/CCIR_00675/bold2 $D0/HCP/sub
D0=/data/nil-bluearc/vlassenko
#200113mv.sh 200113b.csv $D0/sub $D0/HCP/sub
#200113HCPstructpipeSETUP_CCIR_00675.sh 200113c.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/200113.sh

#200113HCPstructpipeSETUP_CCIR_00675.sh 200113c.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/200114.sh

DR=/data/nil-bluearc/vlassenko/RAW_IMAGES/MRI
#191104MRISETUP.sh 200117.csv $DR 200117.dat
#200117dcm2niix.sh 200117.dat $DR $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/200117.sh
#191217checkforvglab.sh /data/nil-bluearc/vlassenko/mcavoy/segment/MRI_resilience.dat $D0/HCP/sub 200117HCP.csv
#200117HCPstructpipeSETUP.sh 200117HCP.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200117 $D0/mcavoy/HCP/scriptsHCP200117/HCP200117.sh

#200121HCPfMRIpipeSETUP_CCIR_00675.sh 200113c.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200121 $D0/mcavoy/HCP/scriptsHCPbold200121/HCP200121.sh
#190917cpMAN.sh 200121MAN.csv $D0/HCP/sub $D0/MAN/mcavoy

#200122rmFS.sh /data/nil-bluearc/vlassenko/RAW_IMAGES/MRI/200122.csv /data/nil-bluearc/vlassenko/RAW_IMAGES/MRI

#200123FSholes.sh $D0/HCP/sub $D0/HCP/qc/qc200123.csv

#200113HCPstructpipeSETUP_CCIR_00675.sh 200113d.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200127 $D0/mcavoy/HCP/scriptsHCP200127/HCP200127.sh
#200117HCPstructpipeSETUP.sh 200127.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200127 $D0/mcavoy/HCP/scriptsHCP200127/HCP200127b.sh
Z0=/export/scratch/zazulia
#200127dcm2niix_zazulia.sh $Z0/zazuliaMRI_dcm2niix.dat $Z0/raw $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/D2N200127.sh       

#200117HCPstructpipeSETUP.sh 200128zazulia.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200128 $D0/mcavoy/HCP/scriptsHCP200128/HCP200128.sh
#190917cpMAN.sh 200128MAN.csv $D0/HCP/sub $D0/MAN/Chang

#191212maskssplit.sh CCIR_00675_189all.dat $D0/HCP/sub $D0/mcavoy/HCP/masks 

#190917cpMAN.sh 200130MAN.csv $D0/HCP/sub $D0/MAN/mcavoy

Z0=/export/scratch/zacks/Events132
#200204motionEvents132.sh $Z0/MRI_edit.dat $Z0/sub $Z0/motion 
##191212maskssplit.sh $Z0/MRI_edit.dat $Z0/sub $Z0/masks 
EV0=/data/nil-bluearc/vlassenko/mcavoy/zacks/Events132/ev
#200207glmSETUPEvents132.sh $Z0/MRI_edit.dat $Z0/sub $EV0 $Z0/motion $Z0/conc $Z0/conc/Day1_Cue.list 

#190917cpMAN.sh 200210MAN.csv $D0/HCP/sub $D0/MAN/mcavoy

D0=/data/nil-bluearc/vlassenko
#200211replacespacewunderscore.sh $D0/RAW_IMAGES/MRI/108206/scans
#191104MRISETUP.sh $D0/mcavoy/cnda/20210MRI.csv $D0/RAW_IMAGES/MRI 200210MRI.dat
#200211dcm2niix.sh 200210MRI.dat $D0/RAW_IMAGES/MRI $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix200210 $D0/mcavoy/HCP/scriptsdcm2niix200210/dcm2niix200210.sh
#191217checkforvglab.sh 200210MRI.dat $D0/HCP/sub 200210HCP.csv
#200117HCPstructpipeSETUP.sh 200210HCP.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200210 $D0/mcavoy/HCP/scriptsHCP200210/HCP200210.sh

#200211dcm2niix.sh 108192_v2_MRI.dat $D0/RAW_IMAGES/MRI $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix200210 $D0/mcavoy/HCP/scriptsdcm2niix200210/dcm2niix200210.sh
#191105checkphase.sh 200212MRIzacks.dat $D0/HCP/sub 200212MRIzacks_phase.txt
#200212HCPfMRIpipeSETUP.sh 200212MRIzacks.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200212 $D0/mcavoy/HCP/scriptsHCPbold200212/HCPbold200212.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200217T1hippowmparc.sh 200217.csv 200217out.csv
P5=/data/nil-bluearc/vlassenko/mcavoy/project5/raw
#191127MRISETUPproject5.sh 200217b.csv $P5 200217bMRI.dat

#200218cleanup.sh $P5
PT=/data/nil-bluearc/vlassenko/mcavoy/laterality/CCIR_00675/raw
#200218cleanup.sh $PT
#200211dcm2niix.sh 200217bMRI.dat $P5 $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix200217 $D0/mcavoy/HCP/scriptsdcm2niix200217/dcm2niix200217.sh
#191030slicetimer.sh 200217bMRI.dat $D0/HCP/sub
#200218HCPstructpipeSETUPuseMRI.sh 200217bMRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200218 $D0/mcavoy/HCP/scriptsHCP200218/HCP200218.sh

#200217T1hippowmparc.sh 200217.csv 200217out.csv
#191202freesurfer6.0SETUP.sh 200217c.csv $D0/HCP/sub $D0/mcavoy/HCP/scripts6.0_200220 $D0/mcavoy/HCP/scripts6.0_200220/FS200220.sh
#191204freesurfer6.0label2vol.sh 200217c.csv $D0/HCP/sub
#200217T1hippowmparc.sh 200217.csv 200217out.csv
#191202freesurfer6.0SETUP.sh 200217d.csv $D0/HCP/sub $D0/mcavoy/HCP/scripts6.0_200220 $D0/mcavoy/HCP/scripts6.0_200220/FS200221.sh
#191202freesurfer6.0SETUP.sh 200217e.csv $D0/HCP/sub $D0/mcavoy/HCP/scripts6.0_200220 $D0/mcavoy/HCP/scripts6.0_200220/FS200221b.sh
#190917cpMAN.sh 200217e.csv $D0/HCP/sub $D0/MAN/mcavoy

#200121HCPfMRIpipeSETUP_CCIR_00675.sh 200226.csv $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200226 $D0/mcavoy/HCP/scriptsHCPbold200226/HCP200226.sh

Z0=/export/scratch/zacks/Events132
#200204motionEvents132.sh $Z0/MRI_rest.dat $D0/HCP/sub $Z0/motion_rest 
#190917cpMAN.sh 200227.csv $D0/HCP/sub $D0/MAN/mcavoy

#200204motionEvents132.sh $Z0/MRI_rest.dat $D0/HCP/sub $Z0/motion_rest 
#200227maskssplit.sh $Z0/MRI_rest.dat $D0/HCP/sub $Z0/masks_rest 
#200304glmSETUP.sh $Z0/MRI_rest.dat $D0/HCP/sub $Z0/motion_rest $Z0/masks_rest $Z0/conc_rest $Z0/conc_rest/rest.list

#200204motionEvents132.sh $Z0/MRI_edit2.dat $Z0/sub $Z0/motion
#cp $Z0/MRI_edit2.dat 200304MRIzacks.dat
#200304HCPfMRIpipeSETUP.sh 200304MRIzacks.dat $Z0/sub $D0/mcavoy/HCP/scriptsHCPbold200304 $D0/mcavoy/HCP/scriptsHCPbold200304/HCPbold200304.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200320checkforFS.sh 200313MRI.dat $D0/HCP/sub

EV1=/data/nil-bluearc/vlassenko/mcavoy/zacks/Events132/evRun2
#200428glmSETUPEvents132.sh $Z0/MRI_edit2.dat $Z0/sub $EV1 $Z0/motion $Z0/concRun2 $Z0/concRun2/Day2_Cue.list
#200429glmSETUPEvents132.sh $Z0/MRI_edit2.dat $Z0/sub $EV1 $Z0/motion $Z0/concRun2 $Z0/concRun2/Day2_Cue.list

#200526dcm2niix.sh 108022.dat $D0/RAW_IMAGES/MRI $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix200526 $D0/mcavoy/HCP/scriptsdcm2niix200526/dcm2niix200526.sh

D0=/data/nil-bluearc/vlassenko
#200616MRISETUP.sh 200616.csv $D0/RAW_IMAGES/MRI 200616MRI.dat
#200616dcm2niix.sh 200616MRI.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200616 $D0/mcavoy/HCP/scriptsdcm2niix200616/dcm2niix200616.sh

#200617dcm2niixSCANS.sh 200617.csv $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200617 $D0/mcavoy/HCP/scriptsdcm2niix200617/dcm2niix200617.sh
#200617MRISETUP.sh 200617.csv $D0/RAW_IMAGES/MRI 200617MRI.dat
#200616dcm2niix.sh 200617MRI.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200617 $D0/mcavoy/HCP/scriptsdcm2niix200617/dcm2niix200617.sh

#200618MRISETUP.sh 200618.csv $D0/RAW_IMAGES/MRI 200618MRI.dat
#200616dcm2niix.sh 200618MRI.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200618 $D0/mcavoy/HCP/scriptsdcm2niix200618/dcm2niix200618.sh
#200617dcm2niixSCANS.sh 200618b.csv $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200618 $D0/mcavoy/HCP/scriptsdcm2niix200618/dcm2niix200618b.sh
#200618HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200618.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200618 $D0/mcavoy/HCP/scriptsHCP200618/HCP200618.sh $D0/mcavoy/HCP/nii

#200620MRISETUP.sh 200620.csv $D0/RAW_IMAGES/MRI 200620.dat
#200616dcm2niix.sh 200620.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200620 $D0/mcavoy/HCP/scriptsdcm2niix200620/dcm2niix200620.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200620MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200620 $D0/mcavoy/HCP/scriptsHCP200620/HCP200620.sh $D0/mcavoy/HCP/nii

#200620MRISETUP.sh 200622.csv $D0/RAW_IMAGES/MRI 200622.dat
#200616dcm2niix.sh 200622.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200622 $D0/mcavoy/HCP/scriptsdcm2niix200622/dcm2niix200622.sh
#200622MRISETUP.sh 200622.csv $D0/RAW_IMAGES/MRI 200622.dat
#200616dcm2niix.sh 200622b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200622 $D0/mcavoy/HCP/scriptsdcm2niix200622/dcm2niix200622b.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200622MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200622 $D0/mcavoy/HCP/scriptsHCP200622/HCP200622.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200623.csv $D0/RAW_IMAGES/MRI 200623.dat
#200616dcm2niix.sh 200623.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200623 $D0/mcavoy/HCP/scriptsdcm2niix200623/dcm2niix200623.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200623MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200623 $D0/mcavoy/HCP/scriptsHCP200623/HCP200623.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200624.csv $D0/RAW_IMAGES/MRI 200624.dat
#200616dcm2niix.sh 200624.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200624 $D0/mcavoy/HCP/scriptsdcm2niix200624/dcm2niix200624.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200624MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200624 $D0/mcavoy/HCP/scriptsHCP200624/HCP200624.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200625.csv $D0/RAW_IMAGES/MRI 200625.dat
#200616dcm2niix.sh 200625.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200625 $D0/mcavoy/HCP/scriptsdcm2niix200625/dcm2niix200625.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200625MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200625 $D0/mcavoy/HCP/scriptsHCP200625/HCP200625.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200626.csv $D0/RAW_IMAGES/MRI 200626.dat
#200616dcm2niix.sh 200626.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200626 $D0/mcavoy/HCP/scriptsdcm2niix200626/dcm2niix200626.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200626MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200626 $D0/mcavoy/HCP/scriptsHCP200626/HCP200626.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200627.csv $D0/RAW_IMAGES/MRI 200627.dat
#200616dcm2niix.sh 200627.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200627 $D0/mcavoy/HCP/scriptsdcm2niix200627/dcm2niix200627.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200627MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200627 $D0/mcavoy/HCP/scriptsHCP200627/HCP200627.sh $D0/mcavoy/HCP/nii

#200622MRISETUP.sh 200628.csv $D0/RAW_IMAGES/MRI 200628.dat
#200616dcm2niix.sh 200628.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200628 $D0/mcavoy/HCP/scriptsdcm2niix200628/dcm2niix200628.sh
#200628MRISETUP.sh 200628.csv $D0/RAW_IMAGES/MRI 200628.dat
#200616dcm2niix.sh 200628b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200628 $D0/mcavoy/HCP/scriptsdcm2niix200628/dcm2niix200628b.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200628MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200628 $D0/mcavoy/HCP/scriptsHCP200628/HCP200628.sh $D0/mcavoy/HCP/nii

#200628MRISETUP.sh 200629.csv $D0/RAW_IMAGES/MRI 200629.dat
#200616dcm2niix.sh 200629.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200629 $D0/mcavoy/HCP/scriptsdcm2niix200629/dcm2niix200629.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200629MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200629 $D0/mcavoy/HCP/scriptsHCP200629/HCP200629.sh $D0/mcavoy/HCP/nii

#200628MRISETUP.sh 200630.csv $D0/RAW_IMAGES/MRI 200630.dat
#200616dcm2niix.sh 200630.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200630 $D0/mcavoy/HCP/scriptsdcm2niix200630/dcm2niix200630.sh
#200630MRISETUP.sh 200630.csv $D0/RAW_IMAGES/MRI 200630.dat
#200616dcm2niix.sh 200630b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200630 $D0/mcavoy/HCP/scriptsdcm2niix200630/dcm2niix200630b.sh
#200630MRISETUP.sh 200630.csv $D0/RAW_IMAGES/MRI 200630.dat
#200616dcm2niix.sh 200630c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200630 $D0/mcavoy/HCP/scriptsdcm2niix200630/dcm2niix200630c.sh
#200616dcm2niix.sh 200630d.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200630 $D0/mcavoy/HCP/scriptsdcm2niix200630/dcm2niix200630d.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200630MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200630 $D0/mcavoy/HCP/scriptsHCP200630/HCP200630.sh $D0/mcavoy/HCP/nii

#200630MRISETUP.sh 200701.csv $D0/RAW_IMAGES/MRI 200701.dat
#200616dcm2niix.sh 200701.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200701 $D0/mcavoy/HCP/scriptsdcm2niix200701/dcm2niix200701.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200701MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200701 $D0/mcavoy/HCP/scriptsHCP200701/HCP200701.sh $D0/mcavoy/HCP/nii

#200630MRISETUP.sh 200702.csv $D0/RAW_IMAGES/MRI 200702.dat
#200616dcm2niix.sh 200702.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200702 $D0/mcavoy/HCP/scriptsdcm2niix200702/dcm2niix200702.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200702MRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200702 $D0/mcavoy/HCP/scriptsHCP200702/HCP200702.sh $D0/mcavoy/HCP/nii

#200703checkforFS.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub 200703redoMRI.dat 200703rm.sh
#200703rm.sh
#200616dcm2niix.sh 200703redoMRI.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200703 $D0/mcavoy/HCP/scriptsdcm2niix200703/dcm2niix200703.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200703redoMRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200703 $D0/mcavoy/HCP/scriptsHCP200703/HCP200703.sh $D0/mcavoy/HCP/nii

#200703checkforFS.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub 200708redoMRI.dat 200708rm.sh

#200703checkforFS.sh $D0/mcavoy/segment/MRI_Andrei_noT2.dat $D0/HCP/sub 200709redoMRI.dat 200709rm.sh

#200710HCPfMRIpipeSETUP.sh 200710MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200710  $D0/mcavoy/HCP/scriptsHCPbold200710/HCP200710.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200711checkphase.sh 200711MRI.dat $D0/mcavoy/HCP/bold 200711phase.txt
#200711HCPfMRIpipeSETUP.sh 200711MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200711  $D0/mcavoy/HCP/scriptsHCPbold200711/HCP200711.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200711HCPfMRIpipeSETUP.sh 200712MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200712  $D0/mcavoy/HCP/scriptsHCPbold200712/HCP200712.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200711HCPfMRIpipeSETUP.sh 200713MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200713  $D0/mcavoy/HCP/scriptsHCPbold200713/HCP200713.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200713MANmv.sh $D0/MAN/mcavoy/Mark_draw.txt ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm200711.csv 200713mv.sh

#200630MRISETUP.sh 200714.csv $D0/RAW_IMAGES/MRI 200714.dat
#200616dcm2niix.sh 200714.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200714 $D0/mcavoy/HCP/scriptsdcm2niix200714/dcm2niix200714.sh
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200714.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200714 $D0/mcavoy/HCP/scriptsHCP200714/HCP200714.sh $D0/mcavoy/HCP/nii
#200621HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200714b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200714 $D0/mcavoy/HCP/scriptsHCP200714/HCP200714b.sh $D0/mcavoy/HCP/nii
#200711checkphase.sh 200714MRI.dat $D0/mcavoy/HCP/bold 200714phase.txt
#200714HCPfMRIpipeSETUP.sh 200714MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200714  $D0/mcavoy/HCP/scriptsHCPbold200714/HCP200714.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200616dcm2niix.sh 200715b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200714 $D0/mcavoy/HCP/scriptsdcm2niix200714/dcm2niix200715.sh
#200715HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200715.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP200714 $D0/mcavoy/HCP/scriptsHCP200714/HCP200715.sh $D0/mcavoy/HCP/nii
#200715checkphase.sh 200715MRI.dat $D0/mcavoy/HCP/bold 200715phase.txt
#200715HCPfMRIpipeSETUP.sh 200715MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold200714  $D0/mcavoy/HCP/scriptsHCPbold200714/HCP200715.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200717MANmv.sh $D0/MAN/mcavoy/Mark_draw.txt ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm200711.csv $D0/MAN/mcavoy 200717mv.sh
#200717mv.sh
#200717MANmv.sh $D0/MAN/Chang/Ryan_draw.txt ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm200718.csv $D0/MAN/Chang 200718mv.sh

#200718slicetimer.sh 200718MRI.dat $D0/mcavoy/HCP/bold
#200718slicetimer.sh junk.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200718MRI.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200718.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200718slicetimer.sh 200720.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200720.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200720.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200718slicetimer.sh 200720b.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200720b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200720b.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200721MRISETUP.sh 200721.csv $D0/RAW_IMAGES/MRI 200721.dat
#200616dcm2niix.sh 200721edit.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200721 $D0/mcavoy/HCP/scriptsdcm2niix200721/dcm2niix200721.sh
#200715HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/segment/200721editMRI.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200721.sh $D0/mcavoy/HCP/nii

#200721MRISETUP.sh 200722.csv $D0/RAW_IMAGES/MRI 200722.dat
#200616dcm2niix.sh 200722edit.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200722 $D0/mcavoy/HCP/scriptsdcm2niix200722/dcm2niix200722.sh
#200715HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200722edit.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200722.sh $D0/mcavoy/HCP/nii

#200718slicetimer.sh 200723.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200723.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200723.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200715HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200724.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200724.sh $D0/mcavoy/HCP/nii

#200616dcm2niix.sh 200725b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200725 $D0/mcavoy/HCP/scriptsdcm2niix200725/dcm2niix200725.sh
#200715HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200725.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200725.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200725d.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200725 $D0/mcavoy/HCP/scriptsdcm2niix200725/dcm2niix200725d.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200725c.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200725c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200725e.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200725e.sh $D0/mcavoy/HCP/nii

#200721MRISETUP.sh 200727.csv $D0/RAW_IMAGES/MRI 200727.dat
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200727.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200727.sh $D0/mcavoy/HCP/nii

#200715checkphase.sh 200728.dat $D0/mcavoy/HCP/bold 200728phase.txt
#200718slicetimer.sh 200728b.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200728c.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200728.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200728e.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200728 $D0/mcavoy/HCP/scriptsdcm2niix200728/dcm2niix200728d.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200728d.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200728d.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200729.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200729.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200729.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200730.dat $D0/mcavoy/HCP/bold
#200718HCPfMRIpipeSETUP.sh 200730.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200730.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200730c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200730c $D0/mcavoy/HCP/scriptsdcm2niix200730c/dcm2niix200730c.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200730b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200730b.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200730e.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200730 $D0/mcavoy/HCP/scriptsdcm2niix200730/dcm2niix200730e.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200730d.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200730d.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200730f.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200730 $D0/mcavoy/HCP/scriptsdcm2niix200730/dcm2niix200730f.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200730f.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200730f.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200805.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200805.dat $D0/mcavoy/HCP/bold 200805phase.txt
#200718HCPfMRIpipeSETUP.sh 200805.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200805.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200805c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200805 $D0/mcavoy/HCP/scriptsdcm2niix200805/dcm2niix200805.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200805b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200805b.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200806.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200806.dat $D0/mcavoy/HCP/bold 200806phase.txt
#200806HCPfMRIpipeSETUP.sh 200806.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200806.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200806HCPfMRIpipeSETUP.sh 200806b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200806b.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200616dcm2niix.sh 200807b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200807 $D0/mcavoy/HCP/scriptsdcm2niix200807/dcm2niix200807.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200807.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200807.sh $D0/mcavoy/HCP/nii
#200729slicetimer.sh 200807c.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200807c.dat $D0/mcavoy/HCP/bold 200807phase.txt
#200806HCPfMRIpipeSETUP.sh 200807c.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200807c.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200808.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200808.dat $D0/mcavoy/HCP/bold 200808phase.txt
#200806HCPfMRIpipeSETUP.sh 200808.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200808.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200809.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200809.dat $D0/mcavoy/HCP/bold 200809phase.txt
#200806HCPfMRIpipeSETUP.sh 200809.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200809.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200809c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200809 $D0/mcavoy/HCP/scriptsdcm2niix200809/dcm2niix200809.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200809b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200809b.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200809d.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200809 $D0/mcavoy/HCP/scriptsdcm2niix200809/dcm2niix200809d.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200809e.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200809e.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200810.dat $D0/mcavoy/HCP/bold
#200715checkphase.sh 200810.dat $D0/mcavoy/HCP/bold 200810phase.txt
#200806HCPfMRIpipeSETUP.sh 200810.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200810.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200810c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200810 $D0/mcavoy/HCP/scriptsdcm2niix200810/dcm2niix200810c.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810b.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200810e.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200810 $D0/mcavoy/HCP/scriptsdcm2niix200810/dcm2niix200810e.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810d.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810d.sh $D0/mcavoy/HCP/nii
#200616dcm2niix.sh 200810g.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200810 $D0/mcavoy/HCP/scriptsdcm2niix200810/dcm2niix200810g.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810f.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810f.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810h.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810h.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810i.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810i.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810j.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810j.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810k.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810k.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200810l.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200810l.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200811.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200811.dat $D0/mcavoy/HCP/bold 200811phase.txt
#200811HCPfMRIpipeSETUP.sh 200811.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200811.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200811b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200811b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200811b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200811c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200811b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200811d.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200812.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200812.dat $D0/mcavoy/HCP/bold 200812phase.txt
#200811HCPfMRIpipeSETUP.sh 200812.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200812.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200616dcm2niix.sh 200812.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200812 $D0/mcavoy/HCP/scriptsdcm2niix200812/dcm2niix200812.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200812b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200812b.sh $D0/mcavoy/HCP/nii

#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813.sh $D0/mcavoy/HCP/nii
#200729slicetimer.sh 200813.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200813.dat $D0/mcavoy/HCP/bold 200813phase.txt
#200811HCPfMRIpipeSETUP.sh 200813.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200813.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813d.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813e.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200813.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200813f.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200814.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200814.dat $D0/mcavoy/HCP/bold 200814phase.txt
#200811HCPfMRIpipeSETUP.sh 200814.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200814.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815.sh $D0/mcavoy/HCP/nii
#200729slicetimer.sh 200815.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200815.dat $D0/mcavoy/HCP/bold 200815phase.txt
#200811HCPfMRIpipeSETUP.sh 200815.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200815.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815d.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815e.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200815.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200815f.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200816.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200816.dat $D0/mcavoy/HCP/bold 200816phase.txt
#200811HCPfMRIpipeSETUP.sh 200816.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200816.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200816.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200816b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200816.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200816c.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200817.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200817.dat $D0/mcavoy/HCP/bold 200817phase.txt
#200811HCPfMRIpipeSETUP.sh 200817.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200817.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817d.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817e.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817f.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200817.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200817g.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200818.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200818.dat $D0/mcavoy/HCP/bold 200818phase.txt
#200811HCPfMRIpipeSETUP.sh 200818.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200818.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200819.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200819.dat $D0/mcavoy/HCP/bold 200819phase.txt
#200811HCPfMRIpipeSETUP.sh 200819.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200819.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200820.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200820.dat $D0/mcavoy/HCP/bold 200820phase.txt
#200811HCPfMRIpipeSETUP.sh 200820.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200820.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200821.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200821.dat $D0/mcavoy/HCP/bold 200821phase.txt
#200821HCPfMRIpipeSETUP.sh 200821.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200821.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200821HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200821.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200821.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200822.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200822.dat $D0/mcavoy/HCP/bold 200822phase.txt
#200821HCPfMRIpipeSETUP.sh 200822.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200822.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200823.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200823.dat $D0/mcavoy/HCP/bold 200822phase.txt
#200821HCPfMRIpipeSETUP.sh 200823.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200823.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200824.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200824.dat $D0/mcavoy/HCP/bold 200824phase.txt
#200821HCPfMRIpipeSETUP.sh 200824.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200824.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200825.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200825.dat $D0/mcavoy/HCP/bold 200825phase.txt
#200821HCPfMRIpipeSETUP.sh 200825.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200825.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200729slicetimer.sh 200826.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200826.dat $D0/mcavoy/HCP/bold 200826phase.txt
#200821HCPfMRIpipeSETUP.sh 200826.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200826.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200616dcm2niix.sh 200826b.dat /export/scratch/zacks/Events132/RAW $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200826b $D0/mcavoy/HCP/scriptsdcm2niix200826b/dcm2niix200826b.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200826b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200826b.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200827.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200827.dat $D0/mcavoy/HCP/bold 200827phase.txt
#200821HCPfMRIpipeSETUP.sh 200827.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200827.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200616dcm2niix.sh 200827b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200827b $D0/mcavoy/HCP/scriptsdcm2niix200827b/dcm2niix200827b.sh
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200827.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200827.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200827.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200827b.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200827.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200827c.sh $D0/mcavoy/HCP/nii
#200725HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200827.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200827d.sh $D0/mcavoy/HCP/nii

#200729slicetimer.sh 200828.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200828.dat $D0/mcavoy/HCP/bold 200828phase.txt
#200821HCPfMRIpipeSETUP.sh 200828.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200828.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200829.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200829.dat $D0/mcavoy/HCP/bold 200829phase.txt
#200821HCPfMRIpipeSETUP.sh 200829.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200829.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#190917cpMAN.sh 200829.csv $D0/HCP/sub $D0/MAN/mcavoy

#200829slicetimer.sh 200830.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200830.dat $D0/mcavoy/HCP/bold 200830phase.txt
#200821HCPfMRIpipeSETUP.sh 200830.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200830.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200831.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200831.dat $D0/mcavoy/HCP/bold 200831phase.txt
#200821HCPfMRIpipeSETUP.sh 200831.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200831.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200901.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200901.dat $D0/mcavoy/HCP/bold 200901phase.txt
#200821HCPfMRIpipeSETUP.sh 200901.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200901.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200902dcm2niix.sh 200902b.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200902b $D0/mcavoy/HCP/scriptsdcm2niix200902b/dcm2niix200902b.sh
#200829slicetimer.sh 200902.dat $D0/mcavoy/HCP/bold
#200829slicetimer.sh 200902b.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200902.dat $D0/mcavoy/HCP/bold 200902phase.txt
#200821HCPfMRIpipeSETUP.sh 200902.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200902.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200903.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200903.dat $D0/mcavoy/HCP/bold 200903phase.txt
#200821HCPfMRIpipeSETUP.sh 200903.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200903.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200908.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200908.dat $D0/mcavoy/HCP/bold 200908phase.txt
#200821HCPfMRIpipeSETUP.sh 200908.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200908.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200909.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200909.dat $D0/mcavoy/HCP/bold 200909phase.txt
#200821HCPfMRIpipeSETUP.sh 200909.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200909.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200910.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200910.dat $D0/mcavoy/HCP/bold 200910phase.txt
#200821HCPfMRIpipeSETUP.sh 200910.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200910.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200910HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt

#200829slicetimer.sh 200911.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200911.dat $D0/mcavoy/HCP/bold 200911phase.txt
#200821HCPfMRIpipeSETUP.sh 200911.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200911.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt

#200829slicetimer.sh 200912.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200912.dat $D0/mcavoy/HCP/bold 200912phase.txt
#200821HCPfMRIpipeSETUP.sh 200912.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200912.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200829slicetimer.sh 200912b.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200912b.dat $D0/mcavoy/HCP/bold 200912bphase.txt
#200821HCPfMRIpipeSETUP.sh 200912b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200912b.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt
#200829slicetimer.sh 200913a.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200913a.dat $D0/mcavoy/HCP/bold 200913aphase.txt
#200821HCPfMRIpipeSETUP.sh 200913a.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200913a.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200829slicetimer.sh 200913b.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200913b.dat $D0/mcavoy/HCP/bold 200913bphase.txt
#200821HCPfMRIpipeSETUP.sh 200913b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200913b.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200821HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200913c.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200913c.sh $D0/mcavoy/HCP/nii

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt
#200829slicetimer.sh 200914.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200914.dat $D0/mcavoy/HCP/bold 200914phase.txt
#200821HCPfMRIpipeSETUP.sh 200914.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200914.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200829slicetimer.sh 200914b.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200914b.dat $D0/mcavoy/HCP/bold 200914bphase.txt
#200914HCPfMRIpipeSETUP.sh 200914b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200914b.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt
#200829slicetimer.sh 200915.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200915.dat $D0/mcavoy/HCP/bold 200915phase.txt
#200914HCPfMRIpipeSETUP.sh 200915.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200915.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200916.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200916.dat $D0/mcavoy/HCP/bold 200916phase.txt
#200914HCPfMRIpipeSETUP.sh 200916.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200916.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt

#200829slicetimer.sh 200917.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200917.dat $D0/mcavoy/HCP/bold 200917phase.txt
#200914HCPfMRIpipeSETUP.sh 200917.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200917.sh 200205GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 200918a.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200918a.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200914HCPfMRIpipeSETUP.sh 200918b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200918b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200914HCPfMRIpipeSETUP.sh 200918c.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200918c.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200914HCPfMRIpipeSETUP.sh 200918d.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200918d.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh Events132.dat $D0/HCP/sub Events132_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 200919.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200919.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh MRI_Andrei_edit.dat $D0/HCP/sub MRI_Andrei_edit_HCPmovement.txt
#200829slicetimer.sh 200920.dat $D0/mcavoy/HCP/bold
#200811checkphase.sh 200920.dat $D0/mcavoy/HCP/bold 200920phase.txt
#200914HCPfMRIpipeSETUP.sh 200920.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200920.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh MRI_Andrei_edit.dat $D0/HCP/sub MRI_Andrei_edit_HCPmovement.txt
#200829slicetimer.sh 200922.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200922.dat $D0/mcavoy/HCP/bold 200922phase.txt
#200914HCPfMRIpipeSETUP.sh 200922.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200922.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#190917cpMAN.sh 200922.csv $D0/HCP/sub $D0/MAN/mcavoy

#200829slicetimer.sh 200923.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200923.dat $D0/mcavoy/HCP/bold 200923phase.txt
#200914HCPfMRIpipeSETUP.sh 200923.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200923.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200924.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200924.dat $D0/mcavoy/HCP/bold 200924phase.txt
#200914HCPfMRIpipeSETUP.sh 200924.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200924.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200925.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200925.dat $D0/mcavoy/HCP/bold 200925phase.txt
#200914HCPfMRIpipeSETUP.sh 200925.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200925.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200829slicetimer.sh 200926.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200926.dat $D0/mcavoy/HCP/bold 200926phase.txt
#200914HCPfMRIpipeSETUP.sh 200926.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200926.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200911HCPcheckmovement.sh MRI_Andrei_edit.dat $D0/HCP/sub MRI_Andrei_edit_HCPmovement.txt

#200829slicetimer.sh 200927.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200927.dat $D0/mcavoy/HCP/bold 200927phase.txt
#200914HCPfMRIpipeSETUP.sh 200927.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200927.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh MRI_Andrei_edit.dat $D0/HCP/sub MRI_Andrei_edit_HCPmovement.txt
#200829slicetimer.sh 200928.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200928.dat $D0/mcavoy/HCP/bold 200928phase.txt
#200914HCPfMRIpipeSETUP.sh 200928.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200928.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200902dcm2niix.sh 200929.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200929 $D0/mcavoy/HCP/scriptsdcm2niix200929/dcm2niix200929.sh
#200821HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/200929.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP200929.sh $D0/mcavoy/HCP/nii

#200914HCPfMRIpipeSETUP.sh 200929.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200929.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200829slicetimer.sh 200930.dat $D0/mcavoy/HCP/bold
#200922checkphase.sh 200930.dat $D0/mcavoy/HCP/bold 200930phase.txt
#200914HCPfMRIpipeSETUP.sh 200930.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP200930.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 201001.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201001.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201001HCPstructpipeSETUPeditFS.sh $D0/mcavoy/HCP/201001b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPedit $D0/mcavoy/HCP/scriptsHCPedit/HCP201001b.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 201002.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201002.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 201004.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201004.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 201006.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201006.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200914HCPfMRIpipeSETUP.sh 201006b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201006b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200914HCPfMRIpipeSETUP.sh 201014.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201014.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200922checkphase.sh 201015.dat $D0/mcavoy/HCP/bold 201015phase.txt
#200914HCPfMRIpipeSETUP.sh 201015.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201015.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200922checkphase.sh 201016.dat $D0/mcavoy/HCP/bold 201016phase.txt
#200914HCPfMRIpipeSETUP.sh 201016.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201016.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200922checkphase.sh 201017.dat $D0/mcavoy/HCP/bold 201017phase.txt
#200914HCPfMRIpipeSETUP.sh 201017.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201017.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#201022HCPfMRIpipeSETUP.sh 201022.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201022.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#190917cpMAN.sh 201025.csv $D0/HCP/sub $D0/MAN/mcavoy

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#200821HCPstructpipeSETUPuseMRI.sh $D0/mcavoy/HCP/201029.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP201029.sh $D0/mcavoy/HCP/nii

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
C0=/data/nil-bluearc/vlassenko/mcavoy/cnda/raw
#200721MRISETUP.sh 201116.csv $C0 201116.dat

#200902dcm2niix.sh 201116.dat $C0 $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201116.sh

#200821HCPstructpipeSETUPuseMRI.sh 201116.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP20116.sh $D0/mcavoy/cnda/nii

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#200721MRISETUP.sh 201201.csv $C0 201201.dat
#200902dcm2niix.sh 201201.dat $C0 $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201201.sh
#200821HCPstructpipeSETUPuseMRI.sh 201201.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP201201.sh $D0/mcavoy/cnda/nii
#201022HCPfMRIpipeSETUP.sh 201116.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201116.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201022HCPfMRIpipeSETUP.sh 201201.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201201.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201205MRISETUP.sh 201205.csv $D0/RAW_IMAGES/MRI 201205.dat
#201205MRISETUP.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/RAW_IMAGES/MRI 201205.dat
#201205dcm2niix_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niixsetter $D0/mcavoy/HCP/scriptsdcm2niixsetter/setter201205.sh
#200902dcm2niix.sh 200929.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix200929 $D0/mcavoy/HCP/scriptsdcm2niix200929/dcm2niix200929.sh

#201206hdr_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/mcavoy/HCP/nii
#201205dcm2niix_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niixsetterB $D0/mcavoy/HCP/scriptsdcm2niixsetterB/setter201206.sh
#201206rm_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/mcavoy/HCP/nii $D0/mcavoy/HCP/scriptsdcm2niixsetter/rm_setter201206.sh

#201206hdr_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/mcavoy/HCP/nii

#201205MRISETUP.sh 201207.csv $C0 201207.dat
#200902dcm2niix.sh 201207.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201207.sh

#201208hdr_setter.sh $D0/mcavoy/segment/MRI_Andrei.dat_201205160858 $D0/mcavoy/HCP/nii ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm201205_vlasfold.csv 201208.csv

#200821HCPstructpipeSETUPuseMRI.sh 201207.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP201207.sh $D0/mcavoy/cnda/nii
#200902dcm2niix.sh 201214b.dat $D0/RAW_IMAGES/MRI $D0/HCP/sub $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201214b.sh
#201206hdr_setter.sh 201214b.dat $D0/mcavoy/HCP/nii
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201214resilience.csv 201214resilience.dat
#201214motion.sh 201214resilience.dat $D0/HCP/sub motion

#201215maskssplit.sh junk.csv $D0/HCP/sub masks
#201215maskssplit.sh 201215_01.csv $D0/HCP/sub masks > 201215_01.csv.txt 2>&1 &
#201215maskssplit.sh 201215_02.csv $D0/HCP/sub masks > 201215_02.csv.txt 2>&1 &
#201215maskssplit.sh 201215_03.csv $D0/HCP/sub masks > 201215_03.csv.txt 2>&1 &
#201215maskssplit.sh 201215_04.csv $D0/HCP/sub masks > 201215_04.csv.txt 2>&1 &
#201215maskssplit.sh 201215_05.csv $D0/HCP/sub masks > 201215_05.csv.txt 2>&1 &
#201215maskssplit.sh 201215_06.csv $D0/HCP/sub masks > 201215_06.csv.txt 2>&1 &
#201215maskssplit.sh 201215_07.csv $D0/HCP/sub masks > 201215_07.csv.txt 2>&1 &
#201215maskssplit.sh 201215_08.csv $D0/HCP/sub masks > 201215_08.csv.txt 2>&1 &
#201215maskssplit.sh 201215_09.csv $D0/HCP/sub masks > 201215_09.csv.txt 2>&1 &
#201215maskssplit.sh 201215_10.csv $D0/HCP/sub masks > 201215_10.csv.txt 2>&1 &

#201216glmSETUP.sh 201214resilience.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience.list
#201216glmSETUP.sh 201214resilience1.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience1.list
#201216glmSETUP.sh 201214resilience2.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience2.list
#201216glmSETUP.sh 201214resilience3.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience3.list
#201216glmSETUP.sh 201214resilience4.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience4.list

#190917cpMAN.sh 201221.csv $D0/HCP/sub $D0/MAN/mcavoy
#201221sdSETUP.sh 201214resilience.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm /vgpool/data1/mcavoy/HCP/conc/glm/201214resilience_sd.list
#201216glmSETUP.sh 201214resilience_missing.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc $D0/mcavoy/HCP/conc/201214resilience_missing.list

#200911HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#201222MRISETUP.sh $D0/mcavoy/cnda/201215.csv $C0 201215.dat
#200902dcm2niix.sh 201215.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201215.sh
#200821HCPstructpipeSETUPuseMRI.sh 201215.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP201215.sh $D0/mcavoy/cnda/nii

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201223.csv 201223.dat
#201223HCPfMRIpipeSETUP.sh 201223.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201223.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200902dcm2niix.sh 201223.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201223.sh

#201223HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#201221sdSETUP.sh 201214resilience.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm /vgpool/data1/mcavoy/HCP/conc/glm/201214resilience_sd.list

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201231.csv 201231.dat
#200829slicetimer.sh 201231.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 201231.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201231.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201231b.csv 201231b.dat
#200829slicetimer.sh 201231b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 201231b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201231b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201231c.csv 201231c.dat
#200902dcm2niix.sh 201231c.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/dcm2niix201231c.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 201231c.csv 201231c.dat
#200829slicetimer.sh 201231c.dat $D0/mcavoy/cnda/bold
#200902dcm2niix.sh junk.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/junk.sh
#200829slicetimer.sh junk.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 201231c.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP201231c.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210101.csv 210101.dat
#200829slicetimer.sh 210101.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210101.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210101.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210101b.csv 210101b.dat
#200829slicetimer.sh 210101b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210101b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210101b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210102.csv 210102.dat
#200829slicetimer.sh 210102.dat $D0/mcavoy/cnda/bold
#200829slicetimer.sh junk.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210102.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210102.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210102b.csv 210102b.dat
#200829slicetimer.sh 210102b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210102b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210102b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210103.csv 210103.dat
#200829slicetimer.sh 210103.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210103.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210103.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200821HCPstructpipeSETUPuseMRI.sh 201215.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP201215.sh $D0/mcavoy/cnda/nii

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210104.csv 210104.dat
#200829slicetimer.sh 210104.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210104.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210104.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210104b.csv 210104b.dat
#200829slicetimer.sh 210104b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210104b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210104b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201214subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210105.csv 210105.dat
#200829slicetimer.sh 210105.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210105.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210105.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#210107glm_sdGSR.sh 210107.csv /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR  /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR/210108sdGSR.sh

#210107glm_sdGSR.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_1.csv /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR/210108_1sdGSR.sh
#210107glm_sdGSR.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_2.csv /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR/210108_2sdGSR.sh
#210107glm_sdGSR.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_3.csv /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR/210108_3sdGSR.sh
#210107glm_sdGSR.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_4.csv /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR /vgpool/data1/mcavoy/HCP/conc/glm/sdGSR/210108_4sdGSR.sh
#210108glm_sd.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_2edit.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210108_2sd.sh
#210108glm_sd.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_3.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210108_3sd.sh
#210108glm_sd.sh /vgpool/data1/mcavoy/HCP/conc/glm/210108_4.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210108_4sd.sh

#201222MRISETUP.sh $D0/mcavoy/cnda/210108.csv $C0 210108.dat
#201222MRISETUP.sh $D0/mcavoy/cnda/junk.csv $C0 junk.dat
#200902dcm2niix.sh 210108.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210108.sh
#200902dcm2niix.sh junk.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/junk.sh
#200821HCPstructpipeSETUPuseMRI.sh 210108.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210108.sh $D0/mcavoy/cnda/nii
#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#201222MRISETUP.sh $D0/mcavoy/cnda/210109.csv $C0 210109.dat
#200902dcm2niix.sh 210109.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210109.sh
#200821HCPstructpipeSETUPuseMRI.sh 210109.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210109.sh $D0/mcavoy/cnda/nii
#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#201222MRISETUP.sh 210111.csv $C0 210111.dat
#200829slicetimer.sh 210111.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210111.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210111.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210111b.csv $C0 210111b.dat
#200829slicetimer.sh 210111b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210111b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210111b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201222MRISETUP.sh 210112.csv $C0 210112.dat
#200829slicetimer.sh 210112.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210112.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210112.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210112b.csv $C0 210112b.dat
#200829slicetimer.sh 210112b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210112b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210112b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210112c.csv $C0 210112c.dat
#200829slicetimer.sh 210112c.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210112c.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210112c.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210112d.csv $C0 210112d.dat
#200829slicetimer.sh 210112d.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210112d.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210112d.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201222MRISETUP.sh 210113.csv $C0 210113.dat
#200829slicetimer.sh 210113.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210113.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210113.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210113b.csv $C0 210113b.dat
#200829slicetimer.sh 210113b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210113b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210113b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201222MRISETUP.sh 210114.csv $C0 210114.dat
#200829slicetimer.sh 210114.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210114.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210114.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh $D0/mcavoy/cnda/210110.csv $C0 210110.dat
#200902dcm2niix.sh 210110.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210110.sh
#200821HCPstructpipeSETUPuseMRI.sh 210110.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210110.sh $D0/mcavoy/cnda/nii
#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#210114resilienceGroup.sh 201214resilience.dat ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm210114vlasfold.csv resilienceGroup.dat

#201222MRISETUP.sh 210115.csv $C0 210115.dat
#200829slicetimer.sh 210115.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210115.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210115.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh 210115b.csv $C0 210115b.dat
#200829slicetimer.sh 210115b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210115b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210115b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#201222MRISETUP.sh 210116b.csv $C0 210116b.dat
#200829slicetimer.sh 210116b.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210116b.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210116b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201222MRISETUP.sh $D0/mcavoy/cnda/210116.csv $C0 210116.dat
#200902dcm2niix.sh 210116.dat $D0/mcavoy/cnda/raw $D0/mcavoy/cnda $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210116.sh
#200821HCPstructpipeSETUPuseMRI.sh 210116.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210116.sh $D0/mcavoy/cnda/nii

#200829slicetimer.sh 210116.dat $D0/mcavoy/cnda/bold
#201223HCPfMRIpipeSETUP.sh 210116.dat $D0/mcavoy/cnda/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210116.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#cp $D0/mcavoy/segment/MRI_Andrei.dat 210118PMR.dat
#210118motion.sh 210118PMR.dat $D0/HCP/sub motion
#201215maskssplit.sh 210118_01.dat $D0/HCP/sub masks > 210118_01.dat.txt 2>&1 &
#201215maskssplit.sh 210118_02.dat $D0/HCP/sub masks > 210118_02.dat.txt 2>&1 &
#201215maskssplit.sh 210118_03.dat $D0/HCP/sub masks > 210118_03.dat.txt 2>&1 &
#201215maskssplit.sh 210118_04.dat $D0/HCP/sub masks > 210118_04.dat.txt 2>&1 &
#201215maskssplit.sh 210118_05.dat $D0/HCP/sub masks > 210118_05.dat.txt 2>&1 &
#201215maskssplit.sh 210118_06.dat $D0/HCP/sub masks > 210118_06.dat.txt 2>&1 &
#201215maskssplit.sh 210118_07.dat $D0/HCP/sub masks > 210118_07.dat.txt 2>&1 &
#201215maskssplit.sh 210118_08.dat $D0/HCP/sub masks > 210118_08.dat.txt 2>&1 &
#201215maskssplit.sh 210118_09.dat $D0/HCP/sub masks > 210118_09.dat.txt 2>&1 &
#201215maskssplit.sh 210118_10.dat $D0/HCP/sub masks > 210118_10.dat.txt 2>&1 &
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat resilienceGroup1.csv resilienceGroup1.dat

#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat resilienceGroup2.csv resilienceGroup2.dat
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat resilienceGroup3.csv resilienceGroup3.dat
#210119HCPcheckmovement_glm.sh resilienceGroup1.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm 1.5 resilienceGroup1.list 
#210119HCPcheckmovement_glm.sh resilienceGroup2.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm 1.5 resilienceGroup2.list 
#210119HCPcheckmovement_glm.sh resilienceGroup3.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm 1.5 resilienceGroup3.list 

#210120HCPcheckmovement_sd.sh resilienceGroup3.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup3.sh 
#210108glm_sd.sh /vgpool/data1/mcavoy/HCP/conc/glm/210120.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210120.sh

#210120HCPcheckmovement_sd.sh resilienceGroup2.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup2.sh 
#210108glm_sd.sh 210121.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210121.sh
#210120HCPcheckmovement_sd.sh resilienceGroup1.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup1.sh 
#210108glm_sd.sh 210121b.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210121b.sh
#210121glmSETUP.sh 210118PMR.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc 210118PMR.list
#210121glmSETUP.sh 210118PMR_1.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc /vgpool/data1/mcavoy/HCP/conc/glmPMR/210118PMR_1.list
#210121glmSETUP.sh 210118PMR_2.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc /vgpool/data1/mcavoy/HCP/conc/glmPMR/210118PMR_2.list
#210121glmSETUP.sh 210118PMR_3.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc /vgpool/data1/mcavoy/HCP/conc/glmPMR/210118PMR_3.list
#210121glmSETUP.sh 210118PMR_4.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc /vgpool/data1/mcavoy/HCP/conc/glmPMR/210118PMR_4.list

#210122HCPcheckmovement_intercept.sh junk.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm 1.5 junk.sh 

#210122HCPcheckmovement_intercept.sh 201214resilience.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/201214resilience.sh 

#210120HCPcheckmovement_sd.sh resilienceGroup1.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup1.sh 
#210120HCPcheckmovement_sd.sh resilienceGroup2.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup2.sh 
#210120HCPcheckmovement_sd.sh resilienceGroup3.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup3.sh 

#210125HCPcheckmovement_intercept.sh 210118PMR.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glmPMR 1.5 /vgpool/data1/mcavoy/HCP/conc/glmPMR/Baseline/210118PMR.sh 
#210125HCPcheckmovement_sd_rms.sh resilienceGroup1.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup1.list
#210125HCPcheckmovement_sd_rms.sh resilienceGroup2.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup2.list
#210125HCPcheckmovement_sd_rms.sh resilienceGroup3.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/resilienceGroup3.list
#210108glm_sd.sh 210125.csv /vgpool/data1/mcavoy/HCP/conc/glm/sd /vgpool/data1/mcavoy/HCP/conc/glm/sd/210125.sh

vgp=/vgpool/data1/mcavoy
#210120HCPcheckmovement_sd.sh junk.dat $D0/HCP/sub /vgpool/data1/mcavoy/HCP/conc/glm/sd 1.5 /vgpool/data1/mcavoy/HCP/conc/glm/sd/rms/junk.sh 
#210126HCPcheckmovement_sd_rms.sh resilienceGroup1.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup1.list
#210126HCPcheckmovement_sd_rms.sh resilienceGroup2.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup2.list
#210126HCPcheckmovement_sd_rms.sh resilienceGroup3.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup3.list
#210126HCPcheckmovement_sd_rms.sh resilienceGroup1.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup1_wo_wmparc.list
#210126HCPcheckmovement_sd_rms.sh resilienceGroup2.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup2_wo_wmparc.list
#210126HCPcheckmovement_sd_rms.sh resilienceGroup3.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sd ${vgp}/HCP/conc/glm/sd/rms 1.5 ${vgp}/HCP/conc/glm/sd/rms/resilienceGroup3_wo_wmparc.list

#210108glm_sd.sh $vgp/HCP/conc/glmPMR/PMR.csv $vgp/HCP/conc/glmPMR/sd $vgp/HCP/conc/glmPMR/sd/210128.sh

#210126HCPcheckmovement_sd_rms.sh 201214resilience.dat $D0/HCP/sub ${vgp}/HCP/conc/glm/sdGSR ${vgp}/HCP/conc/glm/sdGSR/rms 1.5 ${vgp}/HCP/conc/glm/sdGSR/rms/201214resilience.list
#210203HCPcheckmovement_sd_rms_glm.sh 201214resilience.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/sdGSR ${vgp}/HCP/conc/glm/sdGSR/rms 1.5 ${vgp}/HCP/conc/glm/sdGSR/rms/201214resilience.list 210203.list
#210203glm_sd.sh $vgp/HCP/conc/glmPMR/PMR.csv $vgp/HCP/conc/glmPMR/sd /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun164.dat $vgp/HCP/conc/glmPMR/sd/210203.sh
#210203glm_sd.sh 210203.list $vgp/HCP/conc/glm/sdGSR_1 /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdGSR_1/210203.sh

#210204HCPcheckmovement_masknorm.sh 201214resilience.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/Baseline 1.5 ${vgp}/HCP/conc/glm/Baseline/masknorm/210204.sh 210204.list
#210204HCPcheckmovement_sd_rms_glm.sh resilienceGroup1.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/Baseline ${vgp}/HCP/conc/glm/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glm/Baseline/masknorm/resilienceGroup1.list 210204_1.list MEAN
#210204HCPcheckmovement_sd_rms_glm.sh resilienceGroup2.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/Baseline ${vgp}/HCP/conc/glm/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glm/Baseline/masknorm/resilienceGroup2.list 210204_2.list MEAN
#210204HCPcheckmovement_sd_rms_glm.sh resilienceGroup3.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/Baseline ${vgp}/HCP/conc/glm/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glm/Baseline/masknorm/resilienceGroup3.list 210204_3.list MEAN

#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_01.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_01.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_02.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_02.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_03.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_03.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_04.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_04.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_05.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_05.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_06.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_06.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_07.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_07.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_08.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_08.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_09.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_09.sh
#210207glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_10.list $D0/HCP/sub $vgp/HCP/conc/glm/sdreg /data/nil-bluearc/vlassenko/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdreg/210207_10.sh
#210204HCPcheckmovement_sd_rms_glm.sh 201214resilience.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/sdGSR ${vgp}/HCP/conc/glm/sdGSR/rms 1.5 210207.list 210207glm.list SD 

#210208PMRgroup.sh 210118PMR.dat ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm210208vlasfold.csv 210118PMR.csv 
#210208HCPcheckmovement_masknorm.sh 210118PMR.dat $D0/HCP/sub ${vgp}/HCP/conc/glmPMR ${vgp}/HCP/conc/glmPMR/Baseline 1.5 ${vgp}/HCP/conc/glmPMR/Baseline/masknorm/210208.sh 210208.list

#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210118PMRgroup1.csv 210118PMRgroup1.dat
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210118PMRgroup2.csv 210118PMRgroup2.dat
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210118PMRgroup3.csv 210118PMRgroup3.dat
#210204HCPcheckmovement_sd_rms_glm.sh 210118PMRgroup1.dat $D0/HCP/sub ${vgp}/HCP/conc/glmPMR ${vgp}/HCP/conc/glmPMR/Baseline ${vgp}/HCP/conc/glmPMR/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glmPMR/Baseline/masknorm/210118PMRgroup1.list 210209_1.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210118PMRgroup2.dat $D0/HCP/sub ${vgp}/HCP/conc/glmPMR ${vgp}/HCP/conc/glmPMR/Baseline ${vgp}/HCP/conc/glmPMR/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glmPMR/Baseline/masknorm/210118PMRgroup2.list 210209_2.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210118PMRgroup3.dat $D0/HCP/sub ${vgp}/HCP/conc/glmPMR ${vgp}/HCP/conc/glmPMR/Baseline ${vgp}/HCP/conc/glmPMR/Baseline/masknorm 1.5 ${vgp}/HCP/conc/glmPMR/Baseline/masknorm/210118PMRgroup3.list 210209_3.list MEAN 

#210204HCPcheckmovement_sd_rms_glm.sh 201214resilience.dat $D0/HCP/sub ${vgp}/HCP/conc/glm ${vgp}/HCP/conc/glm/sdGSR ${vgp}/HCP/conc/glm/sdGSR/rms 1.5 210210.list 210210glm.list SD 
#210210ageamyloid.sh all_data_2021_01_21.csv ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm210210.csv 210210.csv

#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210118PMRgroup2.csv 210118PMRgroup2.dat
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210118PMRgroup1.csv 210118PMRgroup1.dat

#190917cpMAN.sh 20222b.csv $D0/HCP/sub $D0/MAN/mcavoy
#210222resilienceGroup.sh 201214resilience.dat ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm210210.csv 210222resilienceGroup.csv
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroup0.csv 210222resilienceGroup0.dat 
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroup1.csv 210222resilienceGroup1.dat 
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroup2.csv 210222resilienceGroup2.dat 
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroup3.csv 210222resilienceGroup3.dat 
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroup3Non-AD.csv 210222resilienceGroup3Non-AD.dat
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210222resilienceGroupNotAssigned.csv 210222resilienceGroupNotAssigned.dat 
vgp0=${vgp}/HCP/conc/glm
#210208HCPcheckmovement_masknorm.sh 210222.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline 1.5 ${vgp0}/Baseline/masknorm/210222.sh 210222.list
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroup0.list 210222resilienceGroup0glm.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroup1.list 210222resilienceGroup1glm.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroup2.list 210222resilienceGroup2glm.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroup3.list 210222resilienceGroup3glm.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroup3Non-AD.list 210222resilienceGroup3Non-ADglm.list MEAN 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/Baseline/masknorm 1.5 ${vgp0}/Baseline/masknorm/210222resilienceGroupNotAssigned.list 210222resilienceGroupNotAssignedglm.list MEAN 

vgp0=${vgp}/HCP/conc/glm
#210204HCPcheckmovement_sd_rms_glm.sh 210223resilience.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 210223.list 210223glm.list SD 
#210120HCPcheckmovement_sd.sh 210223resilience.dat $D0/HCP/sub ${vgp0}/sdGSR 1.5 ${vgp0}/sdGSR/rms/210223.sh 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroup0.list junk.list SD 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroup1.list junk.list SD 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroup2.list junk.list SD 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroup3.list junk.list SD 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroup3Non-AD.list junk.list SD 
#210204HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdGSR ${vgp0}/sdGSR/rms 1.5 ${vgp0}/sdGSR/rms/210222resilienceGroupNotAssigned.list junk.list SD 

#210204HCPcheckmovement_sd_rms_glm.sh 210223resilience.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 210224.list 210224glm.list SD 
#210224HCPcheckmovement_sd.sh 210223resilience.dat $D0/HCP/sub ${vgp0}/sdreg 1.5 ${vgp0}/sdreg/rms/210224.sh SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroup0.list junk.list SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroup1.list junk.list SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroup2.list junk.list SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroup3.list junk.list SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroup3Non-AD.list junk.list SDREG
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdreg ${vgp0}/sdreg/rms 1.5 ${vgp0}/sdreg/rms/210222resilienceGroupNotAssigned.list junk.list SDREG

vlasmri=/data/nil-bluearc/vlassenko/RAW_IMAGES/MRI
#201222MRISETUP.sh 210225.csv $vlasmri 210225.dat
#200902dcm2niix.sh 210225.dat $vlasmri $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210225.sh
#200821HCPstructpipeSETUPuseMRI.sh 210225.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210225.sh $D0/mcavoy/HCP/nii

#201222MRISETUP.sh 210226.csv $vlasmri 210226.dat
#200902dcm2niix.sh 210226.dat $vlasmri $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210226.sh
#200821HCPstructpipeSETUPuseMRI.sh 210226.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210226.sh $D0/mcavoy/HCP/nii
#210226HCPstructpipeSETUPuseMRI.sh 210225b.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210225b.sh $D0/mcavoy/HCP/nii
#201223HCPfMRIpipeSETUP.sh 210225c.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210225c.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh

#210226HCPstructpipeSETUPuseMRI.sh 210301.dat $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCP $D0/mcavoy/HCP/scriptsHCP/HCP210301.sh $D0/mcavoy/HCP/nii
#201223HCPfMRIpipeSETUP.sh 210301b.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210301b.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#200301dcm2niix.sh 210301c.dat $vlasmri $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niix $D0/mcavoy/HCP/scriptsdcm2niix/210301c.sh

#201223HCPfMRIpipeSETUP.sh 210226.dat $D0/mcavoy/HCP/bold $D0/HCP/sub $D0/mcavoy/HCP/scriptsHCPbold $D0/mcavoy/HCP/scriptsHCPbold/HCP210226.sh 200917GenericfMRIVolumeProcessingPipelineBatch_mm.sh
#201205dcm2niix_setter.sh 210301c.dat $D0/RAW_IMAGES/MRI $D0/mcavoy/HCP $D0/mcavoy/HCP/scriptsdcm2niixsetterB $D0/mcavoy/HCP/scriptsdcm2niixsetterB/setter210302.sh
#201206hdr_setter.sh 210301c.dat $D0/mcavoy/HCP/nii
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_01.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_01.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_02.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_02.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_03.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_03.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_04.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_04.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_05.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_05.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_06.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_06.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_07.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_07.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_08.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_08.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_09.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_09.sh GSR
#210302glm_sdreg.sh /vgpool/data1/mcavoy/HCP/conc/glm/210207_10.list $D0/HCP/sub $vgp/HCP/conc/glm/sdregGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sdregGSR/210302_10.sh GSR
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroup0.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroup1.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroup2.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroup3.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroup3Non-AD.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210302resilienceGroupNotAssigned.list junk.list SD
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210302.csv 210302.dat 
#210203glm_sd.sh 210302.list $vgp/HCP/conc/glm/sd $D0/mcavoy/HCP/ev/onerun.dat $vgp/HCP/conc/glm/sd/210302.sh

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#210224HCPcheckmovement_sd_rms_glm.sh 210302.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 junk.list junk2.list SD

#201231HCPcheckmovement.sh $D0/mcavoy/segment/MRI_Andrei.dat $D0/HCP/sub MRI_Andrei_HCPmovement.txt
#201215maskssplit.sh 210301c.dat $D0/HCP/sub masks > 210301c.dat.txt 2>&1 &
#210118motion.sh 210301c.dat $D0/HCP/sub motion
#210224HCPcheckmovement_sd_rms_glm.sh 210302.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 junk.list junk2.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroup0.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroup1.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroup2.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroup3.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroup3Non-AD.list junk.list SD
#210224HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rms 1.5 ${vgp0}/sd/rms/210222resilienceGroupNotAssigned.list junk.list SD
#210118subsetMRI.sh $D0/mcavoy/segment/MRI_Andrei.dat 210304.csv 210304.dat 
#210224HCPcheckmovement_sd.sh 210304.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rms/210304.sh SD

#210121glmSETUP.sh 210301c.dat $D0/HCP/sub $D0/mcavoy/HCP/motion $D0/mcavoy/HCP/masks $D0/mcavoy/HCP/conc /vgpool/data1/mcavoy/HCP/conc/glm/210301c.list

vgp0=${vgp}/HCP/conc/glm
#210310glm_sd.sh 210301c.dat $vgp0/sd $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sd/210310.sh KEEPIT PARALLEL $vgp0
#210310glm_sd.sh 210301c.dat $vgp0/sdGSR $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdGSR/210310.sh GSR SERIAL $vgp0
#210310HCPcheckmovement_masknorm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310a.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310b.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310c.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310d.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310e.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/normsd/210310f.sh junk.list SD
#210310HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310a.sh NORMSD
#210310HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310b.sh NORMSD
#210310HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310c.sh NORMSD
#210310HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310d.sh NORMSD
#210310HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310e.sh NORMSD
#210310HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0}/sd/normsd 1.5 ${vgp0}/sd/normsd/rms/210310f.sh NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210309resilienceGroup0.list junk.list NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210222resilienceGroup1.list junk.list NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210222resilienceGroup2.list junk.list NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210222resilienceGroup3.list junk.list NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210222resilienceGroup3Non-AD.list junk.list NORMSD
#210310HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd/normsd ${vgp0}/sd/normsd/rms 1.5 ${vgp0}/sd/normsd/rms/210222resilienceGroupNotAssigned.list junk.list NORMSD

vgp0=${vgp}/HCP/conc/glm
#210311glm_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311a.sh KEEP SERIAL RAW $vgp0
#210311glm_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311b.sh KEEP SERIAL RAW $vgp0
#210311glm_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311c.sh KEEP SERIAL RAW $vgp0
#210311glm_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311.sh KEEP PARALLEL RAW $vgp0
#210311glm_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311e.sh KEEP SERIAL RAW $vgp0
#210311glm_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub $vgp0/sdraw $D0/mcavoy/HCP/ev/onerun.dat $vgp0/sdraw/210311f.sh KEEP SERIAL RAW $vgp0

#210125HCPcheckmovement_intercept.sh 210301c.dat $D0/HCP/sub ${vgp0} 1.5 ${vgp0}/Baseline/210301c.sh
#210319HCPcheckmovement_masknorm_div.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319.sh junk.sh INTERCEPT SPATMEAN
#210319HCPcheckmovement_masknorm_div.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319b.sh junk.sh INTERCEPT SPATMEAN
#210319HCPcheckmovement_masknorm_div.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319c.sh junk.sh INTERCEPT SPATMEAN
#210319HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319d.sh junk.sh INTERCEPT SPATMEAN
#210319HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319e.sh junk.sh INTERCEPT SPATMEAN
#210319HCPcheckmovement_masknorm_div.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/210319f.sh junk.sh INTERCEPT SPATMEAN
vgp1=${vgp0}/Baseline/masknormMARMSm
#210319HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_wmean.list junk.list WMEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_wmean.list junk.list WMEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_wmean.list junk.list WMEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_wmean.list junk.list WMEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3Non-AD.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3Non-AD_wmean.list junk.list WMEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroupNotAssigned.list junk.list MEAN 
#210319HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp1} 1.5 ${vgp1}/210222resilienceGroupNotAssigned_wmean.list junk.list WMEAN 

#210329HCPcheckmovement_masknorm_div.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329a.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329b.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329c.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329d.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329e.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalBaseline/210329f.sh junk.sh SD SPATMEAN
#210329HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329a.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329b.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329c.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329d.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329e.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
#210329HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalBaseline 1.5 ${vgp0}/sdraw/divglobalBaseline/rms/210329f.sh VOX _res_sdTR_divBaseline.nii.gz _res_sdTR_divBaseline_rms.nii.gz 
r0=_res_sdTR_divBaseline.nii.gz;r1=_res_sdTR_divBaseline_rms.nii.gz;vgp2=${vgp0}/sdraw/divglobalBaseline
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210309resilienceGroup0.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup1.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup2.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3Non-AD.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroupNotAssigned.list junk.list VOX ${r0} ${r1} 

#210310HCPcheckmovement_masknorm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330a.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330b.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330c.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330d.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330e.sh junk.list SD
#210310HCPcheckmovement_masknorm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divglobalsd/210330f.sh junk.list SD
r0=_res_eyesopen_sdTR_normsd.nii.gz;r1=_res_eyesopen_sdTR_normsd_rms.nii.gz
#210329HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330a.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330b.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330c.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330d.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330e.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0}/sdraw/divglobalsd 1.5 ${vgp0}/sdraw/divglobalsd/rms/210330f.sh VOX ${r0} ${r1} 
vgp2=${vgp0}/sdraw/divglobalsd
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210309resilienceGroup0.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup1.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup2.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3Non-AD.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroupNotAssigned.list junk.list VOX ${r0} ${r1} 

#210329HCPcheckmovement_masknorm_div.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330a.sh junk.sh SD NOSPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330b.sh junk.sh SD NOSPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330c.sh junk.sh SD NOSPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330d.sh junk.sh SD NOSPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330e.sh junk.sh SD NOSPATMEAN
#210329HCPcheckmovement_masknorm_div.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divBaseline/210330f.sh junk.sh SD NOSPATMEAN
r0=_res_sdTR_divBaseline.nii.gz;r1=_res_sdTR_divBaseline_rms.nii.gz
#210329HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330a.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330b.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330c.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330d.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330e.sh VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0}/sdraw/divBaseline 1.5 ${vgp0}/sdraw/divBaseline/rms/210330f.sh VOX ${r0} ${r1} 
vgp2=${vgp0}/sdraw/divBaseline
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210309resilienceGroup0.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup1.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup2.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroup3Non-AD.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp2} ${vgp2}/rms 1.5 ${vgp2}/rms/210222resilienceGroupNotAssigned.list junk.list VOX ${r0} ${r1} 

r0=_res_eyesopen_sdTR.nii.gz;r1=_res_sdTR
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0}/sd 1.5 ${vgp0}/sd/rWms/210331f.sh VOX ${r0} ${r1} 
r0=_res_eyesopen_sdTR.nii.gz;r1=_res_sdTR_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd ${vgp0}/sd/rWms 1.5 ${vgp0}/sd/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 
r0=_res_sdTR_divBaseline.nii.gz;r1=_res_sdTR_divBaseline;vgp1=${vgp0}/sdraw/divBaseline
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210401f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_divBaseline_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 
r1=_res_sdTR_divBaseline_rms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rms.list junk.list VOX ${r0} ${r1} 

r0=_res_sdTR_divBaseline.nii.gz;r1=_res_sdTR_divBaseline;vgp1=${vgp0}/sdraw/divglobalBaseline
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_divBaseline_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 

r0=_res_eyesopen_sdTR_normsd.nii.gz;r1=_res_sdTR_normsd;vgp1=${vgp0}/sd/normsd
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_normsd_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 

r0=_res_eyesopen_sdTR_normsd.nii.gz;r1=_res_sdTR_normsd;vgp1=${vgp0}/sdraw/divglobalsd
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210402f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_normsd_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 

r0=_res_eyesopen_sdTR.nii.gz;r1=_res_sdTR
#210406HCPcheckmovement_masknorm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310a.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310b.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310c.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310d.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310e.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sd 1.5 ${vgp0}/sd/divRMSsd/210310f.sh junk.list SD ${r0} ${r1}
r0=_res_sdTR_rms.nii.gz;r1=_res_sdTR_rms;vgp1=${vgp0}/sd/divRMSsd
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_rms_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 

r0=_res_eyesopen_sdTR.nii.gz;r1=_res_sdTR
#210406HCPcheckmovement_masknorm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406a.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406b.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406c.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406d.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406e.sh junk.list SD ${r0} ${r1}
#210406HCPcheckmovement_masknorm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp0}/sdraw 1.5 ${vgp0}/sdraw/divRMSsd/210406f.sh junk.list SD ${r0} ${r1}
r0=_res_sdTR_rms.nii.gz;r1=_res_sdTR_rms;vgp1=${vgp0}/sdraw/divRMSsd
#210331HCPcheckmovement_sd.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406a.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406b.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406c.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406d.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406e.sh VOX ${r0} ${r1} 
#210331HCPcheckmovement_sd.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp1} 1.5 ${vgp1}/rWms/210406f.sh VOX ${r0} ${r1} 
r1=_res_sdTR_rms_rWms.nii.gz
#210329HCPcheckmovement_sd_rms_glm.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210309resilienceGroup0_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup1_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup2_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroup3Non-AD.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroup3Non-AD_rWms.list junk.list VOX ${r0} ${r1} 
#210329HCPcheckmovement_sd_rms_glm.sh 210222resilienceGroupNotAssigned.dat $D0/HCP/sub ${vgp0} ${vgp1} ${vgp1}/rWms 1.5 ${vgp1}/rWms/210222resilienceGroupNotAssigned_rWms.list junk.list VOX ${r0} ${r1} 

vgp0=${vgp}/HCP/conc/glm
vgp1=${vgp}/HCP/PET
#r0=NONE;r1="_ho.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_ho.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_ho.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_ho.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_ho.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_fdg.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_fdg.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_fdg.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_fdg.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_fdg.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_gi.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_gi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_gi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_gi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_gi.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_oc.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_oc.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_oc.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_oc.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_oc.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_ogi.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_ogi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_ogi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_ogi.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_ogi.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_om.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_om.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_om.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_om.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_om.list junk.list REG ${r0} ${r1}
#r0=NONE;r1="_oo.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_oo.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_oo.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_oo.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_oo.list junk.list REG ${r0} ${r1}

r0="_ho.nii.gz";r1="_om.nii.gz";r2="oef"
#210415HCPcheckmovement_masknorm_div.sh 210309resilienceGroup0.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/oef/210309resilienceGroup0_oef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup1.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/oef/210222resilienceGroup1_oef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup2.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/oef/210222resilienceGroup2_oef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/oef/210222resilienceGroup3_oef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#vgp1=${vgp}/HCP/PET/oef
#r0=NONE;r1="_oef.nii.gz"
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210309resilienceGroup0.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_oef.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup1.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_oef.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup2.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_oef.list junk.list REG ${r0} ${r1}
#210414HCPcheckmovement_sd_rms_glm_PET.sh 210222resilienceGroup3.dat NONE ${vgp0} NONE ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_oef.list junk.list REG ${r0} ${r1}

vgp1=${vgp}/HCP/PET/oef
r0=NONE;r1="_oef.nii.gz"
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster
#210428HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_cluster.sh junk.list VOX ${r0} ${r1}
#210428HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_cluster.sh junk.list VOX ${r0} ${r1}
#210428HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_cluster.sh junk.list VOX ${r0} ${r1}
#210428HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_cluster.sh junk.list VOX ${r0} ${r1}

vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427young.list
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427young.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427young.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427young.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427young.sh junk.list VOX ${r0} ${r1} ${c0}
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyold.list
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427healthyold.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427healthyold.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427healthyold.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427healthyold.sh junk.list VOX ${r0} ${r1} ${c0}
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloid.list
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427amyloid.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427amyloid.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427amyloid.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427amyloid.sh junk.list VOX ${r0} ${r1} ${c0}
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomatic.list
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427symptomatic.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427symptomatic.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427symptomatic.sh junk.list VOX ${r0} ${r1} ${c0}
#210504HCPcheckmovement_sd_rms_glm_PET_cluster.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427symptomatic.sh junk.list VOX ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427young.list
#210505HCPcheckmovement_sd_rms_glm_PET_cluster_txt.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427young.sh junk.list TXT ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427youngLUT.txt
r0=210427young;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427young.sh conc/210222resilienceGroup3_210427young.conc TC ${r0} ${r1} ${c0}


vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyold.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427healthyold.sh junk.list TXT ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyoldLUT.txt
r0=210427healthyold;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427healthyold.sh conc/210222resilienceGroup3_210427healthyold.conc TC ${r0} ${r1} ${c0}


vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloid.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427amyloid.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloidLUT.txt
r0=210427amyloid;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427amyloid.sh conc/210222resilienceGroup3_210427amyloid.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomatic.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427symptomatic.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomaticLUT.txt
r0=210427symptomatic;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_210427symptomatic.sh conc/210222resilienceGroup3_210427symptomatic.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloid.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427amyloid.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloidLUT.txt
r0=210427amyloid;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427amyloid.sh conc/210309resilienceGroup0_210427amyloid.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427young.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427young.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427youngLUT.txt
r0=210427young;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427young.sh conc/210309resilienceGroup0_210427young.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyold.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427healthyold.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyoldLUT.txt
r0=210427healthyold;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427healthyold.sh conc/210309resilienceGroup0_210427healthyold.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomatic.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427symptomatic.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomaticLUT.txt
r0=210427symptomatic;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_210427symptomatic.sh conc/210309resilienceGroup0_210427symptomatic.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427young.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427young.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427youngLUT.txt
r0=210427young;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427young.sh conc/210222resilienceGroup1_210427young.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyold.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427healthyold.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyoldLUT.txt
r0=210427healthyold;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427healthyold.sh conc/210222resilienceGroup1_210427healthyold.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloid.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427amyloid.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloidLUT.txt
r0=210427amyloid;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427amyloid.sh conc/210222resilienceGroup1_210427amyloid.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomatic.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427symptomatic.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomaticLUT.txt
r0=210427symptomatic;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_210427symptomatic.sh conc/210222resilienceGroup1_210427symptomatic.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427young.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427young.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427youngLUT.txt
r0=210427young;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427young.sh conc/210222resilienceGroup2_210427young.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyold.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427healthyold.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427healthyoldLUT.txt
r0=210427healthyold;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427healthyold.sh conc/210222resilienceGroup2_210427healthyold.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloid.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427amyloid.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427amyloidLUT.txt
r0=210427amyloid;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427amyloid.sh conc/210222resilienceGroup2_210427amyloid.conc TC ${r0} ${r1} ${c0}

vgp1=${vgp}/HCP/PET
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/PET
r0=NONE;r1=NONE;c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomatic.list
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427symptomatic.sh junk.list TXT ${r0} ${r1} ${c0}
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/clusters/tc
c0=/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/cluster/210427symptomaticLUT.txt
r0=210427symptomatic;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${vgp0}/Baseline/masknormMARMSm/cluster/clusters
#210506HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_210427symptomatic.sh conc/210222resilienceGroup2_210427symptomatic.conc TC ${r0} ${r1} ${c0}


vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=dummy
#210513HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3.sh 210222resilienceGroup3 TC2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=dummy
#superbird=210309resilienceGroup0
#superbird=210222resilienceGroup1
superbird=210222resilienceGroup2
#210513HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2.sh ${superbird}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${superbird}.sh ${superbird} TC2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
#superbird=210309resilienceGroup0;vgp4="fdg0,ho0,om0"
#superbird=210222resilienceGroup1;vgp4="fdg1,ho1,om1"
#superbird=210222resilienceGroup2;vgp4="fdg2,ho2,om2"
#superbird=210222resilienceGroup3;vgp4="fdg3,ho3,om3"
#210517HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2.sh ${superbird}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${superbird}.sh ${superbird} TXT2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2/combined/age
c0=VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
#vgp4="age0";superbird=210309resilienceGroup0
#vgp4="age1";superbird=210222resilienceGroup1
#vgp4="age2";superbird=210222resilienceGroup2
#vgp4="age3";superbird=210222resilienceGroup3
#210517HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh ${superbird}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${superbird}_age.dat ${superbird} AGE ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2/combined/ext
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_block
superbird=fidl_block
#210518HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh NONE ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/${superbird}.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age.list
vgp5=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2/combined/ext
#210519HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh CONC ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/all.list ${vgp5} TXT2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc/glm/Ftest
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age.list
vgp5=${vgp0}/Baseline/masknormMARMSm/cluster/reg/PET2/combined/ext
#210519HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh SHORT ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/all_short.txt ${vgp5} TXT2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc/glm
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc/glm/tc
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_avg_zstat3
#210520HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh PETTC ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/fidl_avg_zstat3.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}

vgp1=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc/glm/tc
vgp2=${vgp0}/Baseline/masknormMARMSm/cluster/reg/tc/conc/glm/tc/plot2
c0=roinames.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=plot.list
vgp4=age.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_avg_zstat3
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh PLOT ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/pet95CI.txt ${vgp5} TXT2 ${r0} ${r1} ${c0}


elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
r0=NONE;r1="_oef.nii.gz"
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters
superbird=young_agecorrect
c0=$elephantpool/${superbird}.list
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
superbird=old_agecorrect
c0=$elephantpool/${superbird}.list
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
superbird=symptomatic_agecorrect
c0=$elephantpool/${superbird}.list
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
superbird=Right-Hippocampus_agecorrect
c0=$elephantpool/${superbird}.list
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210309resilienceGroup0.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210309resilienceGroup0_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup1.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup1_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup2.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup2_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}
#210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh 210222resilienceGroup3.dat $D0/HCP/sub ${vgp0} NONE ${vgp1} 1.5 ${vgp2}/210222resilienceGroup3_${superbird}.sh junk.list VOX ${r0} ${r1} ${c0}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET
r0=NONE;r1=NONE
superbird=(young_agecorrect old_agecorrect symptomatic_agecorrect Right-Hippocampus_agecorrect)
lovepirate=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=("fdg0,ho0,om0" "fdg1,ho1,om1" "fdg2,ho2,om2" "fdg3,ho3,om3")
#for((i=0;i<${#superbird[@]};++i));do
#    for((j=0;j<${#lovepirate[@]};++j));do
#        c0=$elephantpool/${superbird[i]}.list
#        210525HCPcheckmovement.sh ${lovepirate[j]}.dat $D0/HCP/sub ${vgp4[j]} NONE ${vgp1} 1.5 ${vgp2}/${lovepirate[j]}_${superbird[i]}.sh ${lovepirate[j]} TXT ${r0} ${r1} ${c0}
#    done
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${elephantpool}/clusters/tc
r1=_Baseline_normB_wmean.nii.gz;
superbird=(young_agecorrect old_agecorrect symptomatic_agecorrect Right-Hippocampus_agecorrect)
lovepirate=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp3=${vgp}/HCP/PET
vgp4=${elephantpool}/clusters
#for((i=0;i<${#superbird[@]};++i));do
#    r0=${superbird[i]}
#    c0=$elephantpool/${superbird[i]}LUT.txt
#    for((j=0;j<${#lovepirate[@]};++j));do
#        210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh ${lovepirate[j]}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${lovepirate[j]}_${superbird[i]}.sh conc/${lovepirate[j]}_${superbird[i]}.conc TC ${r0} ${r1} ${c0}
#    done
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=$elephantpool/clusters/PET/combined/age
c0=VGLabAgingDementia-MRIAges_DATA_2021-05-17_0834.csv
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=("age0" "age1" "age2" "age3")
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
#for((i=0;i<${#superbird[@]};++i));do
#    210525HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4[i]} ${vgp3} ${vgp1} 1.5 ${vgp2}/${superbird[i]}_age.dat ${superbird[i]} AGE ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=$elephantpool/clusters/PET
vgp2=$elephantpool/clusters/PET/combined/ext
c0=cluster_agecorrect_names_list.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age_agecorrect.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_block
superbird=fidl_block
#210525HCPcheckmovement.sh NONE ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/${superbird}.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=$elephantpool/clusters/PET/combined/glm
vgp2=$elephantpool/clusters/PET/combined/glm/tc
c0=cluster_agecorrect_names_list.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age_agecorrect.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_avg_zstat3
#210525HCPcheckmovement.sh PETTC ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/fidl_avg_zstat3.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=$elephantpool/clusters/PET/combined/glm/tc
vgp2=$elephantpool/clusters/PET/combined/glm/tc/plot
c0=cluster_agecorrect_names_list.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=plot.list
vgp4=age_agecorrect.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_avg_zstat3
#210525HCPcheckmovement.sh PLOT ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/pet95CI.txt ${vgp5} TXT2 ${r0} ${r1} ${c0}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=cluster_agecorrect.list
c0=agecorrect
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
#for((i=0;i<${#superbird[@]};++i));do
#    210526HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} NONE ${vgp1} 1.5 ${vgp2}/${superbird[i]}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=agecorrect
#for((i=0;i<${#superbird[@]};++i));do
#    210526HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} NONE ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp0}/Baseline/masknormMARMSm
vgp2=${elephantpool}/clusters/tc/tcplot
r1=_Baseline_normB_wmean.nii.gz;
vgp3=${vgp}/HCP/PET
vgp4=${elephantpool}/clusters
superbird=(young_agecorrect old_agecorrect symptomatic_agecorrect Right-Hippocampus_agecorrect)
lovepirate=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp5=(0_group 1_group 2_group 3_group)
#for((i=0;i<${#superbird[@]};++i));do
#    r0=${superbird[i]}
#    c0=$elephantpool/${superbird[i]}LUT.txt
#    for((j=0;j<${#lovepirate[@]};++j));do
#        210527HCPcheckmovement.sh ${lovepirate[j]}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${lovepirate[j]}_${superbird[i]}.sh ${vgp5[j]} TC3 ${r0} ${r1} ${c0}
#    done
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=cluster_agecorrect.list
c0=agecorrect
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
#for((i=0;i<${#superbird[@]};++i));do
#    210528HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} oef,ogi ${vgp1} 1.5 ${vgp2}/${superbird[i]}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=agecorrect
#for((i=0;i<${#superbird[@]};++i));do
#    210528HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} oef,ogi ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

vgp0=${vgp}/HCP/conc/glm
vgp1=${vgp}/HCP/PET
r0="_ho.nii.gz";r1="_fdg.nii.gz";r2="gef"
#210415HCPcheckmovement_masknorm_div.sh 210309resilienceGroup0.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/210309resilienceGroup0_gef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup1.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/210222resilienceGroup1_gef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup2.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/210222resilienceGroup2_gef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}
#210415HCPcheckmovement_masknorm_div.sh 210222resilienceGroup3.dat NONE ${vgp0} ${vgp1} ${vgp1} 1.5 ${vgp1}/210222resilienceGroup3_gef.sh junk.list SD NOSPATMEAN ${r0} ${r1} ${r2}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=cluster_agecorrect.list
c0=agecorrect
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
#for((i=0;i<${#superbird[@]};++i));do
#    210528HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} gi,gef ${vgp1} 1.5 ${vgp2}/${superbird[i]}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=agecorrect
#for((i=0;i<${#superbird[@]};++i));do
#    210528HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} gi,gef ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET2
r0=NONE;r1=NONE
superbird=(young_agecorrect old_agecorrect symptomatic_agecorrect Right-Hippocampus_agecorrect)
lovepirate=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=("oef0,ogi0" "oef1,ogi1" "oef2,ogi2" "oef3,ogi3")
#for((i=0;i<${#superbird[@]};++i));do
#    for((j=0;j<${#lovepirate[@]};++j));do
#        c0=$elephantpool/${superbird[i]}.list
#        210528HCPcheckmovement.sh ${lovepirate[j]}.dat $D0/HCP/sub ${vgp4[j]} oef,ogi ${vgp1} 1.5 ${vgp2}/${lovepirate[j]}_${superbird[i]}.sh ${lovepirate[j]} TXT ${r0} ${r1} ${c0}
#    done
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=$elephantpool/clusters/PET/oef_ogi
vgp2=$elephantpool/clusters/PET/oef_ogi/combined/ext
c0=cluster_agecorrect_names_list.list
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp3=group.list
vgp4=age_agecorrect.list
vgp5=/home/usr/mcavoy/FIDL/build/fidl_block
superbird=fidl_block
#210525HCPcheckmovement.sh NONE ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/${superbird}.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}
#210528HCPcheckmovement.sh NONE ${vgp1} ${vgp3} ${vgp4} ${vgp2} 1.5 ${vgp2}/${superbird}.sh ${vgp5} TXT2 ${r0} ${r1} ${c0}

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=Lhippo.list
c0=Left-Hippocampus
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
pet=fdg,ho,om
#for((i=0;i<${#superbird[@]};++i));do
#    210528HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} ${pet} ${vgp1} 1.5 ${vgp2}/${superbird[i]}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=Left-Hippocampus
pet=fdg,ho,om
#for((i=0;i<${#superbird[@]};++i));do
#    210702HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} ${pet} ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done
elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=agecorrect
pet=fdg,ho,om
#for((i=0;i<${#superbird[@]};++i));do
#    210702HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} ${pet} ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=157.list
c0=157
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
pet=fdg,ho,om
date0=$(date +%y%m%d%H%M%S)
#for((i=0;i<${#superbird[@]};++i));do
#    210702HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} ${pet} ${vgp1} 1.5 ${vgp2}/${superbird[i]}_${date0}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done
elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=157
pet=fdg,ho,om
#for((i=0;i<${#superbird[@]};++i));do
#    210702HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} ${pet} ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
vgp4=cortex.list
c0=cortex
vgp5=/home/usr/mcavoy/FIDL/build/fidl_lut_cluster_PET2
pet=fdg,ho,om
date0=$(date +%y%m%d%H%M%S)
#for((i=0;i<${#superbird[@]};++i));do
#    210706HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} ${pet} ${vgp1} 1.5 ${vgp2}/${superbird[i]}_${date0}.sh ${vgp5} PETSTACK ${r0} ${r1} ${c0}
#done
elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=${vgp}/HCP/PET
vgp2=$elephantpool/clusters/PET/nii
r0=NONE;r1=NONE
superbird=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
c0=cortex
pet=fdg,ho,om
#for((i=0;i<${#superbird[@]};++i));do
#    210706HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp2} ${pet} ${vgp1} 1.5 ${vgp2}/conc ${superbird[i]} PETSTACKCONC ${r0} ${r1} ${c0}
#done

r0=_Baseline_unscaled.nii.gz;r1=NONE;r2=_Baseline_normB
vgp0=${vgp}/HCP/conc/glmPMR
superbird=(210118PMRgroup1 210118PMRgroup2 210118PMRgroup3)
#for((i=0;i<${#superbird[@]};++i));do
#    210709HCPcheckmovement_masknorm_div.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp0} ${vgp0}/Baseline NONE 1.5 ${vgp0}/Baseline/masknormMARMSm/${superbird[i]}.sh junk.list INTERCEPT SPATMEAN ${r0} ${r1} ${r2}
#done

vgp1=/vgpool/data1/mcavoy/HCP/conc/glmPMR/Baseline/masknormMARMSm
c0=210709age.csv
r0=NONE;r1=_Baseline_normB_wmean.nii.gz;
vgp4=("age1" "age2" "age3")
superbird=(210118PMRgroup1 210118PMRgroup2 210118PMRgroup3)
#for((i=0;i<${#superbird[@]};++i));do
#    210709HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4[i]} ${vgp1} ${vgp1} 1.5 ${vgp1}/${superbird[i]}_age.dat ${vgp1}/${superbird[i]}.list AGE2 ${r0} ${r1} ${c0}
#done

elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
vgp1=/vgpool/data1/mcavoy/HCP/conc/glmPMR/Baseline/masknormMARMSm
vgp2=/vgpool/data1/mcavoy/HCP/conc/glmPMR/Baseline/masknormMARMSm/glm_coding10/conc
r1=_Baseline_normB_wmean.nii.gz;c0=/usr/local/pkg/freesurfer6.0/FreeSurferColorLUT.txt
superbird=(210118PMRgroup1 210118PMRgroup2 210118PMRgroup3)
vgp3=dummy
vgp4=dummy
for((i=0;i<${#superbird[@]};++i));do
    r0=${superbird[i]}
    210709HCPcheckmovement.sh ${superbird[i]}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${superbird[i]}.sh ${vgp2}/${superbird[i]}.conc TC4 ${r0} ${r1} ${c0}
done

#elephantpool=${vgp0}/Baseline/masknormMARMSm/cluster_agecorrect
#vgp1=${vgp0}/Baseline/masknormMARMSm
#vgp2=${elephantpool}/clusters/tc
#r1=_Baseline_normB_wmean.nii.gz;
#superbird=(young_agecorrect old_agecorrect symptomatic_agecorrect Right-Hippocampus_agecorrect)
#lovepirate=(210309resilienceGroup0 210222resilienceGroup1 210222resilienceGroup2 210222resilienceGroup3)
#vgp3=${vgp}/HCP/PET
#vgp4=${elephantpool}/clusters
##for((i=0;i<${#superbird[@]};++i));do
##    r0=${superbird[i]}
##    c0=$elephantpool/${superbird[i]}LUT.txt
##    for((j=0;j<${#lovepirate[@]};++j));do
##        210521HCPcheckmovement_sd_rms_glm_PET_cluster_txt_tc2_age.sh ${lovepirate[j]}.dat $D0/HCP/sub ${vgp4} ${vgp3} ${vgp1} 1.5 ${vgp2}/${lovepirate[j]}_${superbird[i]}.sh conc/${lovepirate[j]}_${superbird[i]}.conc TC ${r0} ${r1} ${c0}
##    done
##done

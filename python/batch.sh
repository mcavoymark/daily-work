#!/bin/bash


##/usr/bin/env bash 

#code/220317.py -h
#echo ''

#code/220317.py --help
#echo ''

#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="210812RES1_PET.dat 210812RES2edit_PET.dat 210812RES3_PET.dat"
#code/220317.py --csv $csv --dat $dat

#code/220318.py -h

#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="210812RES1_PET.dat 210812RES2edit_PET.dat 210812RES3_PET.dat"
##code/220318.py --csv $csv --dat $dat --sex 210812RESedit_PETg123mf_sex.dat
#code/sepGroupsBySex.py --csv $csv --dat $dat --sex 210812RESedit_PETg123mf_sex.dat

#f="210812RESedit_PETmfg123_age.ext 210812RESedit_PETg123mf_sex.ext"
#code/catFilesHorz.py -f $f -o 210812RESedit_PETmfg123_ageSexcov.ext


#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="220217RES1.dat 220217RES2.dat 220217RES3.dat"
#sex=220217RESg123mf_sex.dat
#code/sepGroupsBySex.py --csv $csv --dat $dat --sex $sex 
#echo sexcov > 220217RESg123mf_sex.ext; cat 220217RESg123mf_sex.dat >> 220217RESg123mf_sex.ext
#echo age1 > 220217RES1mf_age.ext; cat 220217RES1m_age.dat 220217RES1f_age.dat >> 220217RES1mf_age.ext
#echo age2 > 220217RES2mf_age.ext; cat 220217RES2m_age.dat 220217RES2f_age.dat >> 220217RES2mf_age.ext
#echo age3 > 220217RES3mf_age.ext; cat 220217RES3m_age.dat 220217RES3f_age.dat >> 220217RES3mf_age.ext
#/home/usr/mcavoy/FIDL/build/fidl_block -age 220217RES1mf_age.ext 220217RES2mf_age.ext 220217RES3mf_age.ext -grouplabels g1 g2 g3 -out 220217RESg123mf_groupAge.ext
#f="220217RESg123mf_groupAge.ext 220217RESg123mf_sex.ext"
#o=220217RESg123mf_groupAgeSexcov.ext
#code/catFilesHorz.py -f $f -o $o 
 

#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="220217PMR1.dat 220217PMR2.dat 220217PMR3.dat"
#sex=220217PMRg123mf_sex.dat
#code/sepGroupsBySex.py --csv $csv --dat $dat --sex $sex 
#echo sexcov > 220217PMRg123mf_sex.ext; cat 220217PMRg123mf_sex.dat >> 220217PMRg123mf_sex.ext
#echo age1 > 220217PMR1mf_age.ext; cat 220217PMR1m_age.dat 220217PMR1f_age.dat >> 220217PMR1mf_age.ext
#echo age2 > 220217PMR2mf_age.ext; cat 220217PMR2m_age.dat 220217PMR2f_age.dat >> 220217PMR2mf_age.ext
#echo age3 > 220217PMR3mf_age.ext; cat 220217PMR3m_age.dat 220217PMR3f_age.dat >> 220217PMR3mf_age.ext
#/home/usr/mcavoy/FIDL/build/fidl_block -age 220217PMR1mf_age.ext 220217PMR2mf_age.ext 220217PMR3mf_age.ext -grouplabels g1 g2 g3 -out 220217PMRg123mf_groupAge.ext
#f="220217PMRg123mf_groupAge.ext 220217PMRg123mf_sex.ext"
#o=220217PMRg123mf_groupAgeSexcov.ext
#code/catFilesHorz.py -f $f -o $o 


#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="220217RES1_WMH.dat 220217RES2_WMH.dat 220217RES3_WMH.dat"
#sex=220217RESWMHg123mf_sex.dat
#code/sepGroupsBySex.py --csv $csv --dat $dat --sex $sex --sexall --age0

#files=(220217RES1_WMHm.dat 220217RES1_WMHf.dat 220217RES2_WMHm.dat 220217RES2_WMHf.dat 220217RES3_WMHm.dat 220217RES3_WMHf.dat)
#for i in ${files[@]};do
#    echo "$i $(cat $i | wc -l)"
#done

#cp /data/nil-bluearc/vlassenko/mcavoy/HCP/220217RES1_WMHmf.csv .
#cp /data/nil-bluearc/vlassenko/mcavoy/HCP/220217RES2_WMHmf.csv .
#cp /data/nil-bluearc/vlassenko/mcavoy/HCP/220217RES3_WMHmf.csv .

#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 220217RES1_WMHmf.csv -txt
#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 220217RES2_WMHmf.csv -txt
#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 220217RES3_WMHmf.csv -txt

#echo wmh > 220217RES1_WMHmf.ext; cat 220217RES1_WMHmf.txt >> 220217RES1_WMHmf.ext
#echo wmh > 220217RES2_WMHmf.ext; cat 220217RES2_WMHmf.txt >> 220217RES2_WMHmf.ext
#echo wmh > 220217RES3_WMHmf.ext; cat 220217RES3_WMHmf.txt >> 220217RES3_WMHmf.ext

#echo age > 220217RES1_WMHmf_age0.ext; cat 220217RES1_WMHmf_age0.dat >> 220217RES1_WMHmf_age0.ext
#echo age > 220217RES2_WMHmf_age0.ext; cat 220217RES2_WMHmf_age0.dat >> 220217RES2_WMHmf_age0.ext
#echo age > 220217RES3_WMHmf_age0.ext; cat 220217RES3_WMHmf_age0.dat >> 220217RES3_WMHmf_age0.ext

#echo sex > 220217RES1_WMHmf_sex0.ext; cat 220217RES1_WMHmf_sex0.dat >> 220217RES1_WMHmf_sex0.ext
#echo sex > 220217RES2_WMHmf_sex0.ext; cat 220217RES2_WMHmf_sex0.dat >> 220217RES2_WMHmf_sex0.ext
#echo sex > 220217RES3_WMHmf_sex0.ext; cat 220217RES3_WMHmf_sex0.dat >> 220217RES3_WMHmf_sex0.ext

#f="220217RES1_WMHmf.ext 220217RES1_WMHmf_age0.ext 220217RES1_WMHmf_sex0.ext"
#o=220217RES1mf_wmhAge0Sex0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf.ext 220217RES2_WMHmf_age0.ext 220217RES2_WMHmf_sex0.ext"
#o=220217RES2mf_wmhAge0Sex0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES3_WMHmf.ext 220217RES3_WMHmf_age0.ext 220217RES3_WMHmf_sex0.ext"
#o=220217RES3mf_wmhAge0Sex0.ext
#code/catFilesHorz.py -f $f -o $o 


#echo age1 > 220217RES1_WMHmf_age.ext; cat 220217RES1_WMHm_age.dat 220217RES1_WMHf_age.dat >> 220217RES1_WMHmf_age.ext 
#echo age2 > 220217RES2_WMHmf_age.ext; cat 220217RES2_WMHm_age.dat 220217RES2_WMHf_age.dat >> 220217RES2_WMHmf_age.ext 
#echo age3 > 220217RES3_WMHmf_age.ext; cat 220217RES3_WMHm_age.dat 220217RES3_WMHf_age.dat >> 220217RES3_WMHmf_age.ext 
#/home/usr/mcavoy/FIDL/build/fidl_block -age 220217RES1_WMHmf_age.ext 220217RES2_WMHmf_age.ext 220217RES3_WMHmf_age.ext -grouplabels g1 g2 g3 -out 220217RESWMHg123mf_groupAge.ext
#echo sexcov > 220217RESWMHg123mf_sex.ext; cat 220217RESWMHg123mf_sex.dat >> 220217RESWMHg123mf_sex.ext
#f="220217RESWMHg123mf_groupAge.ext 220217RESWMHg123mf_sex.ext"
#o=220217RESWMHg123mf_groupAgeSex.ext
#code/catFilesHorz.py -f $f -o $o 

#/home/usr/mcavoy/FIDL/build/fidl_block -age 220217RES1_WMHmf.ext 220217RES2_WMHmf.ext 220217RES3_WMHmf.ext -out 220217RESg123_WMHmf.ext 
#f="220217RESWMHg123mf_groupAgeSex.ext 220217RESg123_WMHmf.ext"
#o=220217RESWMHg123mf_groupAgeSexWmh.ext
#code/catFilesHorz.py -f $f -o $o 


#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#dat="210812RES1_PET_WMH.dat 210812RES2edit_PET_WMH.dat 210812RES3_PET_WMH.dat"
#sex=210812RESg123mf_PET_WMH_sex.dat
#code/sepGroupsBySex.py --csv $csv --dat $dat --sex $sex --sexall --ageall
#echo age1 > 210812RES1_PET_WMHmf_age.ext; cat 210812RES1_PET_WMHm_age.dat 210812RES1_PET_WMHf_age.dat >> 210812RES1_PET_WMHmf_age.ext
#echo age2 > 210812RES2edit_PET_WMHmf_age.ext; cat 210812RES2edit_PET_WMHm_age.dat 210812RES2edit_PET_WMHf_age.dat >> 210812RES2edit_PET_WMHmf_age.ext
#echo age3 > 210812RES3_PET_WMHmf_age.ext; cat 210812RES3_PET_WMHm_age.dat 210812RES3_PET_WMHf_age.dat >> 210812RES3_PET_WMHmf_age.ext
#/home/usr/mcavoy/FIDL/build/fidl_block -age 210812RES1_PET_WMHmf_age.ext 210812RES2edit_PET_WMHmf_age.ext 210812RES3_PET_WMHmf_age.ext  -grouplabels g1 g2 g3 -out 210812RESg123mf_PET_WMH_groupAge.ext 
#echo sexcov > 210812RESg123mf_PET_WMH_sex.ext; cat 210812RESg123mf_PET_WMH_sex.dat >> 210812RESg123mf_PET_WMH_sex.ext 
#f="210812RESg123mf_PET_WMH_groupAge.ext 210812RESg123mf_PET_WMH_sex.ext"
#o=210812RESg123mf_PET_WMH_groupAgeSex.ext
#code/catFilesHorz.py -f $f -o $o 
#cp /vgpool/data1/mcavoy/HCP/PET_DF01/conc/210812RESedit_PET_WMHmf/210812RES1_PET_WMHmf_WMH_fdg.csv . 
#cp /vgpool/data1/mcavoy/HCP/PET_DF01/conc/210812RESedit_PET_WMHmf/210812RES2edit_PET_WMHmf_WMH_fdg.csv . 
#cp /vgpool/data1/mcavoy/HCP/PET_DF01/conc/210812RESedit_PET_WMHmf/210812RES3_PET_WMHmf_WMH_fdg.csv . 
#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 210812RES1_PET_WMHmf_WMH_fdg.csv -txt
#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 210812RES2edit_PET_WMHmf_WMH_fdg.csv -txt
#/home/usr/mcavoy/FIDL/build/fidl_wmh -csv 210812RES3_PET_WMHmf_WMH_fdg.csv -txt
#echo wmh1 > 210812RES1_PET_WMHmf_WMH_fdg.ext; cat 210812RES1_PET_WMHmf_WMH_fdg.txt >> 210812RES1_PET_WMHmf_WMH_fdg.ext 
#echo wmh2 > 210812RES2edit_PET_WMHmf_WMH_fdg.ext; cat 210812RES2edit_PET_WMHmf_WMH_fdg.txt >> 210812RES2edit_PET_WMHmf_WMH_fdg.ext 
#echo wmh3 > 210812RES3_PET_WMHmf_WMH_fdg.ext; cat 210812RES3_PET_WMHmf_WMH_fdg.txt >> 210812RES3_PET_WMHmf_WMH_fdg.ext
#/home/usr/mcavoy/FIDL/build/fidl_block -age 210812RES1_PET_WMHmf_WMH_fdg.ext 210812RES2edit_PET_WMHmf_WMH_fdg.ext 210812RES3_PET_WMHmf_WMH_fdg.ext -out 210812RESg123_PET_WMHmf_WMH_fdg.ext 
#f="210812RESg123mf_PET_WMH_groupAgeSex.ext 210812RESg123_PET_WMHmf_WMH_fdg.ext"
#o=210812RESg123mf_PET_WMH_groupAgeSexWmh.ext
#code/catFilesHorz.py -f $f -o $o 

#od=/vgpool/data1/mcavoy/HCP/conc_caudate/glm_LputRcaud/LputRcaud/diff
#superbird=(220217RES1 220217RES2 220217RES3)
#echo -e "#!/bin/bash\n" > ${od}/batch.sh 
#for((i=0;i<${#superbird[@]};++i));do
#    r="_zm_Left-Putamen _zm_Right-Caudate"
#    inpath=/vgpool/data1/mcavoy/HCP/conc_caudate/glm_LputRcaud/LputRcaud
#    d=${superbird[i]}.dat
#    o=$od/${superbird[i]}.sh
#    HCP=/data/nil-bluearc/vlassenko/HCP/sub
#    t=1.5
#    code/220405.py -d $d -r $r -i $inpath -o $o -p $HCP -t $t
#    echo "${superbird[i]}.sh > ${superbird[i]}.sh.txt 2>&1 &" >> ${od}/batch.sh
#done
#chmod +x ${od}/batch.sh

#inpath=/vgpool/data1/mcavoy/HCP/conc_caudate/glmPMR_LputRcaud/LputRcaud
#od=$inpath/diff
#superbird=(220217PMR1 220217PMR2 220217PMR3)
#echo -e "#!/bin/bash\n" > ${od}/batch.sh   
#for((i=0;i<${#superbird[@]};++i));do
#    r="_zm_Left-Putamen _zm_Right-Caudate"
#    d=${superbird[i]}.dat
#    o=$od/${superbird[i]}.sh
#    HCP=/data/nil-bluearc/vlassenko/HCP/sub
#    t=1.5
#    code/subtractImages.py -d $d -r $r -i $inpath -o $o -p $HCP -t $t
#    echo "${superbird[i]}.sh > ${superbird[i]}.sh.txt 2>&1 &" >> ${od}/batch.sh
#done
#chmod +x ${od}/batch.sh


#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES1_WMHmf_ho_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES2_WMHmf_ho_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES3_WMHmf_ho_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES1_WMHmf_om_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES2_WMHmf_om_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES3_WMHmf_om_Left-Putamen.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES1_WMHmf_ho_Right-Caudate.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES2_WMHmf_ho_Right-Caudate.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES3_WMHmf_ho_Right-Caudate.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES1_WMHmf_om_Right-Caudate.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES2_WMHmf_om_Right-Caudate.ext .
#cp /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01mf/220217RES3_WMHmf_om_Right-Caudate.ext .
#echo wmh > 210812RES1_PET_WMHmf_wmh.ext; cat 210812RES1_PET_WMHmf_WMH_fdg.txt >> 210812RES1_PET_WMHmf_wmh.ext 
#echo wmh > 210812RES2edit_PET_WMHmf_wmh.ext; cat 210812RES2edit_PET_WMHmf_WMH_fdg.txt >> 210812RES2edit_PET_WMHmf_wmh.ext 
#echo wmh > 210812RES3_PET_WMHmf_wmh.ext; cat 210812RES3_PET_WMHmf_WMH_fdg.txt >> 210812RES3_PET_WMHmf_wmh.ext
#/home/usr/mcavoy/FIDL/build/fidl_block -age 210812RES1_PET_WMHmf_wmh.ext -out 210812RES1_PET_WMHmf_wmh0.ext 
#/home/usr/mcavoy/FIDL/build/fidl_block -age 210812RES2edit_PET_WMHmf_wmh.ext -out 210812RES2edit_PET_WMHmf_wmh0.ext 
#/home/usr/mcavoy/FIDL/build/fidl_block -age 210812RES3_PET_WMHmf_wmh.ext -out 210812RES3_PET_WMHmf_wmh0.ext 
#echo age > 210812RES1_PET_WMHmf_age0.ext; cat 210812RES1_PET_WMHmf_age0.dat >> 210812RES1_PET_WMHmf_age0.ext 
#echo age > 210812RES2edit_PET_WMHmf_age0.ext; cat 210812RES2edit_PET_WMHmf_age0.dat >> 210812RES2edit_PET_WMHmf_age0.ext 
#echo age > 210812RES3_PET_WMHmf_age0.ext; cat 210812RES3_PET_WMHmf_age0.dat >> 210812RES3_PET_WMHmf_age0.ext 
#echo sex > 210812RES1_PET_WMHmf_sex0.ext; cat 210812RES1_PET_WMHmf_sex0.dat >> 210812RES1_PET_WMHmf_sex0.ext 
#echo sex > 210812RES2edit_PET_WMHmf_sex0.ext; cat 210812RES2edit_PET_WMHmf_sex0.dat >> 210812RES2edit_PET_WMHmf_sex0.ext 
#echo sex > 210812RES3_PET_WMHmf_sex0.ext; cat 210812RES3_PET_WMHmf_sex0.dat >> 210812RES3_PET_WMHmf_sex0.ext 

#f="220217RES1_WMHmf_ho_Left-Putamen.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_ho_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES1_WMHmf_om_Left-Putamen.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_om_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES1_WMHmf_ho_Right-Caudate.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_ho_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES1_WMHmf_om_Right-Caudate.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_om_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_ho_Left-Putamen.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_ho_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_om_Left-Putamen.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_om_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_ho_Right-Caudate.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_ho_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_om_Right-Caudate.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_om_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES3_WMHmf_ho_Left-Putamen.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_ho_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES3_WMHmf_om_Left-Putamen.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_om_Left-Putamen_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES3_WMHmf_ho_Right-Caudate.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_ho_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES3_WMHmf_om_Right-Caudate.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_om_Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 

#f='220217RES1_WMHmf_ho_Left-Putamen.ext 220217RES1_WMHmf_ho_Right-Caudate.ext'
#l=hoLput-Rcaud
#o=220217RES1_WMHmf_ho_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o
#f='220217RES1_WMHmf_om_Left-Putamen.ext 220217RES1_WMHmf_om_Right-Caudate.ext'
#l=omLput-Rcaud
#o=220217RES1_WMHmf_om_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o
#f='220217RES2_WMHmf_ho_Left-Putamen.ext 220217RES2_WMHmf_ho_Right-Caudate.ext'
#l=hoLput-Rcaud
#o=220217RES2_WMHmf_ho_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o
#f='220217RES2_WMHmf_om_Left-Putamen.ext 220217RES2_WMHmf_om_Right-Caudate.ext'
#l=omLput-Rcaud
#o=220217RES2_WMHmf_om_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o
#f='220217RES3_WMHmf_ho_Left-Putamen.ext 220217RES3_WMHmf_ho_Right-Caudate.ext'
#l=hoLput-Rcaud
#o=220217RES3_WMHmf_ho_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o
#f='220217RES3_WMHmf_om_Left-Putamen.ext 220217RES3_WMHmf_om_Right-Caudate.ext'
#l=omLput-Rcaud
#o=220217RES3_WMHmf_om_Left-Putamen-Right-Caudate.ext
#code/subtractFiles.py -f $f -l $l -o $o

#f="220217RES1_WMHmf_ho_Left-Putamen-Right-Caudate.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_ho_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES1_WMHmf_om_Left-Putamen-Right-Caudate.ext 210812RES1_PET_WMHmf_age0.ext 210812RES1_PET_WMHmf_sex0.ext 210812RES1_PET_WMHmf_wmh0.ext"
#o=220217RES1_WMHmf_om_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_ho_Left-Putamen-Right-Caudate.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_ho_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o 
#f="220217RES2_WMHmf_om_Left-Putamen-Right-Caudate.ext 210812RES2edit_PET_WMHmf_age0.ext 210812RES2edit_PET_WMHmf_sex0.ext 210812RES2edit_PET_WMHmf_wmh0.ext"
#o=220217RES2_WMHmf_om_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o
#f="220217RES3_WMHmf_ho_Left-Putamen-Right-Caudate.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_ho_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o
#f="220217RES3_WMHmf_om_Left-Putamen-Right-Caudate.ext 210812RES3_PET_WMHmf_age0.ext 210812RES3_PET_WMHmf_sex0.ext 210812RES3_PET_WMHmf_wmh0.ext"
#o=220217RES3_WMHmf_om_Left-Putamen-Right-Caudate_age0_sex0_wmh0.ext
#code/catFilesHorz.py -f $f -o $o

#d=/data/nil-bluearc/vlassenko/mcavoy/segment/MRI_Andrei.dat
#p=/data/nil-bluearc/vlassenko/HCP/sub
#o=220502rmHcpScratch.sh
#code/rmHcpScratch.py -d $d -p $p -o $o


#cat 220217RES1m.dat 220217RES1f.dat 220217RES2m.dat 220217RES2f.dat 220217RES3m.dat 220217RES3f.dat > 220217RESg123mf.dat
#d=220217RESg123mf.dat
#t=1.5
#p=/data/nil-bluearc/vlassenko/HCP/sub
#o=220217RESg123mf_motion.nii.gz #goes with 220217RESg123mf_groupAgeSexcov.ext
#code/motionStack.py -d $d -t $t -p $p -o $o
#/home/usr/mcavoy/FIDL/build/fidl_hdr -files 220217RESg123mf_motion.nii.gz -val

#cat 220217PMR1m.dat 220217PMR1f.dat 220217PMR2m.dat 220217PMR2f.dat 220217PMR3m.dat 220217PMR3f.dat > 220217PMRg123mf.dat
#d=220217PMRg123mf.dat
#t=1.5
#p=/data/nil-bluearc/vlassenko/HCP/sub
#o=220217PMRg123mf_motion.nii.gz #goes with 220217PMRg123mf_groupAgeSexcov.ext
#code/motionStack.py -d $d -t $t -p $p -o $o
#/home/usr/mcavoy/FIDL/build/fidl_hdr -files 220217PMRg123mf_motion.nii.gz -val

#for i in 1 2 3;do
#    cat 220217RES${i}m.dat 220217RES${i}f.dat > 220217RES${i}mf.dat
#    d=220217RES${i}mf.dat
#    t=1.5
#    p=/data/nil-bluearc/vlassenko/HCP/sub
#    o=220217RES${i}mf_motion.txt
#    code/motionNiftiOrTxt.py -d $d -t $t -p $p -o $o
#done
#x=(220217RES1mf_motion.txt 220217RES2mf_motion.txt 220217RES3mf_motion.txt)
#for((i=0;i<${#x[@]};++i));do
#    echo motion$((i+1)) | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]} 
#done
#/home/usr/mcavoy/FIDL/build/fidl_block -age ${x[@]} -out 220217RESg123mf_motion.ext 
#f="220217RESg123mf_groupAgeSexcov.ext 220217RESg123mf_motion.ext"
#o=220217RESg123mf_groupAgeSexcovMotion.ext
#code/catFilesHorz.py -f $f -o $o

#for i in 1 2 3;do
#    cat 220217PMR${i}m.dat 220217PMR${i}f.dat > 220217PMR${i}mf.dat
#    d=220217PMR${i}mf.dat
#    t=1.5
#    p=/data/nil-bluearc/vlassenko/HCP/sub
#    o=220217PMR${i}mf_motion.txt
#    code/motionNiftiOrTxt.py -d $d -t $t -p $p -o $o
#done
#x=(220217PMR1mf_motion.txt 220217PMR2mf_motion.txt 220217PMR3mf_motion.txt)
#for((i=0;i<${#x[@]};++i));do
#    echo motion$((i+1)) | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]} 
#done
#/home/usr/mcavoy/FIDL/build/fidl_block -age ${x[@]} -out 220217PMRg123mf_motion.ext 
#f="220217PMRg123mf_groupAgeSexcov.ext 220217PMRg123mf_motion.ext"
#o=220217PMRg123mf_groupAgeSexcovMotion.ext
#code/catFilesHorz.py -f $f -o $o

#x=(210812RES1_PETmf_ho_Left-Putamen.ext 210812RES1_PETmf_om_Left-Putamen.ext 210812RES2edit_PETmf_ho_Left-Putamen.ext \
#   210812RES2edit_PETmf_om_Left-Putamen.ext 210812RES3_PETmf_ho_Left-Putamen.ext 210812RES3_PETmf_om_Left-Putamen.ext \
#   210812RES1_PETmf_ho_Right-Caudate.ext 210812RES1_PETmf_om_Right-Caudate.ext 210812RES2edit_PETmf_ho_Right-Caudate.ext \
#   210812RES2edit_PETmf_om_Right-Caudate.ext 210812RES3_PETmf_ho_Right-Caudate.ext 210812RES3_PETmf_om_Right-Caudate.ext)
#for i in ${x[@]};do
#    tail -n +2 /vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/PET_DF01mf/$i > $i
#done
#x=(210812RES1_PETmf_ho_Left-Putamen.ext 210812RES2edit_PETmf_ho_Left-Putamen.ext 210812RES3_PETmf_ho_Left-Putamen.ext \
#   210812RES1_PETmf_ho_Right-Caudate.ext 210812RES2edit_PETmf_ho_Right-Caudate.ext 210812RES3_PETmf_ho_Right-Caudate.ext)
#for((i=0;i<${#x[@]};++i));do
#    echo ho | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]} 
#done
#x=(210812RES1_PETmf_om_Left-Putamen.ext 210812RES2edit_PETmf_om_Left-Putamen.ext 210812RES3_PETmf_om_Left-Putamen.ext \
#   210812RES1_PETmf_om_Right-Caudate.ext 210812RES2edit_PETmf_om_Right-Caudate.ext 210812RES3_PETmf_om_Right-Caudate.ext)
#for((i=0;i<${#x[@]};++i));do
#    echo om | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]} 
#done
#cat 210812RES1_PETm.dat 210812RES1_PETf.dat > 210812RES1_PETmf.dat
#cat 210812RES2edit_PETm.dat 210812RES2edit_PETf.dat > 210812RES2edit_PETmf.dat
#cat 210812RES3_PETm.dat 210812RES3_PETf.dat > 210812RES3_PETmf.dat 
#x=(210812RES1_PETmf 210812RES2edit_PETmf 210812RES3_PETmf)
#for i in ${x[@]};do
#    d=${i}.dat
#    t=1.5
#    p=/data/nil-bluearc/vlassenko/HCP/sub
#    o=${i}_motion0.txt
#    code/motionNiftiOrTxt.py -d $d -t $t -p $p -o $o -0
#done
#x=(210812RES1_PETmf_motion0 210812RES2edit_PETmf_motion0 210812RES3_PETmf_motion0)
#for((i=0;i<${#x[@]};++i));do
#    echo motion0 | cat - ${x[i]}.txt > ${x[i]}.ext
#done
#csv=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#x=(210812RES1_PET 210812RES2edit_PET 210812RES3_PET)
#for i in ${x[@]};do
#    code/sepGroupsBySex.py --csv $csv --dat ${i}.dat --sexall --ageall
#done
#x=(210812RES1_PETmf 210812RES2edit_PETmf 210812RES3_PETmf)
#for((i=0;i<${#x[@]};++i));do
#    echo sex0 | cat - ${x[i]}_sex0.dat > ${x[i]}_sex0.ext
#    echo age0 | cat - ${x[i]}_age0.dat > ${x[i]}_age0.ext
#done
#x=(210812RES1_PETmf_ho_Left-Putamen 210812RES1_PETmf_om_Left-Putamen 210812RES1_PETmf_ho_Right-Caudate 210812RES1_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES1_PETmf_age0.ext 210812RES1_PETmf_sex0.ext 210812RES1_PETmf_motion0.ext"
#    o=${i}_age0sex0motion0.ext
#    code/catFilesHorz.py -f $f -o $o
#done
#x=(210812RES2edit_PETmf_ho_Left-Putamen 210812RES2edit_PETmf_om_Left-Putamen 210812RES2edit_PETmf_ho_Right-Caudate 210812RES2edit_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES2edit_PETmf_age0.ext 210812RES2edit_PETmf_sex0.ext 210812RES2edit_PETmf_motion0.ext"
#    o=${i}_age0sex0motion0.ext
#    code/catFilesHorz.py -f $f -o $o
#done
#x=(210812RES3_PETmf_ho_Left-Putamen 210812RES3_PETmf_om_Left-Putamen 210812RES3_PETmf_ho_Right-Caudate 210812RES3_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES3_PETmf_age0.ext 210812RES3_PETmf_sex0.ext 210812RES3_PETmf_motion0.ext"
#    o=${i}_age0sex0motion0.ext
#    code/catFilesHorz.py -f $f -o $o
#done
#x=(210812RES1_PETmf_ho_Left-Putamen 210812RES1_PETmf_om_Left-Putamen 210812RES1_PETmf_ho_Right-Caudate 210812RES1_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES1_PETmf_age0.ext 210812RES1_PETmf_sex0.ext"
#    o=${i}_age0sex0.ext
#    code/catFilesHorz.py -f $f -o $o
#done
#x=(210812RES2edit_PETmf_ho_Left-Putamen 210812RES2edit_PETmf_om_Left-Putamen 210812RES2edit_PETmf_ho_Right-Caudate 210812RES2edit_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES2edit_PETmf_age0.ext 210812RES2edit_PETmf_sex0.ext"
#    o=${i}_age0sex0.ext
#    code/catFilesHorz.py -f $f -o $o
#done
#x=(210812RES3_PETmf_ho_Left-Putamen 210812RES3_PETmf_om_Left-Putamen 210812RES3_PETmf_ho_Right-Caudate 210812RES3_PETmf_om_Right-Caudate)
#for i in ${x[@]};do
#    f="${i}.ext 210812RES3_PETmf_age0.ext 210812RES3_PETmf_sex0.ext"
#    o=${i}_age0sex0.ext
#    code/catFilesHorz.py -f $f -o $o
#done

#code/educationNiftiOrTxt.py -h

#c=2018_11_30_Regression_copy.csv
#m=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=220217PMRg123mf.dat
#o=${x%.*}_educ.nii.gz
#code/educationNiftiOrTxt.py -c $c -m $m -r $r -d $x -o $o
#/home/usr/mcavoy/FIDL/build/fidl_hdr -files $o -val

#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=220217RESg123mf.dat
#o=${x%.*}_educ.nii.gz
#code/educationNiftiOrTxt.py -r $r -d $x -o $o
#/home/usr/mcavoy/FIDL/build/fidl_hdr -files $o -val

#c=2018_11_30_Regression_copy.csv
#m=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=(220217PMR1mf.dat 220217PMR2mf.dat 220217PMR3mf.dat)
#for i in ${x[@]};do
#    code/educationNiftiOrTxt.py -c $c -m $m -r $r -d $i
#    echo ''
#done
#x=(220217PMR1mf_educ.txt 220217PMR2mf_educ.txt 220217PMR3mf_educ.txt)
#for((i=0;i<${#x[@]};++i));do
#    echo educ$((i+1)) | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]} 
#done
#/home/usr/mcavoy/FIDL/build/fidl_block -age ${x[@]} -out 220217PMRg123mf_educ.ext 
#f="220217PMRg123mf_groupAgeSexcov.ext 220217PMRg123mf_educ.ext"
#o=220217PMRg123mf_groupAgeSexcovEduc.ext
#code/catFilesHorz.py -f $f -o $o
#f="220217PMRg123mf_groupAgeSexcovMotion.ext 220217PMRg123mf_educ.ext"
#o=220217PMRg123mf_groupAgeSexcovMotionEduc.ext
#code/catFilesHorz.py -f $f -o $o

#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=(220217RES1mf.dat 220217RES2mf.dat 220217RES3mf.dat)
#for i in ${x[@]};do
#    code/educationNiftiOrTxt.py -r $r -d $i
#    echo ''
#done
#x=(220217RES1mf_educ.txt 220217RES2mf_educ.txt 220217RES3mf_educ.txt)
#for((i=0;i<${#x[@]};++i));do
#    echo educ$((i+1)) | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]}   
#done
#/home/usr/mcavoy/FIDL/build/fidl_block -age ${x[@]} -out 220217RESg123mf_educ.ext
#f="220217RESg123mf_groupAgeSexcov.ext 220217RESg123mf_educ.ext"
#o=220217RESg123mf_groupAgeSexcovEduc.ext
#code/catFilesHorz.py -f $f -o $o
#f="220217RESg123mf_groupAgeSexcovMotion.ext 220217RESg123mf_educ.ext"
#o=220217RESg123mf_groupAgeSexcovMotionEduc.ext
#code/catFilesHorz.py -f $f -o $o

#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=(210812RES1_PETmf.dat 210812RES2edit_PETmf.dat 210812RES3_PETmf.dat)
#for i in ${x[@]};do
#    code/educationNiftiOrTxt.py -r $r -d $i
#    echo ''
#done
#x=(210812RES1_PETmf_educ.txt 210812RES2edit_PETmf_educ.txt 210812RES3_PETmf_educ.txt)
#for((i=0;i<${#x[@]};++i));do
#    echo educ$((i+1)) | cat - ${x[i]} > ${x[i]}_tmp && mv ${x[i]}_tmp ${x[i]}   
#done
#/home/usr/mcavoy/FIDL/build/fidl_block -age ${x[@]} -out 210812RESedit_PETg123mf_educ.ext 
#f="210812RESedit_PETmfg123_ageSexcov.ext 210812RESedit_PETg123mf_educ.ext"
#o=210812RESedit_PETg123mf_groupAgeSexcovEduc.ext
#code/catFilesHorz.py -f $f -o $o

#c=2018_11_30_Regression_copy.csv
#m=ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv
#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=(220217PMR1mf.dat 220217PMR2mf.dat 220217PMR3mf.dat)
#for i in ${x[@]};do
#    code/raceTxt.py -c $c -m $m -r $r -d $i
#    echo ''
#done
#r=VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv
#x=(220217RES1mf.dat 220217RES2mf.dat 220217RES3mf.dat)
#for i in ${x[@]};do
#    code/raceTxt.py -r $r -d $i
#    echo ''
#done

d='220217PMRg123mf.dat 220217RESg123mf.dat'
o=220217PMRg123mf_and_220217RESg123mf.txt
code/commonSubjects.py -d $d -o $o

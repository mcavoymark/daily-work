#!/usr/bin/env python3

text='Read csvER and csvREDCAP to get values of education. csvMAP to find a matching MAP# for a 108XXX, if needed.\nIf output filename specified, then output is nifti or text depending on provided extension, otherwise text is output. Output order follows *.dat'
#print(text)

import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-c','--csvER',help='Education is read from this csv. Subjects are identified by MAP#. Ex. 2018_11_30_Regression_copy.csv from Jon Christensen.')
parser.add_argument('-m','--csvMAP',help='MAP# is read from this csv if 108XXX in *.dat. Ex. ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv')
parser.add_argument('-r','--csvREDCAP',help='Education is read from this csv if not found in --csvER. Ex. VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv')
parser.add_argument('-d','--dat',help='Input dat. Ex. 220217PMR1mf.dat')
parser.add_argument('-0','--zeromean',help='Education is zero mean',action="store_true")
parser.add_argument('-o','--out',help='Output. Optional. Default is text. Ex. 220217RESg123mf_educ.nii.gz or 220217RESg123mf_educ.nii, output will be nifti. Anything else will be text.')
args=parser.parse_args()

if args.dat:
    if args.csvER:print(f'-c --csvER {args.csvER}')
    if args.csvMAP:print(f'-m --csvMAP {args.csvMAP}')
    print(f'-r --csvREDCAP {args.csvREDCAP}')
    print(f'-d --dat {args.dat}')
    if args.zeromean:print(f'-0 --zeromean {args.zeromean}')
    if args.out:print(f'-o --out {args.out}')    
else:
    exit()

import numpy as np

educ=[]
from csv import DictReader

#with open(args.dat,encoding="utf8",errors='ignore') as fd,open(args.csvER,encoding="utf8",errors='ignore') as fc,open(args.csvMAP,encoding="utf8",errors='ignore') as fm,open(args.csvREDCAP,encoding="utf8",errors='ignore') as fr:
with open(args.dat,encoding="utf8",errors='ignore') as fd,open(args.csvREDCAP,encoding="utf8",errors='ignore') as fr:


    #for _ in range(4):next(fm)
    #dict_reader_m=DictReader(fm)
    #if args.csvMAP:
    #    for _ in range(4):next(fm)
    #    dict_reader_m=DictReader(fm)

    #dict_reader_c=DictReader(fc)
    #if args.csvER:dict_reader_c=DictReader(fc)

    if args.csvER:
        fm=open(args.csvMAP,encoding="utf8",errors='ignore')
        for _ in range(4):next(fm)
        dict_reader_m=DictReader(fm)
        fc=open(args.csvER,encoding="utf8",errors='ignore') 
        dict_reader_c=DictReader(fc)

    dict_reader_r=DictReader(fr)
    for ld0 in fd:
        if not ld0.strip() or ld0.startswith('#'):continue
        s0=(ld0.split()[0]).split('/')[0]

        #s1=''
        #if s0[0:3]=='108':
        #    for row in dict_reader_m:
        #        s1=row['RedCap #']
        #        #if s1=='':continue
        #        #if s1==s0: 
        #        #if row['RedCap #']==s0:
        #        if s1==s0:
        #            s0=row['MAP #']    
        #            #print(f'    s0={s0}')
        #            #fm.seek(0)
        #            #fm.seek(pos_m)
        #            break
        #    fm.seek(0)
        #if s0[0:3]=='108':
        #    print(f'Error: s0={s0}, no MAP# found. Abort!')
        #    exit()
        #print(f's0={s0}')
        #lc=0
        #for row in dict_reader_c:
        #    if row['Subject']==s0:
        #        educ.append(row['Education'])
        #        #fc.seek(0)
        #        #print(f'    here0')
        #        #fc.seek(pos_c)
        #        lc=1
        #        break
        #fc.seek(0)
        #START220613
        lc=0
        if args.csvER:
            s1=''
            if s0[0:3]=='108':
                for row in dict_reader_m:
                    s1=row['RedCap #']
                    if s1==s0:
                        s0=row['MAP #']
                        break
                fm.seek(0)
            if s0[0:3]=='108':
                print(f'Error: s0={s0}, no MAP# found. Abort!')
                exit()
            for row in dict_reader_c:
                if row['Subject']==s0:
                    educ.append(row['Education'])
                    lc=1
                    break
            fc.seek(0)
        else:
            s1=s0
        

        #print(f's0={s0}')

        if lc==0 and s1!='':
            for row in dict_reader_r:
                #s2=row['record_id']
                #if s2=='':continue
                #if s2==s1:
                if row['record_id']==s1:
                    #print(f"    education_years={row['education_years']}")
                    educ.append(row['education_years'])
                    lc=1

                    if row['education_years']=='':print(f"ERROR s0={s0} education_years={row['education_years']}")

                    break
            fr.seek(0)
        if lc==0:

            #print(f'Error: s0={s0}, not found in {args.csvER} or {args.csvREDCAP}. Abort!')
            if args.csvER:
                print(f'Error: s0={s0}, not found in {args.csvER} or {args.csvREDCAP}. Abort!')
            else:
                print(f'Error: s0={s0}, not found in {args.csvREDCAP}. Abort!')

            exit()

if args.csvER:
    fm.close()
    fc.close()

print(educ)
   
#c0=''
#educ=np.array(educ,dtype=np.single)
#if args.zeromean:
#    educ=educ-np.mean(educ)
#    c0='0'
#out=args.dat[:-4]+'_educ'+c0+'.txt'
#with open(out,mode='wt',encoding='utf-8') as fileOutput:
#    np.savetxt(out,educ,fmt='%.1f')
#print(f'Output written to {out}')

c0=''
educ=np.array(educ,dtype=np.single)
me0=np.mean(educ)
min0=min(educ)
max0=max(educ)
if args.zeromean:
    educ=educ-me0
    c0='0'
idx=-1
if args.out:idx=args.out.rfind('.nii')
if idx != -1:
    out=args.out[:idx]+'.nii.gz'
    converted_array=np.array(educ,dtype=np.float32).reshape(1,1,1,len(educ))
    import nibabel as nib
    nifti2=nib.Nifti2Image(converted_array,np.eye(4))
    nifti2.to_filename(out)
else:
    if args.out:
        out=args.out
    else:
        out=args.dat[:-4]+'_educ'+c0+'.txt'
    np.savetxt(out,educ,fmt='%.1f')
print(f'Output written to {out}\n    {me0:.1f} {min0}-{max0}')

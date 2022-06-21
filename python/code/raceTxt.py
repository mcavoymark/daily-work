#!/usr/bin/env python3

text='Read csvER and csvREDCAP to get values of race. csvMAP to find a matching MAP# for a 108XXX, if needed.\nOutput order follows *.dat'

#print(text)

import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-c','--csvER',help='Race is read from this csv. Subjects are identified by MAP#. Ex. 2018_11_30_Regression_copy.csv from Jon Christensen.')
parser.add_argument('-m','--csvMAP',help='MAP# is read from this csv if 108XXX in *.dat. Ex. ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv')
parser.add_argument('-r','--csvREDCAP',help='Race is read from this csv if not found in --csvER. Ex. VGLabAgingDementia-Educationrace_DATA_2022-06-13_1649_edit.csv')
parser.add_argument('-d','--dat',help='Input dat. Ex. 220217PMR1mf.dat')
parser.add_argument('-o','--out',help='Output. Optional. Default: Ex. For 220217PMR1mf.dat the output will be 20217PMR1mf_race.txt ')
args=parser.parse_args()

if args.dat:
    if args.csvER:print(f'-c --csvER {args.csvER}')
    if args.csvMAP:print(f'-m --csvMAP {args.csvMAP}')
    print(f'-r --csvREDCAP {args.csvREDCAP}')
    print(f'-d --dat {args.dat}')
    if args.out:print(f'-o --out {args.out}')    
else:
    exit()

race=[]
from csv import DictReader

with open(args.dat,encoding="utf8",errors='ignore') as fd,open(args.csvREDCAP,encoding="utf8",errors='ignore') as fr:
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
                    race.append(row['Race'])
                    lc=1
                    break
            fc.seek(0)
        else:
            s1=s0
        if lc==0 and s1!='':
            for row in dict_reader_r:
                if row['record_id']==s1:
                    l0=list(row.values())[3:]
                    if 1 in row.values() != TRUE:
                        print(f'Race not specified for {s1}')
                        exit()
                    else:
                        l1=[int(i) for i in list(row.values())[3:]]
                        if sum(l1) > 1:
                            print(f'More than a single ace not specified for {s1}')
                            exit()
                        else:
                            l2=list(row.keys())[3:][l1.index(1)]
                            if l2=='American Indian or Alaskan Native':
                                race.append('American Indian or Alaskan Native')
                            elif l2=='Asian':
                                race.append('Asian')
                            elif l2=='Black or Afirican American':
                                race.append('AA')
                            elif l2=='Native Hawaiian or other Pacific Islander':
                                race.append('Native Hawaiian or other Pacific Islander')
                            elif l2=='White':
                                race.append('C')
                            elif l2=='Other':
                                race.append('Other')
                            else:
                                print(f'Race is {l2} for {s1}. Unknown value! Abort!')
                                exit()
                    lc=1
                    break
            fr.seek(0)
        if lc==0:
            if args.csvER:
                print(f'Error: s0={s0}, not found in {args.csvER} or {args.csvREDCAP}. Abort!')
            else:
                print(f'Error: s0={s0}, not found in {args.csvREDCAP}. Abort!')
            exit()
if args.csvER:
    fm.close()
    fc.close()

print(race)

from collections import Counter
print(Counter(race))
   
if args.out:
    out=args.out
else:
    out=args.dat[:-4]+'_race.txt'
with open(out,mode='wt',encoding='utf-8') as output:
    output.write('\n'.join(race))
print(f'Output written to {out}')

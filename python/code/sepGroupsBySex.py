#!/usr/bin/env python3

text='Read csv to get values of sex and age. Write sex separated *.dat files and corresponding age files.'
print(text)
age0txt='outputs a centered quantitative variable for age for each *.dat.'
#print(f"Option --age0 {age0txt}")
print(f"Option --ageall {age0txt}")
sexalltxt='outputs a centered quantitative variable for sex for each *.dat.'
print(f"Option --sexall {sexalltxt}")
print("Option --sex outputs a single centered quantitative variable for sex.")
print("    This is not recomended by Robert Cox https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/STATISTICS/center.html#categorical-variables-as-regressors-of-no-interest")
print("    but is common practice.")

import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-c','--csv',help='Input csv. Ex. ASRC_non-ADRC_MTIs_all_visits_04_23_2020_mm220216.csv')
parser.add_argument('-d','--dat',nargs='+',help='Input dat(s). Ex. 210812RES1_PET.dat 210812RES2edit_PET.dat 210812RES3_PET.dat')
parser.add_argument('-s','--sex',help='Output name. Ex. 210812RESedit_PETg123mf_sex.dat')

#START220330
parser.add_argument('-a','--sexall',help=sexalltxt,action="store_true")
#parser.add_argument('-0','--age0',help=sexalltxt,action="store_true")
parser.add_argument('-0','--ageall',help=sexalltxt,action="store_true")

args=parser.parse_args()


if args.csv:
    print(f'-c --csv {args.csv}')
    print(f'-d --dat {args.dat}')
if args.sex:
    print(f'-s --sex {args.sex}')
    sex0=[]

#START220330
if args.sexall:
    print(f'-a --sexall {args.sexall}')
#if args.age0:
#    print(f'-0 --age0 {args.age0}')
if args.ageall:
    print(f'-0 --ageall {args.ageall}')

from rou.files import open_files
import os
from csv import DictReader

with open(args.csv,encoding="utf8",errors='ignore') as f:
    for _ in range(4):next(f)
    csv_dict_reader=DictReader(f)

    for i in args.dat:
        root0=os.path.splitext(i)[0]
        o0=[root0+'m.dat',root0+'f.dat',root0+'m_age.dat',root0+'f_age.dat'] #male, female, male age, female age

        if args.sex or args.sexall:
            sex0m=[]
            sex0f=[]
        #if args.age0:
        if args.ageall:
            age0m=[]
            age0f=[]

        with open(i) as f1p:

            p0=open_files(o0,'w')

            for line0 in f1p:

                if not line0.strip() or line0.startswith('#'):
                    #print(f"Skipping: {line0}")
                    continue
                s0=(line0.split()[0]).split('/')
                #print("start0 s0=",s0)
                for row in csv_dict_reader:
                    #print(row)
                    #print("start1",row['MAP #'],row['RedCap #'],row['vglab ID'])

                    #if row['RedCap #']==s0[0]:

                    s1=row['RedCap #']
                    if s1=='':
                        #print("********** HERE0 ******************")
                        s1=row['MAP #']

                    #print("s0=",s0,"s1=",s1)
                    
                    if s1==s0[0]:
                        #print("here0")

                        if row['vglab ID']==s0[1]:
                            #print("here1")
                            if  row['sex']=='M':
                                p0[0].write(line0) 
                                p0[2].write(row['MRI age']+'\n')

                                #if args.sex:sex0m.append(1)
                                #START220330
                                if args.sex or args.sexall:sex0m.append(1)
                                #if args.age0:age0m.append(row['MRI age'])
                                if args.ageall:age0m.append(row['MRI age'])

                            elif row['sex']=='F':
                                p0[1].write(line0) 
                                p0[3].write(row['MRI age']+'\n')

                                #if args.sex:sex0f.append(0)
                                #START220330
                                if args.sex or args.sexall:sex0f.append(0)
                                #if args.age0:age0f.append(row['MRI age'])
                                if args.ageall:age0f.append(row['MRI age'])

                            else:
                                print("Error: Unknown sex.")
                                exit() 
                            f.seek(0)
                            break
                else:
                    print(f"Error1: {s0} not found.")
                    exit()
            print(f"Output written to {', '.join(o0)}") 

            if args.sex:
                sex0+=sex0m+sex0f

            #START220330
            if args.sexall:
                #print("sex0m=",sex0m)
                sex2=sex0m+sex0f
                import numpy as np
                sex1=np.array(sex2)-np.mean(sex2)
                sex1f=root0+'mf_sex0.dat' 
                np.savetxt(sex1f,sex1,fmt='%.4f')
                print(f"Output written to {sex1f}") 
            #if args.age0:
            if args.ageall:
                age2=np.array(age0m+age0f).astype(np.float)
                age1=age2-np.mean(age2)
                age1f=root0+'mf_age0.dat' 
                np.savetxt(age1f,age1,fmt='%.4f')
                print(f"Output written to {age1f}") 

if args.sex:
    import numpy as np
    sex1=np.array(sex0)-np.mean(sex0)
    #print('sex0=',sex0)
    #print('sex1=',sex1)
    #with open(args.sex,'w') as fp:
    #    fp.write(str(sex1))
    #    print(f'Output written to {args.sex}') 
    np.savetxt(args.sex,sex1,fmt='%.4f')
    print(f"Output written to {args.sex}") 

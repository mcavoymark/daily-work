#!/usr/bin/env python3

#text='Read *.dat files to identify common subjects.'
text='Read *.dat files to identify subjects that appear in more than one *.dat'
print(text)

import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-d','--dat',nargs='+',help='Input dat(s). Ex. 220217PMRg123mf.dat 220217RESg123mf.dat')
parser.add_argument('-o','--out',help='Output name. Ex. 220217PMRg123mf_and_220217RESg123mf.txt')

args=parser.parse_args()
if args.dat:
    print(f'-d --dat {args.dat}')
    print(f'-o --out {args.out}')

#with open(args.out,mode='wt',encoding='utf-8') as fileOutput:
#    with open(args.dat[0],encoding="utf8",errors='ignore') as f1:
#        for i in range(1,len(args.dat)):
#            with open(args.dat[i],encoding="utf8",errors='ignore') as f2:
#                print('here0')

#from rou.files import open_files
#p0=open_files(args.dat,'r')
#for line0 in p0[0]

#with open(args.out,mode='wt',encoding='utf-8') as fileOutput:
#    with open(args.dat[0],encoding="utf8",errors='ignore') as f0:
#        for i in range(1,len(args.dat)):
#            with open(args.dat[i],encoding="utf8",errors='ignore') as f1:
#                for line0 in f0:
#                    if not line0.strip() or line0.startswith('#'):continue
#                    s0=(line0.split()[0]).split('/') 
#                    for line1 in f1:
#                        if not line1.strip() or line1.startswith('#'):continue
#                        s1=(line1.split()[0]).split('/') 
#                        if s1[0]==s0[0]:

from rou.files import open_files
from datetime import date
import numpy as np

dict0={}
with open(args.out,mode='wt',encoding='utf-8') as fo:
    p0=open_files(args.dat,'r')
    for line0 in p0[0]:
        if not line0.strip() or line0.startswith('#'):continue
        s0=(line0.split()[0]).split('/') 
        cnt0=1
        date0=[s0[1]]
        for i in range(1,len(args.dat)):
            for line1 in p0[i]:
                if not line1.strip() or line1.startswith('#'):continue
                s1=(line1.split()[0]).split('/') 
                if s1[0]==s0[0]:
                    date0.append(s1[1])
                    break
            p0[i].seek(0)
        if len(date0)>1:
            dict0[s0[0]]=date0
            #dict0.update({s0[0]:date0})

    #if len(dict0)>0:
    #    [print(f'{key}\t{",".join(value)}') for key,value in dict0.items()]
    #    [fo.write(f'{key}\t{",".join(value)}\n') for key,value in dict0.items()]
    d1=[]
    if len(dict0)>0:
        for key,value in dict0.items():
            if len(value)>2:
                print(f'{key} has more than two sessions. Code needs to be added to handle this.')
                exit()
            d0=(date(2000+int(value[1][:2]),int(value[1][2:4]),int(value[1][4:6]))-date(2000+int(value[0][:2]),int(value[0][2:4]),int(value[0][4:6]))).days
            fo.write(f'{key}\t{",".join(value)}    {d0} days apart\n')
            d1.append(d0)
        fo.write(f'\nmin={min(d1)} max={max(d1)} mean={np.mean(d1)}\n')

print(f'Output written to {args.out}')

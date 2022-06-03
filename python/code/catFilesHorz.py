#!/usr/bin/env python3

print('Concatenate tab separated files horizontally to build design matrices.')

import argparse

text='Concatenate tab separated files horizontally to build design matrices.'
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)

parser.add_argument('-f','--files',nargs='+',help='Input file(s). Ex. 210812RESedit_PETg123mf_age.ext 210812RESedit_PETg123mf_sex.ext')
parser.add_argument('-o','--out',help='Output name. Ex. 210812RESedit_PETg123mf_ageSexcov.ext')

args=parser.parse_args()

if args.files:
    print(f'-f --files {args.files}')
    print(f'-o --out   {args.out}')

#from rou.newlines import buf_count_newlines_gen,check_newlines
#from rou.newlines import buf_count_newlines_gen

from rou.newlines import check_newlines

#print(args.files)
#exit()

cnt0=check_newlines(args.files)
#print(f'cnt0={cnt0}')
if(cnt0==-1):exit()

str1 = ["" for _ in range(cnt0)]
with open(args.out,mode='wt',encoding='utf-8') as fileOutput:
    for i in range(len(args.files)):
        with open(args.files[i]) as r0:
            for j in range(cnt0):

                #str1[j]+=r0.readline().strip('\n')
                #START220331
                str1[j]+=r0.readline().rstrip('\t\n')+'\t'

    for j in str1:
        j=j.rstrip('\t')+'\n'
        fileOutput.write(j)
print("    Output written to "+args.out)

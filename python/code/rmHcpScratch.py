#!/usr/bin/env python3 

text='This program writes a bash script that removes HCP scratch directories.\nWriting a script rather than direct deletion provides a fail safe.'

#print('This program writes a bash script that removes HCP scratch directories.')
#print('Writing a script rather than direct deletion provides a fail safe.')
print(text)

import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-d','--dat',help='Input *.dat identifies subjects and runs. Ex. /data/nil-bluearc/vlassenko/mcavoy/segment/MRI_Andrei.dat')
parser.add_argument('-p','--hcp',help='HCP directory. Ex. /data/nil-bluearc/vlassenko/HCP/sub')
parser.add_argument('-o','--out',help='Output bash script. Ex. 220502rmHcpScratch.sh')
args=parser.parse_args()

if args.dat:
    print(f'-d --dat {args.dat}')
    print(f'-p --hcp {args.hcp}')
    print(f'-o --out {args.out}')
else:
    exit()

#from rou.newlines import buf_count_newlines_gen
#ndat=buf_count_newlines_gen(DAT)

import os.path

with open(args.out,'w') as o0:
    o0.write('#!/bin/bash\n\n')
    with open(args.dat,encoding="utf8",errors='ignore') as f: 
        for line0 in f:
            if not line0.strip() or line0.startswith('#'):
                print(f"Skipping: {line0}")
                continue
            line1=line0.split()
            for j in range(4,8):
                if line1[j]=='NONE' or line1[j]=='NOTUSEABLE':continue
                c=[args.hcp+'/'+line1[0]+'/vglab/'+line1[j],args.hcp+'/'+line1[0]+'/vglab/'+line1[j]+'_slctmd']
                for i in c:
                    if os.path.isdir(i):
                        #print(f'{i} exists')
                        o0.write('rm -r '+i+'\n')
                    else:
                        #print(f'{i} does not exist')
                        pass
import os,stat
st=os.stat(args.out)
os.chmod(args.out,st.st_mode|0o0111)
print(f'Output written to {args.out}')







#!/usr/bin/env python3

P0='/home/usr/mcavoy/FIDL/build/fidl_subtract'

text='Subtract two images. Images may be 4dfp or nifti. Computation is performed by fidl_subtract.'
print(text)
print("--dat identifies subjects and runs. Only runs with motion < --thresh are used.")
print("Two --roots identify files to be subtracted. Files reside at --inpath.")
print("Computation is limited to a mask as culled from --hcp.")
import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-d','--dat',help='Input dat. Ex. 220217RES1.dat')
parser.add_argument('-t','--thresh',help='Movement must less than this value. Ex. 1.5')
parser.add_argument('-r','--roots',nargs='+',help='Input file roots. Ex. _zm_Left-Putamen _zm_Right-Caudate')
parser.add_argument('-i','--inpath',help='Path to input files. Ex. /vgpool/data1/mcavoy/HCP/conc_caudate/glm_LputRcaud/LputRcaud')
parser.add_argument('-p','--hcp',help='HCP directory. Ex. /data/nil-bluearc/vlassenko/HCP/sub')
parser.add_argument('-o','--out',help='Output bash script. Ex. /vgpool/data1/mcavoy/HCP/conc_caudate/glm_LputRcaud/LputRcaud/diff/220217RES1.sh')
args=parser.parse_args()

if args.dat:
    print(f'-d --dat {args.dat}')
    print(f'-r --roots {args.roots}')
    print(f'-i --inpath {args.inpath}')
    print(f'-o --out {args.out}')
    print(f'-p --hcp {args.hcp}')
    print(f'-t --thresh {args.thresh}')
else:
    exit()

b0="vglab/T1w/Results"
w0="vglab/T1w/wmparc.nii.gz"
m0="vglab/T1w/brainmask_fs.nii.gz"
c0="Movement_AbsoluteRMS_mean.txt"

thresh=float(args.thresh)

from contextlib import ExitStack

with open(args.out,'w') as o0:
    o0.write('#!/bin/bash\n\n')
    with open(args.dat,encoding="utf8",errors='ignore') as f:
        for line0 in f:
            if not line0.strip() or line0.startswith('#'):continue
            line1=line0.split()
            s0=line1[0].replace('/','_')
            print(s0)
            for j in range(4,8):
                print(f'    j={j} {line1[j]}')
         
                if line1[j]=='NONE' or line1[j]=='NOTUSEABLE':continue

                c=[args.hcp+'/'+line1[0]+'/'+b0+'/'+line1[j]+'/'+c0,args.hcp+'/'+line1[0]+'/'+b0+'/'+line1[j]+'_slctmd'+'/'+c0]
                try:
                    with open(c[0]) as f0:
                        lcc=0   
                except FileNotFoundError:
                    try:
                        with open(c[1]) as f0:
                            lcc=1 
                    except FileNotFoundError:
                        print(f"    {c[0]} and {c[1]} do not exist")
                        exit()

                with open(c[lcc]) as f0:
                    if float(f0.read()) >= thresh:
                        print(f'    {c[lcc]} EXCLUDED')     
                    else:
                        sub1=args.inpath+'/'+s0+'_'+line1[j]+args.roots[0]+'.nii.gz'
                        sub2=args.inpath+'/'+s0+'_'+line1[j]+args.roots[1]+'.nii.gz'
                        try:
                            with ExitStack() as stack:
                                files = [stack.enter_context(open(fname)) for fname in [sub1,sub2]]
                        except FileNotFoundError:
                            print(f"    Problem opening either {sub1} or {sub2}")
                            exit()
                        o0.write('F1='+sub1+'\n'+'F2='+sub2+'\n')

                        m1=args.hcp+'/'+line1[0]+'/'+m0
                        try:
                            with open(m1) as m2:
                                o0.write(f'MASK={m1}\n')
                        except FileNotFoundError:
                            print(f"    {m1} does not exist. Subtraction will not be masked.")

                        o0.write('OUT='+s0+'_'+line1[j]+args.roots[0]+'-'+args.roots[1]+'\n')
                        o0.write(P0+' -f1 $F1 -f2 $F2 -mask $MASK -out $OUT\n\n')

import os,stat
st=os.stat(args.out)
os.chmod(args.out,st.st_mode|0o0111)
print(f'Output written to {args.out}')

#!/usr/bin/env python3

text='Average motion values across runs. Output is nifti or text depending on provided extension. First value is the first subject.'
print(text)
print("--dat identifies subjects and runs. Only runs with motion < --thresh are used.")
import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-d','--dat',help='Input dat. Ex. 220217RESg123mf.dat')
parser.add_argument('-t','--thresh',help='Movement must less than this value. Ex. 1.5')
parser.add_argument('-p','--hcp',help='HCP directory. Ex. /data/nil-bluearc/vlassenko/HCP/sub')
parser.add_argument('-o','--out',help='Output. Ex. 220217RESg123mf_motion.nii.gz or 220217RESg123mf_motion.nii, output will be nifti. Anything else will be text.')
parser.add_argument('-0','--zeromean',help='Motion is zero mean',action="store_true")
args=parser.parse_args()

if args.dat:
    print(f'-d --dat {args.dat}')
    print(f'-t --thresh {args.thresh}')
    print(f'-p --hcp {args.hcp}')
    print(f'-o --out {args.out}')
else:
    exit()
if args.zeromean:
    print(f'-0 --zeromean {args.zeromean}')

b0="vglab/T1w/Results"
c0="Movement_AbsoluteRMS_mean.txt"

thresh=float(args.thresh)

#out=args.out
#idx=args.out.rfind('.nii')
#if idx != -1:out=args.out[:idx]
#out+='.nii.gz'

import numpy as np

motion0=[]
with open(args.dat,encoding="utf8",errors='ignore') as f:
    for line0 in f:
        if not line0.strip() or line0.startswith('#'):continue
        line1=line0.split()
        s0=line1[0].replace('/','_')
        print(s0)

        motion=[]

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
                motion1=float(f0.read())
                if motion1 >= thresh:
                    print(f'    {c[lcc]} {motion1} EXCLUDED')
                else:
                    motion.append(motion1)
        if motion:   
            print(f'motion={motion} mean={np.mean(motion)}')
            motion0.append(np.mean(motion))

if args.zeromean:
    motion0=np.array(motion0)-np.mean(motion0)

idx=args.out.rfind('.nii')
if idx != -1:
    out=args.out[:idx]+'.nii.gz'
    converted_array=np.array(motion0,dtype=np.float32).reshape(1,1,1,len(motion0))
    import nibabel as nib
    nifti2=nib.Nifti2Image(converted_array,np.eye(4))
    nifti2.to_filename(out)
else:
    out=args.out
    with open(out,mode='wt',encoding='utf-8') as fileOutput:
        np.savetxt(out,motion0,fmt='%.4f')

print(f'Output written to {out}')

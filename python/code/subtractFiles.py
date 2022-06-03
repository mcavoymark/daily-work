#!/usr/bin/env python3

text='Subtract two text files. Each file is single column of numbers with a label at the top.'
print(text)
import argparse
parser=argparse.ArgumentParser(description=text,formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-f','--files',nargs='+',help='Input file(s). Ex. 220217RES1_WMHmf_ho_Left-Putamen.ext 220217RES1_WMHmf_ho_Right-Caudate.ext')
parser.add_argument('-l','--label',help='Label to be added at top of text file. Ex. hoLput-hoRcaud')
parser.add_argument('-o','--out',help='Output name. Ex. 220217RES1_WMHmf_ho_Left-Putamen-Right-Caudate.ext')
args=parser.parse_args()

if args.files:
    print(f'-f --files {args.files}')
    print(f'-l --label {args.label}')
    print(f'-o --out   {args.out}')

from rou.newlines import check_newlines
cnt0=check_newlines(args.files)
if(cnt0==-1):exit()

from contextlib import ExitStack

try:
    with ExitStack() as stack:
        files = [stack.enter_context(open(fname)) for fname in args.files]
        with open(args.out,mode='wt',encoding='utf-8') as fileOutput:
            fileOutput.write(args.label+'\n')
            for j in files:j.readline().rstrip('\t\n')
            for j in range(cnt0-1):
                #fileOutput.write("{:.4f}".format(float(files[0].readline().rstrip('\t\n'))-float(files[1].readline().rstrip('\t\n')))+'\n')
                fileOutput.write(str(round(float(files[0].readline().rstrip('\t\n'))-float(files[1].readline().rstrip('\t\n')),4))+'\n')
except FileNotFoundError:
    print(f"    Problem opening either {sub1} or {sub2}")
    exit()
print("    Output written to "+args.out)

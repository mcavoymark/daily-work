#!/usr/bin/env python3

#google: python3 read text file to multidimensional array

print("Concatenate files horizontally to build design matrices.")
print("This program is special because it loops through the PET measures.")

def buf_count_newlines_gen(fname):
    def _make_gen(reader):
        while True:
            b = reader(2 ** 16)
            if not b: break
            yield b

    with open(fname, "rb") as f:
        count = sum(buf.count(b"\n") for buf in _make_gen(f.raw.read))
    return count

def check_newlines(str0):
    cnt0 = [0 for _ in range(len(str0))]
    for i in range(len(str0)):
        cnt0[i]=buf_count_newlines_gen(str0[i])
        print(str0[i],cnt0[i])
    if(all(i!=cnt0[0] for i in cnt0)):
        print("Files have different number of lines. Abort!")
        return -1 
    return cnt0[0] 



f0='/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01/ext/age_wmh0mean/210812RESedit_PET_WMH_g123groupAge.ext'
f1='/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01/ext/age_wmh0mean/210812RESedit_PET_WMH_g123wmh.ext'

path0='/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01/ext'
regf='PETregions.txt'
pet0=['fdg','ho','om'] 

o1='/vgpool/data1/mcavoy/HCP/conc/glm/Baseline/masknormMARMSm/glm_coding10/conc/220217/WMH/PET_DF01/ext/age_wmh0mean/reg/210812RESedit_PET_WMH_g123groupAgewmh_'


nreg=buf_count_newlines_gen(regf)
#print(regf+" has "+nreg+" regions")
print(f"{regf} has {nreg} regions")

cnt0=check_newlines([f0,f1])
if(cnt0==-1):exit()

with open(regf) as regp:
    for k in range(nreg):
        line0=regp.readline()
        if not line0.strip() or line0.startswith('#'):
            print(f"Skipping line {k+1}: {line0}")
            continue
        for l in pet0:
            str2=l+'_'+line0.strip('\n')
            f2=path0+'/'+str2+'.ext'
            #print(f2)
            cnt2=buf_count_newlines_gen(f2)
        if(cnt2!=cnt0):
                print(f"    {cnt2} lines. Must have {cnt0} lines. Abort!")
                exit()
            print(f2,cnt2)
            str0=[f0,f1,f2]
            str1 = ["" for _ in range(cnt0)]
            o0=o1+str2+'.ext'
            with open(o0,mode='wt',encoding='utf-8') as fileOutput:
                for i in range(len(str0)):
                    with open(str0[i]) as r0:
                        for j in range(cnt0):
                            #str1[j]=str1[j][:-1]
                            str1[j]+=r0.readline().strip('\n')
                for j in str1:
                    #j=j[:-1]+"\n"
                    j=j.rstrip('\t')+'\n'
                    fileOutput.write(j)
            print("    Output written to "+o0)

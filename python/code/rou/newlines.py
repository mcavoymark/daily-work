#!/usr/bin/env python3

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
        #print(str0[i],cnt0[i])
    if(all(i==cnt0[0] for i in cnt0)):
        return cnt0[0]
    print("Files have different number of lines. Abort!")
    return -1 

# daily-work  

It takes a lot time to write polished software that others can truly use.  However, if all you need to do is just get things done, then all that is needed is a tractable and trackable system.  

## bash
The bash directory features such a system.  The general approach is to keep track of the work in the "batch.sh" file.  It just stacks up day after day, call after call.  Truly, a fully functional 'how to' manual.  Preceding the called programs with a six digit date serves as a primitive and efficient revision system.  The general approach is to run a script that writes a script that will actually do the work.  This provides a fully functional "record file" and a fail-safe.  This implementation also supports a primitive but super efficient system of parallelization.  In a nutshell, you can do the menial work of four people, and still have time to conquer the more interesting things. 

The HCP directory features scripts that run a highly modified and customized version of the HCP minimal processing pipeline v3.27 (Glasser 2013), then more scripts for fidl for modeling and analysis.  
The cnda directory includes modified code from Sarah Keefe to download from the cnda and other code to place those dicoms in your own directories.  

## python  
Bash is fast to write, but slow to run, and what's all this hype about python3 anyway?  Turns out python3 is fast to write and run.  Using indentation instead of having to close loops and logical constructs is ingenious.  
This builds on the "bash" system above with the use of a "batch.sh" file to track the daily work, but is more refined with actual python code in the "code" directory. I also had a go at a real file naming system and the proper use of parameter calls with checks.  In short, unlike the eccentric "bash" system, the goal was to actually write programs others could use.  

## matlab
The most important program is the workhorse "barfreqandtcplotsemscat" plotting program which is compatible with fidl's column oriented text output. In practice, this program is copied to a working directory where it is customized as needed.  Matlab makes beautiful plots with quite a bit of control over just about everything that appears in the image.  

## R
Everybody knows a bit of R.  The most important use of R is not here, but within fidl with Rscript's written and run on the fly by C/C++ binaries.  

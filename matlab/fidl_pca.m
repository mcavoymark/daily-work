m = 303
n =  588
filename = 'x.dat'


[fid,message] = fopen(filename,'r');
if fid == -1 
    error(message)
end
[A,count] = fread(fid,[m,n],'double');
if count ~= m*n
    count
    m*n
    error('Incorrect number of elements read.')
end
X = A*A';
[V,D] = eig(X);
diag(D)
V(:,m)

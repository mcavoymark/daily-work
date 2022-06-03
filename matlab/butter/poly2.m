function c = poly2(x)

[m,n] = size(x)
if m == n
   % Characteristic polynomial (square x)
   disp('here')
   e = eig(x)
elseif (m==1) | (n==1)
   e = x;
else
   error('Argument must be a vector or a square matrix.')
end

% Strip out infinities
e = e( isfinite(e) )

% Expand recursion formula
n = length(e);
c = [1 zeros(1,n)];
for j=1:n
    c(2:(j+1)) = c(2:(j+1)) - e(j).*c(1:j);
end

% The result should be real if the roots are complex conjugates.
if isequal(sort(e(imag(e)>0)),sort(conj(e(imag(e)<0))))
    c = real(c);
end

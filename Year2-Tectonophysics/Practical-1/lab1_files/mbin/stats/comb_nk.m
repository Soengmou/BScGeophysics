function c = comb_nk(v,k)

%COMBNK All combinations of the N elements in V taken K at a time.
%   C = COMBNK(V,K) produces a matrix, with K columns. Each row of C has
%   K of the elements in the vector V. C has N!/K!(N-K)! rows.

%   B.A. Jones 2-17-95
%   Copyright 1993-2002 The MathWorks, Inc. 
%   $Revision: 2.12 $  $Date: 2002/01/17 21:30:22 $

[m, n] = size(v);

if min(m,n) ~= 1
   error('First argument has to be a vector.');
end

if n == 1
   n = m;
   flag = 1;
else
   flag = 0;
end

if n == k
   c = v(:)';
elseif n == k + 1
   tmp = v(:)';
   c   = tmp(ones(n,1),:);
   c(1:n+1:n.*n) = [];
   c = reshape(c,n,n-1);
elseif k == 1
   c = v.';
elseif n < 17 & (k > 3 | n-k < 4)
   rows = 2.^(n);
   ncycles = rows;

   for count = 1:n
      settings = (0:1);
      ncycles = ncycles/2;
      nreps = rows./(2*ncycles);
      settings = settings(ones(1,nreps),:);
      settings = settings(:);
      settings = settings(:,ones(1,ncycles));
      x(:,n-count+1) = settings(:);
   end

   idx = x(find(sum(x') == k),:);
   [nrows,junk]= size(idx);
   [rows,cols] = find(idx');
   c = reshape(v(rows),k,nrows)';
else 
   P = [];
   if flag == 1,
      v = v';
   end
   if k < n & k > 1
      for idx = 1:n-k+1
         Q = comb_nk(v(idx+1:n),k-1);
         P = [P; [v(ones(size(Q,1),1),idx) Q]];
      end
   end
   c = P;
end

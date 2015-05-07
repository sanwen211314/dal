% ds_dnorm - conjugate of the dual spectral norm regularizer
%
% Copyright(c) 2009 Ryota Tomioka
% This software is distributed under the MIT license. See license.txt
function [nm,ishard]=ds_dnorm(ww,blks)

nm=0;

if isnumeric(ww)
ix0=0;
for kk=1:size(blks,1)
  blk=blks(kk,:);
  I=ix0+(1:blk(1)*blk(2));
  ix0=I(end);
  nm=max(nm,pca(reshape(ww(I),blk),1,10));
end
else
  nm=pca(ww,1,10);
end
ishard=1;
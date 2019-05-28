function dh = d2entropy(nmat)
% D2ENTROPY 2-tuple duration entropy
%
% dh = d2entropy(nmat)
%
% It calculates the Shannon's entropy of the 2-tuple duration distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% dh: pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

d=ddist2(nmat);
dh=shentropy(d);

end
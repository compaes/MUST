function dh = d1entropy(nmat)
% D1ENTROPY duration entropy
%
% dh = d1entropy(nmat)
%
% It calculates the Shannon's entropy of the duration distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% dh: pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

d=ddist1(nmat);
dh=shentropy(d);

end
function dh = d3entropy(nmat)
% D3ENTROPY 3-tuple duration entropy
%
% dh = d3entropy(nmat)
%
% It calculates the Shannon's entropy of the 3-tuple duration distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% dh: pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

d=ddist3(nmat);
dh=shentropy(d);

end
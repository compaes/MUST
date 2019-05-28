function ph = p2entropy(nmat)
% P2ENTROPY 2-tuple pitch entropy
%
% ph = p2entropy(nmat)
%
% It calculates the Shannon's entropy of the 2-tuple pitch distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ph: 2-tuple pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

p=pdist2(nmat);
ph=shentropy(p);

end
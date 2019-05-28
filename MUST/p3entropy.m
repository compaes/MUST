function ph = p3entropy(nmat)
% P3ENTROPY 3-tuple pitch entropy
%
% ph = p3entropy(nmat)
%
% It calculates the Shannon's entropy of the 3-tuple pitch distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ph: 3-tuple pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

p=pdist3(nmat);
ph=shentropy(p);

end
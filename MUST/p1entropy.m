function ph = p1entropy(nmat)
% P1ENTROPY pitch entropy
%
% ph = p1entropy(nmat)
%
% It calculates the Shannon's entropy of the pitch distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ph: pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

p=pdist1(nmat);
ph=shentropy(p);

end
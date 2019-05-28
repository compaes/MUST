function ih = i1entropy(nmat)
% I1ENTROPY interval entropy
%
% ih = i1entropy(nmat)
%
% It calculates the Shannon's entropy of the interval distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ih: interval entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

i=idist1(nmat);
ih=shentropy(i);

end
function ih = i2entropy(nmat)
% I2ENTROPY 2-tuple pitch entropy
%
% ih = i2entropy(nmat)
%
% It calculates the Shannon's entropy of the 2-tuple interval distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ih: 2-tuple interval entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

i=idist2(nmat);
ih=shentropy(i);

end
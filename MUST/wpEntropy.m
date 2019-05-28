function wpe=wpEntropy(nmat)
% wpEntropy Weighted permutation entropy
%
% wpe = wpEntropy(nmat)
%
% It calculates the weighted permutation entropy of the pitch sequence in notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% wpe: Weighted permutation entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

    p=pitch(nmat);
    pp(1:13)=0;
    for j=1:length(p)-2
        index=ordersign(p(j),p(j+1),p(j+2));
        pp(index)=pp(index)+std(p(j:j+2));
    end
    pp=pp/sum(pp);
    pp=pp(find(pp~=0));
    wpe = -sum(pp .* log(pp));
end
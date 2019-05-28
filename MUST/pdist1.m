function [pd pvals] = pdist1(nmat)
% PDIST1 Pitch distribution
%
% [pd pvals] = pdist1(nmat)
%
% It calculates the pitch distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% pvals: Vector containing all pitches that appear in the notematrix nmat.
% pd: Vector containing the frequency of appearance of each pitch in pvals.
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

if isempty(nmat), return; end

p=nmat(:,4);

pvals = unique(p);

for k=1:length(pvals)    
    pd(k)=sum((p==pvals(k)));
end

pd=pd/sum(pd);

end

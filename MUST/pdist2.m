function [pd pvals] = pdist2(nmat)
% PDIST2 2-tuple pitch distribution
%
% [pd pvals] = pdist2(nmat)
%
% It calculates the 2-tuple pitch distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% pvals: Vector containing all 2-note sequences that appear in the notematrix nmat
% pd: Vector containing the frequency of appearance of each 2-note sequence in pvals
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)



if isempty(nmat), return; end
if ~ismonophonic(nmat), disp([mfilename, ' works only with monophonic input!']); pcd=[]; return; end

p=nmat(:,4);
du = duraccent(dur(nmat,'sec')); % durations are weighted using Parncutt's durational accent

for i=1:length(p)-1
    pairs(i,:)=[p(i) p(i+1)];
end

pvals = unique(pairs,'rows');

for k=1:size(pvals,1)
    pd(k)=0;
    I=find(all(pairs==pvals(k,:),2));
    for i=1:length(I)
        j=I(i);
        pd(k)=pd(k)+1;%*du(j)*du(j+1);
    end
end

pd=pd/sum(pd);


end


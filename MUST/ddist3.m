function [dd dvals] = ddist3(nmat)
% DDIST3 3-tuple duration distribution
%
% [dd dvals] = ddist1(nmat)
%
% It calculates the 3-tuple duration distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% dvals: Vector containing all sequences of 3 consecutive rhythmic figures (durations in beats) that appear in the notematrix nmat
% dd: Vector containing the frequency of appearance of each 3-note rhythmic pattern in dvals
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)



if isempty(nmat), return; end
if ~ismonophonic(nmat), disp([mfilename, ' works only with monophonic input!']); pcd=[]; return; end


d=nmat(1:end-1,2);
d=round(d,2);


for k=1:length(d)-2
    triples(k,:)=[d(k) d(k+1) d(k+2)];
end
if exist('triples')==0
    triples(1,:)=[1 1 1];
end

dvals = unique(triples,'rows');

for k=1:size(dvals,1)
    dd(k)=0;
    I=find(all(triples==dvals(k,:),3));
    for i=1:length(I)
        j=I(i);
        dd(k)=dd(k)+1;
    end
end

dd=dd/sum(dd);


end

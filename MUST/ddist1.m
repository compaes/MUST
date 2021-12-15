function [dd dvals] = ddist1(nmat)
% DDIST1 Duration distribution
%
% [dd dvals] = ddist1(nmat)
%
% It calculates the duration distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% dvals: Vector containing all rythmic figures (durations in beats) that appear in the notematrix nmat
% dd: Vector containing the frequency of appearance of each rythmic figure in dvals
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

if isempty(nmat), return; end

d=nmat(1:end-1,2);
d=round(d,2);

dvals = unique(d);

for k=1:length(dvals)    
    dd(k)=sum((d==dvals(k)));
end

dd=dd/sum(dd);

end
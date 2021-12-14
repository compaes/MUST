function [id ivals] = idist1(nmat)
% IDIST1 interval distribution
%
% [id ivals] = idist1(nmat)
%
% It calculates the interval distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ivals: Vector containing all intervals that appear in the notematrix nmat
% id: Vector containing the frequency of appearance of each interval in ivals
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)


if isempty(nmat), return; end
if ~ismonophonic(nmat), disp([mfilename, ' works only with monophonic input!']); pcd=[]; return; end

[p2d, p2vals]=pdist2(nmat);

pairs=diff(p2vals,1,2);
ivals=unique(pairs, 'rows');

for k=1:size(ivals,1)
    id(k)=0;
    I=find(all(pairs==ivals(k,:),2));
    for i=1:length(I)
        j=I(i);
        id(k)=id(k)+p2d(j);
    end
end



end

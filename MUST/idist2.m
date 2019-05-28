function [id ivals] = idist2(nmat)
% IDIST2 2-tuple interval distribution
%
% [id ivals] = idist2(nmat)
%
% It calculates the 2-tuple interval distribution of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ivals: Vector containing all 2-interval sequences that appear in the notematrix nmat
% id: Vector containing the frequency of appearance of each 2-interval sequence in ivals
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)


if isempty(nmat), return; end
if ~ismonophonic(nmat), disp([mfilename, ' works only with monophonic input!']); pcd=[]; return; end

[p3d, p3vals]=pdist3(nmat);

pairs=diff(p3vals,1,2);
ivals=unique(pairs, 'rows');

for k=1:size(ivals,1)
    id(k)=0;
    I=find(all(pairs==ivals(k,:),2));
    for i=1:length(I)
        j=I(i);
        id(k)=id(k)+p3d(j);
    end
end



end


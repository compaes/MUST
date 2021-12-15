function y=asymTotal(nmat)
% asymTotal Total asymmetry
%
% y=asymTotal(nmat)
%
% It calculates the total asymmetry of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Total asymmetry
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

pitch=nmat(:,4);
onset =nmat(:,1);
onset = onset-onset(1);
duration=nmat(:,2);
T=onset(end)+duration(end);

j=1;
normal = [];
for t=0:0.0001:T
    if j<length(onset) && t>=onset(j+1)
        j=j+1;
    end
    if t < onset(j)+duration(j)
        normal = [normal pitch(j)];
    end
end

asym=abs(normal-fliplr(normal));
y=sum(asym)/size(asym,2);
end

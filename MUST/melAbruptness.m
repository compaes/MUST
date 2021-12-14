function y=melAbruptness(nmat)
% melAbruptness Melodic abruptness
%
% It calculates the melodic abruptness of notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Melodic abruptness
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

N=size(nmat,1);
p=nmat(:,4);
o=nmat(:,6);
d=nmat(:,7);
D=o(end)+d(end);
da=duraccent(d);
da=d;
n=length(p);
y=0;
for i=2:n-1
    if (p(i+1)-p(i))*(p(i)-p(i-1))<0
        meanint=(abs(p(i+1)-p(i))+abs(p(i)-p(i-1)))/2;
        y=y+log(meanint+1);
    end
end

norm=sum(nmat(end,6:7));
y=y/norm;
    
end
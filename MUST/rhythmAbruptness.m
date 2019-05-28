function y=rythmAbruptness(nmat)
% rythmAbruptness Rythmic abruptness
%
% It calculates the rhythmic abruptness of notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Rhythmic abruptness
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

d=dur(nmat);
d=duraccent(d);
N=size(nmat,1);
n=length(d);
j=1;
for i=1:length(d)-1
    if (d(i+1)>d(i))&(d(i)>0)
        r(j)=d(i+1)/d(i);
        j=j+1;
    elseif (d(i+1)<=d(i))&(d(i+1)>0)
        r(j)=d(i)/d(i+1);
        j=j+1;
    end
end
y=mean(r);
end
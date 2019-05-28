function y=durAbruptness(nmat)
% durAbruptness Durational abruptness
%
% It calculates the durational abruptness of notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Durational abruptness
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

N=size(nmat,1);
p=nmat(:,4);
o=onset(nmat,'sec');
d=dur(nmat,'sec');
D=o(end)+d(end);
da=duraccent(d);
da=d;
n=length(p);
y=0;
for i=2:n-1
    j=da(i);
    if (p(i+1)-p(i))*(p(i)-p(i-1))<0
            y=y+j;
    end
end
norm=sum(da);
y=y/norm;
end
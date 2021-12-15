function y=biUnbalance(nmat)
% biUnbalance Bisect unbalance
%
% y=biUnbalance(nmat)
%
% It calculates the bisect unbalance of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Bisect unbalance
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

    onset=nmat(:,1);
    duration=nmat(:,2);
    N=size(onset,1);
    T=onset(end)+duration(end)-onset(1);
    f1=sum(onset<T/2)/N;
    f2=sum(onset>=T/2)/N;
    y=1-4*f1*f2;
   
end

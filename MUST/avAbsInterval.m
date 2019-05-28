function y=avAbsInterval(nmat)
% avAbsInterval Average absolute interval
%
% It calculates the average absolute interval of notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Average absolute interval
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

p=pitch(nmat);
intervals=diff(p);
y=mean(log(abs(intervals)+1));

end
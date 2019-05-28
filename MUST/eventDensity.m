function ed = eventDensity(nmat)
% eventDensity Event density
%
% ed = eventDensity(nmat)
%
% It calculates the event density expressed in note events per time unit (s).
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% ed: Event density
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

N=nnotes(nmat);
ed=N/sum(nmat(end,6:7));


end


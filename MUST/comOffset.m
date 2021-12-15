function y=comOffset(nmidi)
% comOffset Center of mass offset
%
% y=comOffset(nmat)
%
% It calculates the center of mass offset of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Center of mass offset
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

    onset =nmidi(:,1);
    duration=nmidi(:,2);
    
    T=onset(end)+duration(end)-onset(1);
    temporal_center=1/2;
    
    mass_center=mean(onset)/T;

    y=abs(mass_center-temporal_center);
end

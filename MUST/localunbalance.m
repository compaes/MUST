function [y ct w]=localunbalance(nmat,wlength,wstep)
% LOCALUNBALANCE Local unbalance
%
% [y ct w]=localunbalance(nmat,wlength,wstep)
%
% It calculates the local unbalance curve of the notematrix nmat using a
% sliding time window approach.
%
% INPUT
% nmat: Notematrix
% wlength (optional): Sliding window length. If the passed argument is a float the
% sliding window length is specified in seconds. If it is a string
% containing an integer, the sliding window length is specified in number
% of note events expected per time window, i.e., the window length is
% chosen to be wlength*T/(N-1), where T is the total time elapsed between
% the first and the last note events in nmat, and N is the number of note
% events. Default: '2'.
% wstep (optional): Sliding window step. If wlength is passed as a float,
% wstep determines the sliding window step in seconds. If not specified, it
% is equal to wlength. If wlength is passed as a string, wstep determines
% the sliding window step as a fraction of the sliding window length.
%       
% OUTPUT
% y: Local unbalance curve. Vector containing the local event density (number of note events in
% each time window divided by the window length) normalized by the global
% event density of the stimulus.
% ct: Vector containing the time distance between each time window and the
% temporal center of the stimulus (T/2) normalized by the maximum distance,
% i.e., divided by T/2.
% w: Sliding window length in seconds.
%
% Example:
% [y ct w]=localunbalance(nmat,'2',0.5);
%
% Example:
% [y ct w]=localunbalance(nmat,1.5,0.5);
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

if ~exist('wlength','var')
  wlength = '2';
end
if ~exist('wstep','var')
  wlength = wlength;
end

onset =nmat(:,1);
N=size(onset,1);
T=onset(end)-onset(1);
if isfloat(wlength)&isfloat(wstep)
    localexpecteddens=(N-1)/T;
elseif isstr(wlength)
    nnotes=str2num(wlength);
    expecteddur=T/(N-1);
    localexpecteddens=(N-1)/T;
    wlength=expecteddur*nnotes*1;
    wstep=wstep*wlength;
end
j=1;
for t=0:wstep:onset(end)-wlength
    y(j)=sum((round(onset,3)>=round(t,3)).*(round(onset,3)<round(t+wlength,3)))/wlength/localexpecteddens;
    ct(j)=abs((  t+(wlength/2)  -(T/2)))/(T/2);
    j=j+1;
end
if j==1
    y(1)=1;
    ct(1)=0;
end
w=wlength;
end
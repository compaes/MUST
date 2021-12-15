function y=eventHeterogeneity(nmat,wlength,wstep)
% eventHeterogeneity Event heterogeneity
%
% y=eventHeterogeneity(nmat,wlength,wstep,weighting)
%
% It calculates first the local unbalance curve of the notematrix nmat using a
% sliding window approach and then finds its event heterogeneity.
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
% y: Event heterogeneity
%
% Example:
% y=eventHeterogeneity(nmat,'2',0.5);
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)


if ~exist('wlength','var')
  wlength = '2';
end

[dens, ct, w]=localunbalance(nmat,wlength,wstep);
onset =nmat(:,1);
duration=nmat(:,2);
T=onset(end)+duration(end)-onset(1);
S=size(dens,2);
pond=ct;
y=sum(((dens-1).^2).*pond)/sum(pond);

end

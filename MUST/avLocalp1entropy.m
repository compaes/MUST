function ph = avLocalp1entropy(nmat,wlength,wstep)
% avLocalp1entropy Average local pitch entropy
%
% ph = avLocalp1entropy(nmat)
%
% It first calculates the pitch distribution of the notematrix nmat in sliding windows
% of length wlength and with advancing step wstep. It then calculates the
% Shannon's entropy of the pitch distribution in each time window and
% extract the average across windows.
%
% INPUT
% nmat: Notematrix
% wlength (optional): Sliding window length (in seconds). Default to 1 s
% wstep (optional): Sliwind window step (in seconds). Default to 0.25 s
%       
% OUTPUT
% ph: Average local pitch entropy
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

if ~exist('wlength','var')
  wlength = 1;
end
if ~exist('wstep','var')
  wstep = 0.25;
end

ph=mean(movewindow(nmat,wlength,wstep,'sec','pdist1','shentropy'));

end
function h = shentropy(d)
% SHENTROPY Shannon's entropy
%
% h = shentropy(d)
%
% It calculates the Shannon's entropy of the distribution d.
%
% INPUT
% d: Vector containing the frequencies of the distribution
%       
% OUTPUT
% h: Total entropy (unnormalized)
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

d=d/sum(d); % Check that d adds up to 1.
logd = log(d);
h = -sum(d.*logd); 
   
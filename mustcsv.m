% Before running anything:
% addpath('./MUST')
% addpath('./miditoolbox')

% Choose a stimulus directory
stimDir = './Natmust_MusicXML_CSV+MIDI/';
% stimDir = uigetdir; % Use this if you would rather select folder in GUI

% Process all CSV files in this directory
stimFiles = dir(fullfile(stimDir, '*.csv'));

% Sort files by index within each category (S,B,C,K)
snd=@(xs) xs(2);
filenum = cellfun(@(x)snd(sscanf(x,'%c%d.csv',2)), {stimFiles.name});
[~,Sidx] = sort(filenum);
stimFilesSorted = stimFiles(Sidx);

nFiles = length(stimFiles);

% This is our table
rows = struct( ...
    'stimulus', {}, ...
    'bisectUnbalance', {}, ...
    'centerMassOffset', {}, ...
    'eventHeterogeneity', {}, ...
    'avAbsInterval', {}, ...
    'melAbruptness', {}, ...
    'durAbruptness', {}, ...
    'rhythmAbruptness', {}, ...
    'asymTotal', {}, ...
    'asymIndex', {}, ...
    'eventDensity', {}, ...
    'avLocalp1entropy', {}, ...
    'p1entropy', {}, ...
    'p2entropy', {}, ...
    'p3entropy', {}, ...
    'i1entropy', {}, ...
    'i2entropy', {}, ...
    'd1entropy', {}, ...
    'd2entropy', {}, ...
    'd3entropy', {}, ...
    'wpEntropy', {} ...
 );

% Build CSV
for i = 1:nFiles
  baseFileName = stimFilesSorted(i).name;
  fileSplit = split(baseFileName, '.');
  mustName = fileSplit{1};
  fullFileName = fullfile(stimDir, baseFileName);
  fprintf(1, 'Processing: %s (%s)\n', mustName, fullFileName);
  
  % Load CSV
  ntab = readtable(fullFileName,'HeaderLines', 1);
  nmatFull = table2array(ntab);
  % Filter for note events(first column == 1)
  nmat = nmatFull(nmatFull(:,1) == 1, 2:end);
  % Ensure onset column (in beats), starts at 0.0
  nmat(:,1) = nmat(:,1) - nmat(1,1);
  
  % Load MIDI - not necessary if loading from CSV (created by createmidimats.py)
  %nmat = readmidi(fullFileName);
  % Ensure onset column (in beats), starts at 0.0
  %nmat(:,1) = nmat(:,1) - nmat(1,1);
  %nmat(:,2) = 0.25*round(nmat(:,2)/0.25);
  % Assert that this should be monophonic
  %assert(ismonophonic(nmat,0) == 1);
  
  % Process
  rows(i).stimulus = mustName;
  rows(i).bisectUnbalance = biUnbalance(nmat);
  rows(i).centerMassOffset = comOffset(nmat);
  rows(i).eventHeterogeneity = eventHeterogeneity(nmat,'2',0.5);
  rows(i).avAbsInterval = avAbsInterval(nmat);
  rows(i).melAbruptness = melAbruptness(nmat);
  rows(i).durAbruptness = durAbruptness(nmat);
  rows(i).rhythmAbruptness = rhythmAbruptness(nmat);
  rows(i).asymTotal = asymTotal(nmat);
  rows(i).asymIndex = asymIndex(nmat);
  rows(i).eventDensity = eventDensity(nmat);
  rows(i).avLocalp1entropy = avLocalp1entropy(nmat);
  rows(i).p1entropy = p1entropy(nmat);
  rows(i).p2entropy = p2entropy(nmat);
  rows(i).p3entropy = p3entropy(nmat);
  rows(i).i1entropy = i1entropy(nmat);
  rows(i).i2entropy = i2entropy(nmat);
  rows(i).d1entropy = d1entropy(nmat);
  rows(i).d2entropy = d2entropy(nmat);
  rows(i).d3entropy = d3entropy(nmat);
  rows(i).wpEntropy = wpEntropy(nmat);

end

results = struct2table(rows)

writetable(results, 'results_mustmeasures.csv')

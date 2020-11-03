%% Chapter1: Loading Data in EEGLAB
%Source: https://sccn.ucsd.edu/wiki/I.1:_Loading_Data_in_EEGLAB
%Script was created by using eegh command

%Tugce Gurbuz

%% Start the eeglab
clc; clear;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

%% Change the directory
cd '/home/tugce/Documents/MATLAB/eeglab_current/eeglab2019_1/'

%% Load the dataset
EEG = pop_loadset('filename','eeglab_data.set','filepath', ...
    '/home/tugce/Documents/MATLAB/eeglab_current/eeglab2019_1/sample_data/');

%% Save the data
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
ALLEEG(1).setname = 'Continuous EEG Data-Chapter1';
%% Explore the event values
%Check the internal consistency of the modified dataset
EEG = eeg_checkset( EEG );
%Explore event values
% EEG=pop_chanedit(EEG, 'lookup',...
%     '/data/matlab/eeglab/plugins/dipfit/standard_BESA/standard-10-5-cap385.elp',...
%     'load',{'/data/matlab/eeglab/sample_data/eeglab_chan32.locs' 'filetype' 'autodetect'});

%% Edit the description about the dataset
EEG.comments = pop_comments('', '', strvcat('EEGLAB Tutorial Dataset',' ', ...
    'During this selective visual attention experiment,',...
    'stimuli appearedbriefly in any of five squares',...
    'arrayed horizontally above a central fixation cross.',...
    'In each experimental block, one (target) box was',...
    'differently colored from the rest Whenever a square',...
    'appeared in the target box the subject was asked to',...
    'respond quickly with a right thumb button press. If',...
    'the stimulus was a circular disk, he was asked to',...
    'ignore it. (Reference: Makeig et al.. J. Neurosci.','19:2665-80, 1999)',...
    ' ','These data were constructed by concatenating',...
    'three-second epochs from one subject, each containing',...
    'a target square in the attended location (''square''','events, left-hemifield locations 1 or 2 only)',...
    'followed by a button response (''rt'' events). The data',...
    'were stored in continuous data format to illustrate',...
    'the process of epoch extraction from continuous data.',' '));

%% Update the data
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

%% Scrolling through the data, by following operations
%Check the internal consistency of the modified dataset
EEG = eeg_checkset( EEG );
%Open data display window
pop_eegplot( EEG, 1, 1, 1);
%Change visual scale to 50 microvolts through the GUI
%Adjust the width of the scrolling window to 10 seconds through the GUI
%Adjust number of channels to display to 16 through GUI
%Zoom in and out to data through GUI
%Add x and y axis grid lines through GUI

%% Reject the data
%Check the internal consistency of the modified dataset
EEG = eeg_checkset( EEG );
%Open data display window
%pop_eegplot( EEG, 1, 1, 1);
%Reject the data in given time window
EEG = eeg_eegrej( EEG, [363 522] );
%Save it as a new data set and show it
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', ...
    'Continuous EEG Data-Chapter1-Rejected','gui','off');
fprintf('\n\nNote: Now we have 2 datasets, first one is the original dataset, the second one is the rejected dataset.\n\n')
%Delete the second data set from the memory
EEG = pop_delset( EEG, [2] );
fprintf('\n\nNote: Now we deleted the second dataset.\n\n')

%Switch back to first data set
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0); 
fprintf('\n\nNote: Now we switched back to first dataset.\n\n')

%% Save the current EEG data that is EEG variable
save('eegdata_chapter1.mat','EEG')
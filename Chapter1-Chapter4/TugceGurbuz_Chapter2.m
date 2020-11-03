%% Chapter2: Channel Locations
%Source: https://sccn.ucsd.edu/wiki/I.2:_Channel_Locations
%eegh command didn't show the following commands. Thus, I used the
%following tutorial: https://sccn.ucsd.edu/wiki/Chapter_02:_Writing_EEGLAB_Scripts#Basic_scripting_examples

%Tugce Gurbuz

%% Load channel location information
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{'/home/tugce/Documents/MATLAB/eeglab_current/eeglab2019_1/sample_data/eeglab_chan32.locs', 'filetype', 'autodetect'});

%% Plot channel Locations 2D through GUI
figure; 
topoplot([],EEG.chanlocs, 'style', 'blank', 'electrodes', 'labelpoint');

%% Save the current EEG data that is EEG variable
save('eegdata_chapter2.mat','EEG')
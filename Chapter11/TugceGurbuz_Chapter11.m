%% Chapter11: Time/Frequency Decomposition
%Source: https://sccn.ucsd.edu/wiki/Chapter_11:_Time/Frequency_decomposition
%Script was created by using eegh command

%Tugce Gurbuz
clc; clear;
%% Start eeglab and load the dataset from chapter 4: Directory should be specific to user
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

try
   EEG = pop_loadset('filename','eegdata_ch5_step8_baseline_removed.set',...
       'filepath','/home/tugce/Documents/MATLAB/eeglab_current/eeglab2019_1/EEG_HW2/data(CH4-CH5)/');
catch
    warning('Please change the directory to load the data of chapter-5, step-8')
end

% Save the data
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

%% 1.1. Decomposing The Channel Data
%%Perform the time-frequency analysis for the following channels:  O1, O2, C3, C4, F3, and F4
channel_nums = [30, 32, 12, 13, 3, 5];
channel_names = {'O1', 'O2', 'C3', 'C4', 'F3','F4'};
for i=1:6
    %Check the internal consistency of the modified dataset
    EEG = eeg_checkset( EEG );
    channel_num = channel_nums(i);
    channel_name = channel_names{i};
    figure; 
    pop_newtimef( EEG, 1, channel_num, [-1000  1992], [3         0.5] , ...
        'topovec', channel_num, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo,...
        'caption', channel_name, 'baseline',[0], 'alpha',0.01, 'plotphase', 'off', 'padratio', 1, 'winsize', 128);
    % Save figures as .png
    saveas(gcf,[channel_name,'.png'])
end


%% 1.4. Plotting ERSP time course and topography
channel_nums = [30, 32, 12, 13, 3, 5];
channel_names = {'O1', 'O2', 'C3', 'C4', 'F3','F4'};
for i=1:6
    %Check the internal consistency of the modified dataset
    EEG = eeg_checkset( EEG );
    channel_num = channel_nums(i);
    channel_name = channel_names{i};
    figure;
    pop_erpimage(EEG,1, [channel_num],[[]],channel_name,10,1,{ 'rt'},[-200  800],'latency' ,...
    'yerplabel','\muV','erp','on','cbar','on','topo', { [channel_num] EEG.chanlocs EEG.chaninfo } );
end


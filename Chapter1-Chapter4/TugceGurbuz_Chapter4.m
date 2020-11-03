%% Chapter4: Preprocessing Tools
%Source: https://sccn.ucsd.edu/wiki/I.4:_Preprocessing_Tools
%Script was created by using eegh command

%Tugce Gurbuz

%% Change data sampling rate
%Check the internal consistency of the modified dataset
%EEG = eeg_checkset( EEG );
%Change sampling rate to 128
EEG = pop_resample( EEG, 128);
%Save as a new data set and show it
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 

%% Filter the data
%Remove linear trends by applying high-pass filter (i.e., ignore
%frequencies below 1 Hz)
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1);
%Save it as a new dataset
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
%Plot the channel spectra maps to see the filtering artifacts
EEG = eeg_checkset( EEG );
figure; 
pop_spectopo(EEG, 1, [0      238304.6875], 'EEG' , 'percent', 15, ...
    'freq', [6 10 22], 'freqrange',[2 25],'electrodes','off');

%% Re-reference the data
%Convert data set to average reference
EEG = eeg_checkset( EEG );
EEG = pop_reref( EEG, []);
%Save the new data by over-writing
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'overwrite','on', ...
    'gui','off'); 

%Complicated re-referencing example can be if you recorded data referenced 
%to Cz and you want to re-reference the data to linked mastoid. Let's do 
%this example

%Declare Cz as the reference in the channel editor
EEG=pop_chanedit(EEG, 'append',1,'changefield',{2 'labels' 'Cz'},...
    'changefield',{2 'theta' '0'},'changefield',{2 'radius' '0'},...
    'changefield',{2 'X' '5.2047e-15'},'changefield',{2 'Y' '0'},...
    'changefield',{2 'Z' '85'},'changefield',{2 'sph_theta' '0'},...
    'changefield',{2 'sph_phi' '90'},'changefield',...
    {2 'sph_radius' '85'},'setref',{'1:33' 'Cz'});
%Update the data
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

%% Save the current EEG data that is EEG variable
save('eegdata_chapter4.mat','EEG')
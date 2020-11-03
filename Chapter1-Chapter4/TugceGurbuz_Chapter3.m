%% Chapter3: Plotting Channel Spectra and Maps
%Source: https://sccn.ucsd.edu/wiki/I.3:_Plotting_Channel_Spectra_and_Maps
%Script was created by using eegh command

%Tugce Gurbuz
%% Plot channel spectra and the maps
%Check the internal consistency of the modified dataset
EEG = eeg_checkset( EEG );
%Plot with default values
figure; 
pop_spectopo(EEG, 1, [0      238304.6875], 'EEG' , 'percent', ...
    15, 'freq', [6 10 22], 'freqrange',[2 25],'electrodes','off');
%% Save the current EEG data that is EEG variable
save('eegdata_chapter3.mat','EEG')
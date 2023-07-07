
%% File Description:

% This script opens every jpeg file in a designated folder, 
% converts them to a pdf, & saves the pdf in a designated folder.

%% Define the directories
clc
clear

file_dir = 'C:\Users\rhpow\Documents\Work\Northwestern\Forearm EMG Atlas\';
save_dir = 'C:\Users\rhpow\Documents\Work\Northwestern\Forearm EMG Atlas\';

%% Loop through each file in the directory

file_extension = strcat(file_dir, '*.jpeg');
selected_files = dir(file_extension);

for ii = 1:length(selected_files)
    file_name = selected_files(ii).name(1:end-5);
    disp(file_name);
    file_jpeg = imread(strcat(file_dir, file_name, '.jpeg'));
    imshow(file_jpeg)
    saveas(gcf, fullfile(save_dir, file_name), 'pdf')
    close gcf
end

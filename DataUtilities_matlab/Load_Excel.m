function [xds_excel] = Load_Excel(Monkey, Date, Task)

%% Define the file location
base_excel_dir = 'C:\Users\rhpow\Documents\Work\Northwestern\Excel_Data\window_trial_gocue\Sorted\';

% Files & folders
dir_path = dir(base_excel_dir);
% Table of only files
files_in_path = struct2table(dir_path(~([dir_path.isdir])));

% Selected file
selec_file = contains(files_in_path.name, strcat(Date, '_', Monkey, '_', Task));

% Load the excel
try
    xds_excel = readtable(strcat(base_excel_dir, files_in_path.name{selec_file,1}));
catch
    disp('File cannot be found!')
    xds_excel = NaN;
end








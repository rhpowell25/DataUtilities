function [xds_excel] = Load_Excel(Date, Monkey, Task)

%% Define the file location
base_excel_dir = 'C:\Users\rhpow\Documents\Work\Northwestern\Excel_Data\window_trial_gocue_2\';

% Which targets do you want the mnovement phase firing rate calculated from? ('Max', 'Min', 'All')
tgt_mpfr = 'Max';

if strcmp(tgt_mpfr, 'Max')
    file_path = strcat(base_excel_dir, 'Max_Targets\');
end
if strcmp(tgt_mpfr, 'Min')
    file_path = strcat(base_excel_dir, 'Min_Targets\');
end
if strcmp(tgt_mpfr, 'All')
    file_path = strcat(base_excel_dir, 'All_Targets\');
end

% Files & folders
dir_path = dir(file_path);
% Table of only files
files_in_path = struct2table(dir_path(~([dir_path.isdir])));

% Selected file
selec_file = contains(files_in_path.name, strcat(Date, '_', Monkey, '_', Task));

% Load the excel
try
    xds_excel = readtable(strcat(file_path, files_in_path.name{selec_file,1}));
catch
    disp('File cannot be found!')
    xds_excel = NaN;
end








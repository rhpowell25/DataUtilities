function [xds_excel] = Find_Excel(xds)

%% Find the excel for a given xds file

% Date
file_name = xds.meta.rawFileName;
xtra_info = extractAfter(file_name, '_');
Date = erase(file_name, strcat('_', xtra_info));

% Task
if strcmp(xds.meta.task, 'multi_gadget')
    Task = 'PG';
else
    Task = xds.meta.task;
end

% Monkey
Monkey = xds.meta.monkey;

% Excel File Name
excel_name = strcat(Date, '_', Monkey, '_', Task);

% File path
file_path = strcat('C:\Users\rhpow\Documents\Work\Northwestern\Excel_Data\window_trial_gocue\Sorted\');
% Files & folders
dir_path = dir(file_path);
% Table of only files
files_in_path = struct2table(dir_path(~([dir_path.isdir])));

% Selected file
selec_file = contains(files_in_path.name, excel_name);

%% Load the excel file
xds_excel = readtable(strcat(file_path, files_in_path.name{selec_file,1}));


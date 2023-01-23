function [xds] = Load_XDS(Monkey, Date, Task, Morn_vs_Noon)

%% Define the file location
base_xds_dir = strcat('C:\Users\rhpow\Documents\Work\Northwestern\Monkey_Data\', Monkey, '\', Date, '\');

xds_dir = dir(strcat(base_xds_dir, '*.mat'));

% Find the names of each file
xds_names = strings;
if length(xds_dir) > 1
    for ii = 1:length(xds_dir)
        xds_names{ii,1} = xds_dir(ii).name;
    end
else
    xds_names{1,1} = xds_dir.name;
end

% Only look at the selected task
task_idx = contains(xds_names, Task);
xds_names = xds_names(task_idx);

% Identify the morning or afternoon file
if strcmp(Morn_vs_Noon, 'Morn') || strcmp(Morn_vs_Noon, 'Pre')
    xds_idx = find(contains(xds_names, 'Pre'));
end
if strcmp(Morn_vs_Noon, 'Noon') || strcmp(Morn_vs_Noon, 'Post')
    xds_idx = find(contains(xds_names, 'Post'));
end
if isnumeric(Morn_vs_Noon)
    xds_idx = Morn_vs_Noon;
end
file_name = xds_names{xds_idx};

% Display the drug used
if contains(file_name, 'Lex')
    disp('Drug Used: Lexapro')
elseif contains(file_name, 'Cyp')
    disp('Drug Used: Cyproheptadine')
elseif contains(file_name, 'Caff')
    disp('Drug Used: Caffeine')
elseif contains(file_name, 'Con')
    disp('Drug Used: Control')
end

% Load the xds file
load(strcat(base_xds_dir, file_name), 'xds')








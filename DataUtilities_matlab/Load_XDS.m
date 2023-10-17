function [xds] = Load_XDS(Monkey, Date, Task, Sorted, File_Tag)

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

% Sorted vs unsorted
if Sorted == 1
    sorted_idxs = or(contains(xds_names, '-s'), contains(xds_names, '-ms'));
    xds_names = xds_names(sorted_idxs);
else
    unsorted_idxs = and(~contains(xds_names, '-s'), ~contains(xds_names, '-ms'));
    xds_names = xds_names(unsorted_idxs);
end

% Identify the morning or afternoon file
if ischar(File_Tag)
    if strcmp(File_Tag, 'Morn') || strcmp(File_Tag, 'Pre')
        xds_idx = find(contains(xds_names, 'Pre'));
    elseif strcmp(File_Tag, 'Noon') || strcmp(File_Tag, 'Post')
        xds_idx = find(contains(xds_names, 'Post'));
    else
        File_suffix = strings;
        for ii = 1:length(xds_names)
            File_suffix{ii,1} = extractAfter(xds_names{ii,1}, Task);
        end
        xds_idx = find(contains(File_suffix, File_Tag));
        end
elseif isnumeric(File_Tag)
    File_suffix = strings;
    for ii = 1:length(xds_names)
        File_suffix{ii,1} = extractAfter(xds_names{ii,1}, Task);
    end
    xds_idx = find(contains(File_suffix, num2str(File_Tag)));
end
try
    file_name = xds_names{xds_idx};
catch
    xds = NaN;
    disp('File Could Not Be Found')
    return
end

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








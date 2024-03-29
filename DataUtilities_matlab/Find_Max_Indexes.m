function [max_tgt_rewarded_idxs] = Find_Max_Indexes(trial_table)

%% Extract the trial directions
target_dir_idx = trial_table.tgtDir;
unique_target_dirs = unique(target_dir_idx);

% Counts the number of directions used
num_dirs = length(unique_target_dirs);

% Pull the target centers of each succesful trial
tgt_Center_idx = trial_table.TgtDistance;

% Define the output variable
max_tgt_rewarded_idxs = [];

%% Begin the loop through all directions
for jj = 1:num_dirs

    %% Indexes for all rewarded trials
    total_rewarded_idx = find((strcmp(trial_table.result, 'R')) & (target_dir_idx == unique_target_dirs(jj)));
    rewarded_tgts = tgt_Center_idx(total_rewarded_idx);

    %% Find the max target
    max_target = max(rewarded_tgts);

    %% Indexes for max target
    rewarded_idx = total_rewarded_idx(rewarded_tgts == max_target);

    %% Skip the function if less than 5 succesful trials in that direction

    if length(rewarded_idx) < 5 || isempty(rewarded_idx)
        continue
    end

    %% Concatenate with the output variable
    max_tgt_rewarded_idxs = cat(1, max_tgt_rewarded_idxs, rewarded_idx);

end % End of target direction loop

%% Re-order the rewarded indexes
max_tgt_rewarded_idxs = unique(max_tgt_rewarded_idxs);









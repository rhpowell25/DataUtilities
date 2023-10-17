function [rewarded_idxs] = Rewarded_Indexes(xds, target_dir, target_center)

%% Indexes for rewarded trials
gadget_choice = 'All'; % 'All' vs # (1 = Channel 1; 2 = Channel 4)
[trial_info_table] = Parse_Trial_Table(xds, gadget_choice);

if and(isnan(target_dir), strcmp(target_center, 'Max'))
    trial_idxs = Find_Max_Indexes(trial_info_table);
elseif and(isnan(target_dir), isnan(target_center))
    trial_idxs = find(strcmp(trial_info_table.result, 'R'));
else
    trial_idxs = find((strcmp(trial_info_table.result, 'R')) & ...
        (trial_info_table.tgtDir == target_dir) & ...
        (trial_info_table.TgtDistance == target_center));
end

rewarded_idxs = trial_info_table.number(trial_idxs);









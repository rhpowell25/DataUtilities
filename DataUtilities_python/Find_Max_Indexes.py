# -*- coding: utf-8 -*-
import numpy as np

def Find_Max_Indexes(xds):
    
    #%% Extract the trial directions
    target_dir_idx = xds.trial_target_dir
    unique_target_dirs = np.unique(target_dir_idx)
    
    # Counts the number of directions used
    num_dirs = len(unique_target_dirs)
    
    # Pull the target centers of each succesful trial
    tgt_Center_header = xds.trial_info_table_header.index('TgtDistance')
    tgt_Center_idx = []
    for ii in range(len(xds.trial_info_table[tgt_Center_header][:])):
        tgt_Center_idx.append(xds.trial_info_table[tgt_Center_header][ii][0][0])
        
    # Initialize the counter
    cc = 0
    
    #%% Begin the loop through all directions
    for jj in range(num_dirs):
    
       #%% Indexes for all rewarded trials
       total_rewarded_idx = np.argwhere(np.logical_and(xds.trial_result == 'R', \
                                                xds.trial_target_dir == unique_target_dirs[jj])).reshape(-1,)
       rewarded_tgts = []
       for ii in range(len(total_rewarded_idx)):
           rewarded_tgts.append(tgt_Center_idx[total_rewarded_idx[ii]])
           
       #%% Find the max target
       max_target = max(rewarded_tgts)
       
       #%% Loop through the target centers
       
       rewarded_idx = total_rewarded_idx[np.where(rewarded_tgts == max_target)]
       
       #%% Skip the function if less than 5 succesful trials in that direction
       
       if len(rewarded_idx) < 5:
           continue
       else:
           
           # Concatenate with the output variable
           if cc == 0:
               max_tgt_rewarded_idxs = rewarded_idx
           else:
               max_tgt_rewarded_idxs = np.append(max_tgt_rewarded_idxs, rewarded_idx)
               
           cc = cc + 1
    #%% Re-order the rewarded indexes
    max_tgt_rewarded_idxs = np.unique(max_tgt_rewarded_idxs)
    return max_tgt_rewarded_idxs






















# -*- coding: utf-8 -*-

import numpy as np

#%% Process problems with specific XDS files
def Process_XDS(xds_morn, xds_noon, Match_The_Targets):
    
    # Find the basic indices
    result_idx = xds_morn.trial_info_table_header.index('result')
    tgtDir_idx = xds_morn.trial_info_table_header.index('tgtDir')
    TgtDistance_idx = xds_morn.trial_info_table_header.index('TgtDistance')
    
    #%% Check for mismatches in targets
    
    if Match_The_Targets == 1:
        from Identify_Targets import Identify_Targets
        # Find target centers & directinos
        targets_morn = Identify_Targets(xds_morn)
        target_dirs_morn = targets_morn.target_dirs
        target_centers_morn = targets_morn.target_centers
        targets_noon = Identify_Targets(xds_noon)
        target_dirs_noon = targets_noon.target_dirs
        target_centers_noon = targets_noon.target_centers
        
        from Match_Targets import Match_Targets
        Matching_Idxs = Match_Targets(target_dirs_morn, target_dirs_noon, target_centers_morn, target_centers_noon)
        Matching_Idxs_Morn = Matching_Idxs.Matching_Idxs_Morn
        Matching_Idxs_Noon = Matching_Idxs.Matching_Idxs_Noon
        
        # Only use the info of targets conserved between morning & noon
        if not all(ii is True for ii in Matching_Idxs_Morn) or not all(ii is True for ii in Matching_Idxs_Noon):
            print('Uneven Targets Between Morning & Afternoon')
            Mismatched_Idxs_Morn = [not ii for ii in Matching_Idxs_Morn]
            Mismatched_Idxs_Noon = [not ii for ii in Matching_Idxs_Noon]
            
            # Clean the morning file
            tgt_Center_idx = np.array(xds_morn.trial_info_table[TgtDistance_idx]).reshape(-1,)
            morn_removal_target_dirs = target_dirs_morn[Mismatched_Idxs_Morn]
            morn_removal_target_centers = target_centers_morn[Mismatched_Idxs_Morn]
            for jj in range(len(morn_removal_target_dirs)):
                # Indexes for rewarded trials
                rewarded_idx = np.asarray(np.where([all(ii) for ii in zip(xds_morn.trial_result == 'R',
                      xds_morn.trial_target_dir == morn_removal_target_dirs[jj],
                      tgt_Center_idx == morn_removal_target_centers[jj])])).reshape(-1,)
                
                # Mark those trials as failures
                for ii in range(len(rewarded_idx)):
                    xds_morn.trial_info_table[result_idx][rewarded_idx[ii]][0][0] = 70
                xds_morn.trial_result[rewarded_idx] = 'F'
                
            # Clean the afternoon file
            tgt_Center_idx = np.array(xds_noon.trial_info_table[TgtDistance_idx]).reshape(-1,)
            noon_removal_target_dirs = target_dirs_noon[Mismatched_Idxs_Noon]
            noon_removal_target_centers = target_centers_noon[Mismatched_Idxs_Noon]
            for jj in range(len(noon_removal_target_dirs)):
                # Indexes for rewarded trials
                rewarded_idx = np.asarray(np.where([all(ii) for ii in zip(xds_noon.trial_result == 'R',
                      xds_noon.trial_target_dir == noon_removal_target_dirs[jj],
                      tgt_Center_idx == noon_removal_target_centers[jj])])).reshape(-1,)
                
                # Mark those trials as failures
                for ii in range(len(rewarded_idx)):
                    xds_noon.trial_info_table[result_idx][rewarded_idx[ii]][0][0] = 70
                xds_noon.trial_result[rewarded_idx] = 'F'
    
    #%% Process problems with specific XDS files
    from Remove_Unit import Remove_Unit
    
    # Date
    file_name = xds_morn.file_name
    Date = file_name.split('_', 1)[0]
    
    # Task
    if xds_morn._lab_data__meta['task_name'] == 'multi_gadget':
        Task = 'PG'
    else:
        Task = xds_morn._lab_data__meta['task_name']
            
    if Date == '20220917':
        
        # Remova a bad unit
        unit_name = 'elec63_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
    #if Date == '20220304' and Task == 'PG':
        
        # Remova a bad unit
        #unit_name = 'elec21_2'
        #xds_morn = Remove_Unit(xds_morn, unit_name)
        #xds_noon = Remove_Unit(xds_noon, unit_name)
        
    if Date == '20210922' and Task == 'PG':
        
        # Remova a bad unit
        unit_name = 'elec79_2'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
        # Remova a bad unit
        unit_name = 'elec86_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
    if Date == '20210917' and Task == 'PG':
        
        # Remova a bad unit
        unit_name = 'elec72_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
    
    if Date == '20210902' and Task == 'PG':
        
        # In this experiment there were too few succesful trials at 15
        # Remove all trials with a targt center of 15
        # Pull the target center distances of each succesful trial
        tgt_cntrs = np.zeros([len(xds_morn.trial_info_table[0]), 1])
        for ii in range(len(tgt_cntrs)):
            tgt_cntrs[ii] = xds_morn.trial_info_table[TgtDistance_idx][ii][0][0]
        # Find the target centers at 15
        center_idx = np.asarray(np.where(tgt_cntrs == 15)).reshape(-1,)
        # Mark those trials as failures
        for ii in range(len(center_idx)):
            xds_morn.trial_info_table[result_idx][center_idx[ii]][0][0] = 70
        xds_morn.trial_result[center_idx] = 'F'
        
        # Remove all trials with a targt center of 15
        # Pull the target center distances of each succesful trial
        tgt_cntrs = np.zeros([len(xds_noon.trial_info_table[0]), 1])
        for ii in range(len(tgt_cntrs)):
            tgt_cntrs[ii] = xds_noon.trial_info_table[TgtDistance_idx][ii][0][0]
        # Find the target centers at 15
        center_idx = np.asarray(np.where(tgt_cntrs == 15)).reshape(-1,)
        # Mark those trials as failures
        for ii in range(len(center_idx)):
            xds_noon.trial_info_table[result_idx][center_idx[ii]][0][0] = 70
        xds_noon.trial_result[center_idx] = 'F'
        
    if Date == '20210722' and Task == 'PG':
        
        # Remova a bad unit
        unit_name = 'elec57_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
        # Remove the poor EMG
        muscle_names = []
        muscle_names.append('EMG_FDS1')
        muscle_names.append('EMG_FDS2')
        muscle_names.append('EMG_FDP1')
        for ii in range(len(muscle_names)):
            # Find the indices of the muscles of interest
            M = xds_morn.EMG_names.index(muscle_names[ii])
            del(xds_morn.EMG_names[M])
            xds_morn.EMG = np.delete(xds_morn.EMG, M, 1)
            xds_morn.raw_EMG = np.delete(xds_morn.raw_EMG, M, 1)
            # Find the indices of the muscles of interest
            M = xds_noon.EMG_names.index(muscle_names[ii])
            del(xds_noon.EMG_names[M])
            xds_noon.EMG = np.delete(xds_noon.EMG, M, 1)
            xds_noon.raw_EMG = np.delete(xds_noon.raw_EMG, M, 1)
            
    if Date == '20210722' and Task == 'WS':
        
        # Remova a bad unit
        unit_name = 'elec42_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
        # Remove the poor EMG
        muscle_names = []
        muscle_names.append('EMG_FCR2')
        for ii in range(len(muscle_names)):
            # Find the indices of the muscles of interest
            M = xds_morn.EMG_names.index(muscle_names[ii])
            del(xds_morn.EMG_names[M])
            xds_morn.EMG = np.delete(xds_morn.EMG, M, 1)
            xds_morn.raw_EMG = np.delete(xds_morn.raw_EMG, M, 1)
            # Find the indices of the muscles of interest
            M = xds_noon.EMG_names.index(muscle_names[ii])
            del(xds_noon.EMG_names[M])
            xds_noon.EMG = np.delete(xds_noon.EMG, M, 1)
            xds_noon.raw_EMG = np.delete(xds_noon.raw_EMG, M, 1)
            
    if Date == '20210713' and Task == 'PG':
        
        # Remova a bad unit
        unit_name = 'elec86_2'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
    if Date == '20210623' and Task == 'WS':
        
        # Remova a bad unit
        unit_name = 'elec36_1'
        xds_morn = Remove_Unit(xds_morn, unit_name)
        xds_noon = Remove_Unit(xds_noon, unit_name)
        
    if Date == '20210617' and Task == 'WS':

        # In this experiment, the wrist extension target distance was too small
        # Remove all trials in the 180 degree direction
        # Find the target directions at 180
        ext_idx = np.asarray(np.where(np.array(xds_morn.trial_info_table[tgtDir_idx]).reshape(-1,) == 180)).reshape(-1,)
        # Mark these trials as fails
        for ii in range(len(ext_idx)):
            xds_morn.trial_info_table[result_idx][ext_idx[ii]][0][0] = 70
        xds_morn.trial_result[ext_idx] = 'F'
        # Remove all trials in the 180 degree direction
        # Find the target directions at 180
        ext_idx = np.asarray(np.where(np.array(xds_noon.trial_info_table[tgtDir_idx]).reshape(-1,) == 180)).reshape(-1,)
        # Mark these trials as fails
        for ii in range(len(ext_idx)):
            xds_noon.trial_info_table[result_idx][ext_idx[ii]][0][0] = 70
        xds_noon.trial_result[ext_idx] = 'F'
        
    if Date == '20210610' and Task == 'WS':

        # In this experiment, the wrist extension target distance was too small
        # Remove all trials in the 180 degree direction
        # Find the target directions at 180
        ext_idx = np.asarray(np.where(np.array(xds_morn.trial_info_table[tgtDir_idx]).reshape(-1,) == 180)).reshape(-1,)
        # Mark these trials as fails
        for ii in range(len(ext_idx)):
            xds_morn.trial_info_table[result_idx][ext_idx[ii]][0][0] = 70
        xds_morn.trial_result[ext_idx] = 'F'
        # Remove all trials in the 180 degree direction
        # Find the target directions at 180
        ext_idx = np.asarray(np.where(np.array(xds_noon.trial_info_table[tgtDir_idx]).reshape(-1,) == 180)).reshape(-1,)
        # Mark these trials as fails
        for ii in range(len(ext_idx)):
            xds_noon.trial_info_table[result_idx][ext_idx[ii]][0][0] = 70
        xds_noon.trial_result[ext_idx] = 'F'

    #%% Return the xds file
    
    return xds_morn, xds_noon



















        
        
        
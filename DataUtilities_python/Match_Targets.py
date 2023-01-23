# -*- coding: utf-8 -*-

class Match_Targets():    
    
    def __init__(self, target_dirs_morn, target_dirs_noon, target_centers_morn, target_centers_noon):
        
        #%% Find the matching morning indices
        self.Matching_Idxs_Morn = [False for ii in range(len(target_dirs_morn))]
        for ii in range(len(target_dirs_morn)):
            for jj in range(len(target_dirs_noon)):
                if target_dirs_morn[ii] == target_dirs_noon[jj] and target_centers_morn[ii] == target_centers_noon[jj]:
                    self.Matching_Idxs_Morn[ii] = True
                    
        #%% Find the matching morning indices
        self.Matching_Idxs_Noon = [False for ii in range(len(target_dirs_noon))]
        for ii in range(len(target_dirs_noon)):
            for jj in range(len(target_dirs_morn)):
                if target_dirs_noon[ii] == target_dirs_morn[jj] and target_centers_noon[ii] == target_centers_morn[jj]:
                    self.Matching_Idxs_Noon[ii] = True
                    

























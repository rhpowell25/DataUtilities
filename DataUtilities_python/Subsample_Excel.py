#%% Import basic packages
import numpy as np

#%% XDS Excel
def Subsample_Excel(xds_excel, Sampling_Params):
    
    #%% Basic Settings

    # Which stability metric do you want to use ('Wave' or "Nonlin')
    stability_choice = 'Nonlin'

    # What statistical measure do you want to use ('T-Test', 'Wilcox')
    stat_test = 'T-Test'

    temp_excel = xds_excel
    
    #%% Subsample through each of the sampling paramaters

    # Subsample according to unit quality
    if 'unit_quality' in Sampling_Params and Sampling_Params['unit_quality'] != 'All':
        print('Excluding unstable units')
        if stability_choice == 'Nonlin':
            unit_quality_idx = temp_excel['nonlin_p_value'] > 0.05
        elif stability_choice == 'Wave':
            unit_quality_idx = temp_excel['wave_p_value'] > 0.05
        temp_excel = temp_excel[unit_quality_idx]
        
    # Subsample according to ISI quality
    if 'ISI_quality' in Sampling_Params and Sampling_Params['ISI_quality'] != 'All':
        print('Excluding multi-units')
        ISI_quality_idx = temp_excel['fract_contam'] < 0.1
        temp_excel = temp_excel[ISI_quality_idx]
        
    # Subsample according to change in depth of modulation
    if 'depth_change' in Sampling_Params and isinstance(Sampling_Params['depth_change'], int):
        depth_change = np.asarray(temp_excel['depth_noon'] - temp_excel['depth_morn'])
        depth_change_idx = depth_change >= Sampling_Params['depth_change']
        temp_excel = temp_excel[depth_change_idx]
    
    # Subsample according to preferred direction
    if 'pref_dir' in Sampling_Params and Sampling_Params['pref_dir'] != 'All':
        pref_dir_idx = temp_excel['pref_dir'] == Sampling_Params['pref_dir']
        temp_excel = temp_excel[pref_dir_idx]
    
    # Subsample according to minimum depth of modulation
    if 'depth_min' in Sampling_Params and isinstance(Sampling_Params['depth_min'], int):
        print('Excluding low modulating units')
        morn_depth_min_idx = np.asarray(temp_excel['depth_morn'] >= Sampling_Params['depth_min'])
        noon_depth_min_idx = np.asarray(temp_excel['depth_noon'] >= Sampling_Params['depth_min'])
        depth_min_idx = np.logical_and(morn_depth_min_idx, noon_depth_min_idx)
        temp_excel = temp_excel[depth_min_idx]
        
    # Subsample according to depth of modulation changes
    if 'depth_sig' in Sampling_Params and Sampling_Params['depth_sig'] != 'All':
        print('Excluding unchanging units')
        if stat_test == 'T-Test':
            depth_sig_idx = temp_excel['depth_t_test'] <= 0.05
        elif stat_test == 'Wilcox':
            depth_sig_idx = temp_excel['depth_wilcoxon'] <= 0.05
        temp_excel = temp_excel[depth_sig_idx]
        
    xds_excel = temp_excel
    return xds_excel
        



















        
        
        
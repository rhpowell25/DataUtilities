function [xds_excel] = Subsample_Excel(xds_excel, Sampling_Params)

%% Basic Settings

% Which stability metric do you want to use ('Wave' or "Nonlin')
stability_choice = 'Nonlin';

temp_excel = xds_excel;

%% Subsample through each of the sampling paramaters

% Subsample according to unit quality
if isfield(Sampling_Params,'unit_quality') && ~strcmp(Sampling_Params.unit_quality, 'All')
    if strcmp(stability_choice, 'Nonlin')
        unit_quality_idx = find(temp_excel.nonlin_p_val > 0.05);
    elseif strcmp(stability_choice, 'Wave')
        unit_quality_idx = find(temp_excel.wave_p_val > 0.05);
    end
    temp_excel = temp_excel(unit_quality_idx,:);
end

% Subsample according to ISI quality
if isfield(Sampling_Params,'ISI_quality') && ~strcmp(Sampling_Params.ISI_quality, 'All')
    if strcmp(Sampling_Params.ISI_quality, 'Single')
        ISI_quality_idx = temp_excel.fract_contam < 0.1;
    elseif strcmp(Sampling_Params.ISI_quality, 'Multi')
        ISI_quality_idx = temp_excel.fract_contam >= 0.1;
    end
    temp_excel = temp_excel(ISI_quality_idx,:);
end

% Subsample according to unit's relation
if isfield(Sampling_Params,'unit_relation') && ~strcmp(Sampling_Params.unit_relation, 'All')
    bsfr_morn = temp_excel.bsfr_morn;
    bsfr_noon = temp_excel.bsfr_noon;
    TgtHold_morn = temp_excel.TgtHold_morn;
    TgtHold_noon = temp_excel.TgtHold_noon;
    grasp_mod_morn = TgtHold_morn - bsfr_morn;
    grasp_mod_noon = TgtHold_noon - bsfr_noon;
    if strcmp(Sampling_Params.unit_relation, 'Reach')
        unit_relation_idx_morn = find(grasp_mod_morn < 0);
        unit_relation_idx_noon = find(grasp_mod_noon < 0);
    elseif strcmp(Sampling_Params.unit_relation, 'Grasp')
        unit_relation_idx_morn = find(grasp_mod_morn >= 0);
        unit_relation_idx_noon = find(grasp_mod_noon >= 0);
    end
    unit_relation_idx = intersect(unit_relation_idx_morn, unit_relation_idx_noon);
    temp_excel = temp_excel(unit_relation_idx,:);
end

% Subsample according to change in depth of modulation
if isfield(Sampling_Params,'depth_change') && ~isnan(Sampling_Params.depth_change)
    depth_change = temp_excel.depth_noon - temp_excel.depth_morn;
    depth_change_idx = depth_change >= Sampling_Params.depth_change;
    temp_excel = temp_excel(depth_change_idx, :);
end

% Subsample according to preferred direction
if isfield(Sampling_Params,'pref_dir') && ~strcmp(Sampling_Params.pref_dir, 'All')
    pref_dir_idx = temp_excel.pref_dir == Sampling_Params.pref_dir;
    temp_excel = temp_excel(pref_dir_idx,:);
end

% Subsample according to minimum depth of modulation
if isfield(Sampling_Params,'depth_min') && ~isnan(Sampling_Params.depth_min)
    morn_depth_min_idx = find(temp_excel.depth_morn >= Sampling_Params.depth_min);
    noon_depth_min_idx = find(temp_excel.depth_noon >= Sampling_Params.depth_min);
    depth_min_idx = intersect(morn_depth_min_idx, noon_depth_min_idx);
    temp_excel = temp_excel(depth_min_idx,:);
end

% Subsample according to maximum depth of modulation
if isfield(Sampling_Params,'depth_max') && ~isnan(Sampling_Params.depth_max)
    morn_depth_max_idx = find(temp_excel.depth_morn <= Sampling_Params.depth_max);
    noon_depth_max_idx = find(temp_excel.depth_noon <= Sampling_Params.depth_max);
    depth_max_idx = intersect(morn_depth_max_idx, noon_depth_max_idx);
    temp_excel = temp_excel(depth_max_idx,:);
end

% Subsample according to minimum peak to peak amplitude
if isfield(Sampling_Params,'peaktopeak_min') && ~isnan(Sampling_Params.peaktopeak_min)
    peaktopeak_min_idx = temp_excel.peaktopeak_amp >= Sampling_Params.peaktopeak_min;
    temp_excel = temp_excel(peaktopeak_min_idx,:);
end

% Subsample according to modulation significance
if isfield(Sampling_Params,'mod_sig') && ~strcmp(Sampling_Params.mod_sig, 'All')
    mod_sig_idx_morn = find(temp_excel.mod_p_val_morn <= 0.05);
    mod_sig_idx_noon = find(temp_excel.mod_p_val_noon <= 0.05);
    mod_sig_idx = unique([mod_sig_idx_morn' mod_sig_idx_noon'])';
    temp_excel = temp_excel(mod_sig_idx,:);
end

% Subsample according to depth of modulation changes
if isfield(Sampling_Params,'depth_sig') && ~strcmp(Sampling_Params.depth_sig, 'All')
    depth_sig_idx = temp_excel.depth_p_val <= 0.05;
    temp_excel = temp_excel(depth_sig_idx,:);
end

% Subsample according to spike width
if isfield(Sampling_Params,'spike_width') && ~strcmp(Sampling_Params.spike_width, 'All')
    if strcmp(Sampling_Params.spike_width, 'Small')
        spike_width_idx = find(temp_excel.spike_width <= 0.3);
    elseif strcmp(Sampling_Params.spike_width, 'Medium')
        spike_width_idx = find(temp_excel.spike_width > 0.3 & temp_excel.spike_width <= 0.4);
    elseif strcmp(Sampling_Params.spike_width, 'Large')
        spike_width_idx = find(temp_excel.spike_width > 0.4);
    end
    temp_excel = temp_excel(spike_width_idx,:);
end

% Subsample according to post-spike facilitation
if isfield(Sampling_Params,'post_spike_facil') && ~strcmp(Sampling_Params.post_spike_facil, 'All')
    if strcmp(Sampling_Params.post_spike_facil, 'Weak')
        psf_idx = find(temp_excel.post_spike_facil > 1.5 & temp_excel.post_spike_facil <= 2.3);
    elseif strcmp(Sampling_Params.post_spike_facil, 'Moderate')
        psf_idx = find(temp_excel.post_spike_facil > 2.3 & temp_excel.post_spike_facil <= 3.5);
    elseif strcmp(Sampling_Params.post_spike_facil, 'Strong')
        psf_idx = find(temp_excel.post_spike_facil > 3.5);
    end
    temp_excel = temp_excel(psf_idx,:);
end

% Re-add the drug dose
temp_excel.drug_dose_mg_per_kg = xds_excel.drug_dose_mg_per_kg(1:height(temp_excel));
% Re-add the EMG
if contains('EMG_names', temp_excel.Properties.VariableNames)
    temp_excel.EMG_names = xds_excel.EMG_names(1:height(temp_excel));
    temp_excel.EMG_amp_morn = xds_excel.EMG_amp_morn(1:height(temp_excel));
    temp_excel.EMG_amp_noon = xds_excel.EMG_amp_noon(1:height(temp_excel));
    temp_excel.EMG_amp_err_morn = xds_excel.EMG_amp_err_morn(1:height(temp_excel));
    temp_excel.EMG_amp_err_noon = xds_excel.EMG_amp_err_noon(1:height(temp_excel));
    temp_excel.EMG_amp_t_test = xds_excel.EMG_amp_t_test(1:height(temp_excel));
    temp_excel.EMG_amp_wilcoxon = xds_excel.EMG_amp_wilcoxon(1:height(temp_excel));
    temp_excel.EMG_amp_perc = xds_excel.EMG_amp_perc(1:height(temp_excel));
    temp_excel.EMG_amp_cohen_d = xds_excel.EMG_amp_cohen_d(1:height(temp_excel));
end
xds_excel = temp_excel;







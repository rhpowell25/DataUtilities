function [xds_excel] = Subsample_Excel(xds_excel, Sampling_Params)

%% Basic Settings

% Which stability metric do you want to use ('Wave' or "Nonlin')
stability_choice = 'Nonlin';

% What statistical measure do you want to use ('T-Test', 'Wilcox')
stat_test = 'T-Test';

temp_excel = xds_excel;

%% Subsample through each of the sampling paramaters

% Subsample according to unit quality
if isfield(Sampling_Params,'unit_quality') && ~strcmp(Sampling_Params.unit_quality, 'All')
    if strcmp(stability_choice, 'Nonlin')
        unit_quality_idx = find(temp_excel.nonlin_p_value > 0.05);
    elseif strcmp(stability_choice, 'Wave')
        unit_quality_idx = find(temp_excel.wave_p_value > 0.05);
    end
    temp_excel = temp_excel(unit_quality_idx,:);
end

% Subsample according to ISI quality
if isfield(Sampling_Params,'ISI_quality') && ~strcmp(Sampling_Params.ISI_quality, 'All')
    ISI_quality_idx = temp_excel.fract_contam < 0.1;
    temp_excel = temp_excel(ISI_quality_idx,:);
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

% Subsample according to depth of modulation changes
if isfield(Sampling_Params,'depth_sig') && ~strcmp(Sampling_Params.depth_sig, 'All')
    if strcmp(stat_test, 'T-Test')
        depth_sig_idx = find(temp_excel.depth_t_test <= 0.05);
    elseif strcmp(stat_test, 'Wilcox')
        depth_sig_idx = find(temp_excel.depth_wilcoxon <= 0.05);
    end
    temp_excel = temp_excel(depth_sig_idx,:);
end

% Re-add the drug dose
temp_excel.drug_dose_mg_per_kg = xds_excel.drug_dose_mg_per_kg(1:height(temp_excel));
xds_excel = temp_excel;









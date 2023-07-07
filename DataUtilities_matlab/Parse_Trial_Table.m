 function [trial_info_table] = Parse_Trial_Table(xds, gadget_choice)

%% Initialize the trial info table

matrix_variables = xds.trial_info_table_header';

%% Seperate the trial info tables based on the number of gadgets

if strcmp(xds.meta.task, 'multi_gadget') && ~strcmp(gadget_choice, 'All')

    gadget_Number_header = contains(xds.trial_info_table_header, 'gadgetNumber');
    gadget_Number_idx = cell2mat(xds.trial_info_table(:, gadget_Number_header));
    unique_gadgets = unique(gadget_Number_idx);

    try
        gadget_trial_idxs = gadget_Number_idx == unique_gadgets(gadget_choice);
    catch
        disp('Not Enough Gadgets: Using All Gadgets Available')
        % Create the excel matrix
        trial_info_table = cell2table(xds.trial_info_table);
        trial_info_table.Properties.VariableNames = matrix_variables;
        return
    end
    
    % Create the excel matrix
    trial_info_table = cell2table(xds.trial_info_table);
    trial_info_table.Properties.VariableNames = matrix_variables;
    
    % Subample according to the gadget choice
    trial_info_table = trial_info_table(gadget_trial_idxs, :);
    
else
    % Create the excel matrix
    trial_info_table = cell2table(xds.trial_info_table);
    trial_info_table.Properties.VariableNames = matrix_variables;
end







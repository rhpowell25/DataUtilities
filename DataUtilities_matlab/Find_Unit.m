function [N] = Find_Unit(xds, unit_name)

%% Find the unit of interest
if ~ischar(unit_name)

    try
        % Load the excel file
        [xds_output] = Find_Excel(xds);
        unit = xds_output.unit_names(unit_name);
        % Identify the index of the unit
        N = find(strcmp(xds.unit_names, unit));
    catch
        if isnan(unit_name)
            N = [];
        else
            N = unit_name;
        end
    end

else
    N = find(strcmp(xds.unit_names, unit_name));
end


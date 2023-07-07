
def Find_Unit(xds, unit_name):
        
    #%% Find the unit of interest
    
    if unit_name != 'NaN':
        if not isinstance(unit_name, str):
            try:
                # Load the excel file
                from Find_Excel import Find_Excel
                xds_output = Find_Excel(xds)
                # Identify the index of the unit
                unit = xds_output.unit_names[unit_name - 1]
                N = xds.unit_names.index(unit)
            except KeyError:
                N = 'NaN'
        else:
            try:
                N = xds.unit_names.index(unit_name)
            except KeyError:
                N = 'NaN'
    else:
        N = 'NaN'
        
    return N
                















    
    
    
    
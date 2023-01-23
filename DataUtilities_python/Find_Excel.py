# -*- coding: utf-8 -*-
import os
import pandas as pd

#%% XDS Excel
def Find_Excel(xds):
    
    #%% Find the excel for a given xds file
    
    # Date
    file_name = xds.file_name
    trial_date = file_name.split('_', 1)[0]
    
    # Task
    if xds._lab_data__meta['task_name'] == 'multi_gadget':
        trial_task = 'PG'
    else:
        trial_task = xds._lab_data__meta['task_name']
        
    # Monkey
    monkey_name = xds._lab_data__meta['monkey_name']
    
    # Excel File Name
    excel_name = trial_date + '_' + monkey_name + '_' + trial_task
    
    # File path
    file_path = 'C:/Users/rhpow/Documents/Work/Northwestern/Excel_Data/window_trial_gocue_2/Max_Targets/' 
    # Files & folders
    dir_path = os.listdir(file_path)
    # Table of only files
    files_in_path = list(filter(lambda ii: excel_name in ii, dir_path))
    
    # Selected file
    selec_file = files_in_path[0]
    
    # Load the excel
    try:
        xds_excel = pd.read_excel(file_path + selec_file)
    except:
        print('File cannot be found!')
        xds_excel = 'NaN'
        
    return xds_excel
        



















        
        
        
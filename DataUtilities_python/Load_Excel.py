#%% Import basic packages
import os
import pandas as pd

#%% XDS Excel
def Load_Excel(Date, Monkey, Task):
    
    #%% Define the file location
    base_excel_dir = 'C:/Users/rhpow/Documents/Work/Northwestern/Excel_Data/window_trial_gocue_2/'
    
    # Which targets do you want the mnovement phase firing rate calculated from? ('Max', 'Min', 'All')
    tgt_mpfr = 'Max'

    if tgt_mpfr == 'Max':
        file_path = base_excel_dir + 'Max_Targets/'
    if tgt_mpfr == 'Min':
        file_path = base_excel_dir + 'Min_Targets/'
    if tgt_mpfr == 'All':
        file_path = base_excel_dir + 'All_Targets/'
        
    # Files & folders
    dir_path = os.listdir(file_path)
    
    # Selected file
    file_string = Date + '_' + Monkey + '_' + Task
    selec_file = list(filter(lambda ii: file_string in ii, dir_path))
    
    # Load the excel
    try:
        xds_excel = pd.read_excel(file_path + selec_file[0])
    except:
        print('File cannot be found!')
        xds_excel = 'NaN'
        
    return xds_excel
        



















        
        
        
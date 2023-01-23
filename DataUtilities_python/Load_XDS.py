# -*- coding: utf-8 -*-

import glob
import os
from xds import lab_data
        
#%% Load XDS
def Load_XDS(Monkey, Date, Task, Morn_vs_Noon):

    ## Define the file location
    base_path = 'C:/Users/rhpow/Documents/Work/Northwestern/Monkey_Data/' + Monkey + '/' + Date + '/'
    if Morn_vs_Noon == 'Trimmed':
        base_path = base_path + 'Trimmed/'
    
    xds_dir = glob.glob(base_path + '*.mat')
    
    # Find the names of each file
    if len(xds_dir) > 1:
        file_names = [[] for ii in range(len(xds_dir))]
        for ii in range(len(xds_dir)):
            file_names[ii] = os.path.basename(xds_dir[ii])
        # Only look at the selected task
        xds_names = list(filter(lambda x: Task in x, file_names))
    else:
        file_names = os.path.basename(xds_dir[0])
        # Only look at the selected task
        xds_names = file_names
        file_name = xds_names

    # Identify the morning or afternoon file
    if Morn_vs_Noon == 'Morn':
        file_name = list(filter(lambda x: 'Pre' in x, xds_names))[0]
    if Morn_vs_Noon == 'Noon':
        file_name = list(filter(lambda x: 'Post' in x, xds_names))[0]
    if isinstance(Morn_vs_Noon, int):
        if len(xds_dir) > 1:
            file_name = xds_names[Morn_vs_Noon]
        else:
            file_name = xds_names
    
    # Display the drug used
    if 'Lex' in file_name:
        print('Drug Used: Lexapro')
    if 'Cyp' in file_name:
        print('Drug Used: Cyproheptadine')
    if 'Caff' in file_name:
        print('Drug Used: Caffeine')
    if 'Con' in file_name:
        print('Drug Used: Control')
        
    # Load the xds file
    
    xds = lab_data(base_path, file_name)
    
    #%% Return the xds file
    
    return xds



















        
        
        
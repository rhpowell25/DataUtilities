# -*- coding: utf-8 -*-

#%% File Details

class File_Details():
    
    def __init__(self, Monkey, Drug_Choice):
    
        #%% Define the experiments that will be examined 
        
        if Monkey == 'Tot':
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Cyproheptadine:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20230419'
                Tasks[0] = 'PGKG'
                Drug_Dose[0] = '0.52'
                
            if Drug_Choice == 'Caff':
                # Display the Drug name
                print('Caffeine:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20230414'
                Tasks[0] = 'PGKG'
                Drug_Dose[0] = '5.58'
                Dates[1] = '20230428'
                Tasks[1] = 'PGKG'
                Drug_Dose[1] = '6.64'
                
            if Drug_Choice == 'Lex':
                # Display the Drug name
                print('Escitalopram:')
                Dates = [[] for ii in range(3)]
                Tasks = [[] for ii in range(3)]
                Drug_Dose = [[] for ii in range(3)]
                Dates[0] = '20230317'
                Tasks[0] = 'KG'
                Drug_Dose[0] = '1.25'
                Dates[1] = '20230317'
                Tasks[1] = 'PG'
                Drug_Dose[1] = '1.25'
                Dates[2] = '20230425'
                Tasks[2] = 'PGKG'
                Drug_Dose[2] = '1.3'
                
            if Drug_Choice == 'Con':
                # Display the Drug name
                print('Control:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20230308'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 'N/A'
                Dates[1] = '20230411'
                Tasks[1] = 'PGKG'
                Drug_Dose[1] = 'N/A'

        if Monkey == 'Pancake':
            if Drug_Choice == 'Con':
                # Display the Drug name
                print('Control:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20220921'
                Tasks[0] = 'WS'
                Drug_Dose[0] = 'N/A'
                Dates[1] = '20220921'
                Tasks[1] = 'PG'
                Drug_Dose[1] = 'N/A'
    
            if Drug_Choice == 'Caff':
                # Display the Drug name
                print('Caffeine:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20220907'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 5.4
                Dates[1] = '20220907'
                Tasks[1] = 'WS'
                Drug_Dose[1] = 5.4
    
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Cyproheptadine:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20220916'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 0.4
                Dates[1] = '20221102'
                Tasks[1] = 'PG'
                Drug_Dose[1] = 0.7
                
            if Drug_Choice == 'Tiz':
                # Display the Drug name
                print('Tizanidine:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20220729'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 'Unknown'
        
        if Monkey == 'Pop':
            if Drug_Choice == 'Caff':
                # Display the Drug name
                print('Caffeine:')
                Dates = [[] for ii in range(5)]
                Tasks = [[] for ii in range(5)]
                Drug_Dose = [[] for ii in range(5)]
                Dates[0] = '20210610'
                Tasks[0] = 'WS'
                Drug_Dose[0] = 5.8
                Dates[1] = '20210617'
                Tasks[1] = 'WS'
                Drug_Dose[1] = 6.9
                Dates[2] = '20210617'
                Tasks[2] = 'PG'
                Drug_Dose[2] = 6.9
                Dates[3] = '20220304'
                Tasks[3] = 'PG'
                Drug_Dose[3] = 6.8
                Dates[4] = '20220308'
                Tasks[4] = 'PG'
                Drug_Dose[4] = 6.3
            
            if Drug_Choice == 'Lex':
                # Display the Drug name
                print('Escitalopram:')
                Dates = [[] for ii in range(5)]
                Tasks = [[] for ii in range(5)]
                Drug_Dose = [[] for ii in range(5)]
                Dates[0] = '20210813'
                Tasks[0] = 'PG'
                Drug_Dose[0] = '0.9 - 1.4'
                Dates[1] = '20210902'
                Tasks[1] = 'PG'
                Drug_Dose[1] = 1.0
                Dates[2] = '20210902'
                Tasks[2] = 'WS'
                Drug_Dose[2] = 1.0
                Dates[3] = '20210917'
                Tasks[3] = 'PG'
                Drug_Dose[3] = 1.5
                Dates[4] = '20210917'
                Tasks[4] = 'WS'
                Drug_Dose[4] = 1.5
            
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Cyproheptadine:')
                Dates = [[] for ii in range(6)]
                Tasks = [[] for ii in range(6)]
                Drug_Dose = [[] for ii in range(6)]
                Dates[0] = '20210623'
                Tasks[0] = 'WS'
                Drug_Dose[0] = 0.5
                Dates[1] = '20210623'
                Tasks[1] = 'PG'
                Drug_Dose[1] = 0.5
                Dates[2] = '20211001'
                Tasks[2] = 'PG'
                Drug_Dose[2] = 0.9
                Dates[3] = '20211001'
                Tasks[3] = 'WS'
                Drug_Dose[3] = 0.9
                Dates[4] = '20211020'
                Tasks[4] = 'PG'
                Drug_Dose[4] = 0.8
                Dates[5] = '20211020'
                Tasks[5] = 'WS'
                Drug_Dose[5] = 0.8
            
            if Drug_Choice == 'Con':
                # Display the Drug name
                print('Control:')
                Dates = [[] for ii in range(5)]
                Tasks = [[] for ii in range(5)]
                Drug_Dose = [[] for ii in range(5)]
                Dates[0] = '20210713'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 'N/A'
                Dates[1] = '20210722'
                Tasks[1] = 'PG'
                Drug_Dose[1] = 'N/A'
                Dates[2] = '20210722'
                Tasks[2] = 'WS'
                Drug_Dose[2] = 'N/A'
                Dates[3] = '20210922'
                Tasks[3] = 'PG'
                Drug_Dose[3] = 'N/A'
                Dates[4] = '20220214'
                Tasks[4] = 'PG'
                Drug_Dose[4] = 'N/A'
        
        if Monkey == 'Groot':
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Caffeine:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20210402'
                Tasks[0] = 'WM'
                Drug_Dose[0] = 0.5
        
            if Drug_Choice == 'Caff':
                # Display the Drug name
                print('Caffeine:')
                Dates = [[] for ii in range(2)]
                Tasks = [[] for ii in range(2)]
                Drug_Dose = [[] for ii in range(2)]
                Dates[0] = '20210304'
                Tasks[0] = 'PG'
                Drug_Dose[0] = 6.9
                Dates[1] = '20210331'
                Tasks[1] = 'WS'
                Drug_Dose[1] = 5.3
        
        if Monkey == 'Mihili':
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Cyproheptadine:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20140623'
                Tasks[0] = 'CO'
                Drug_Dose[0] = 0.8
        
        if Monkey == 'Jaco':
            if Drug_Choice == 'Lex':
                # Display the Drug name
                print('Escitalopram:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20140617'
                Tasks[0] = 'WB'
                Drug_Dose[0] = 0.3
    
            if Drug_Choice == 'Con':
                # Display the Drug name
                print('Control:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20140621'
                Tasks[0] = 'WB'
                Drug_Dose[0] = 'N/A'
    
        if Monkey == 'Jango':
            if Drug_Choice == 'Lex':
                # Display the Drug name
                print('Escitalopram:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20140613'
                Tasks[0] = 'WB'
                Drug_Dose[0] = 0.28
    
            if Drug_Choice == 'Cyp':
                # Display the Drug name
                print('Cyproheptadine:')
                Dates = [[] for ii in range(1)]
                Tasks = [[] for ii in range(1)]
                Drug_Dose = [[] for ii in range(1)]
                Dates[0] = '20140615'
                Tasks[0] = 'WB'
                Drug_Dose[0] = 0.91
    
        self.Dates = Dates
        self.Tasks = Tasks
        self.Drug_Dose = Drug_Dose


















        
        
        
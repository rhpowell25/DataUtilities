function [Dates, Tasks, Drug_Dose] = File_Details(Monkey, Drug_Choice)

%% Define the experiments that will be examined 

% Dates, Tasks, & Dosages
Dates = strings;
Tasks = strings;
Drug_Dose = struct([]);

if strcmp(Monkey, 'Pancake')
    if strcmp(Drug_Choice, 'Con')
        % Display the Drug name
        disp('Control:');
        Dates{1,1} = '20220921';
        Tasks{1,1} = 'WS';
        Drug_Dose{1,1} = 'N/A';
        Dates{2,1} = '20220921';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = 'N/A';
    end
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20220907';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 5.4;
        Dates{2,1} = '20220907';
        Tasks{2,1} = 'WS';
        Drug_Dose{2,1} = 5.4;
    end
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20220916';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 0.4;
        Dates{2,1} = '20221102';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = 0.7;
    end
    if strcmp(Drug_Choice, 'Tiz')
        % Display the Drug name
        disp('Tizanidine:');
        Dates{1,1} = '20220729';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 'Unknown';
    end
end

if strcmp(Monkey, 'Pop')
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20210610';
        Tasks{1,1} = 'WS';
        Drug_Dose{1,1} = 5.8;
        Dates{2,1} = '20210617';
        Tasks{2,1} = 'WS';
        Drug_Dose{2,1} = 6.9;
        Dates{3,1} = '20210617';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = 6.9;
        Dates{4,1} = '20220304';
        Tasks{4,1} = 'PG';
        Drug_Dose{4,1} = 6.8;
        Dates{5,1} = '20220308';
        Tasks{5,1} = 'PG';
        Drug_Dose{5,1} = 6.3;
    end
    
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Escitalopram:');
        Dates{1,1} = '20210813';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '0.9 - 1.4';
        Dates{2,1} = '20210902';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = 1.0;
        Dates{3,1} = '20210902';
        Tasks{3,1} = 'WS';
        Drug_Dose{3,1} = 1.0;
        Dates{4,1} = '20210917';
        Tasks{4,1} = 'PG';
        Drug_Dose{4,1} = 1.5;
        Dates{5,1} = '20210917';
        Tasks{5,1} = 'WS';
        Drug_Dose{5,1} = 1.5;
    end
    
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20210623';
        Tasks{1,1} = 'WS';
        Drug_Dose{1,1} = 0.5;
        Dates{2,1} = '20210623';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = 0.5;
        Dates{3,1} = '20211001';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = 0.9;
        Dates{4,1} = '20211001';
        Tasks{4,1} = 'WS';
        Drug_Dose{4,1} = 0.9;
        Dates{5,1} = '20211020';
        Tasks{5,1} = 'PG';
        Drug_Dose{5,1} = 0.8;
        Dates{6,1} = '20211020';
        Tasks{6,1} = 'WS';
        Drug_Dose{6,1} = 0.8;
    end
    
    if strcmp(Drug_Choice, 'Con')
        % Display the Drug name
        disp('Control:');
        Dates{1,1} = '20210713';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 'N/A';
        Dates{2,1} = '20210722';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = 'N/A';
        Dates{3,1} = '20210722';
        Tasks{3,1} = 'WS';
        Drug_Dose{3,1} = 'N/A';
        Dates{4,1} = '20210922';
        Tasks{4,1} = 'PG';
        Drug_Dose{4,1} = 'N/A';
        Dates{5,1} = '20220214';
        Tasks{5,1} = 'PG';
        Drug_Dose{5,1} = 'N/A';
    end
end

if strcmp(Monkey, 'Groot')
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20210402';
        Tasks{1,1} = 'WM';
        Drug_Dose{1,1} = 0.5;
    end
    
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20210304';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 6.9;
        Dates{2,1} = '20210331';
        Tasks{2,1} = 'WS';
        Drug_Dose{2,1} = 5.3;
    end
end

if strcmp(Monkey, 'Mihili')
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20140623';
        Tasks{1,1} = 'CO';
        Drug_Dose{1,1} = 0.8;
    end
end

if strcmp(Monkey, 'Jaco')
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Escitalopram:');
        Dates{1,1} = '20140617';
        Tasks{1,1} = 'WB';
        Drug_Dose{1,1} = 0.3;
    end
    if strcmp(Drug_Choice, 'Con')
        % Display the Drug name
        disp('Control:');
        Dates{1,1} = '20140621';
        Tasks{1,1} = 'WB';
        Drug_Dose{1,1} = 'N/A';
    end
end

if strcmp(Monkey, 'Jango')
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Escitalopram:');
        Dates{1,1} = '20140613';
        Tasks{1,1} = 'WB';
        Drug_Dose{1,1} = 0.28;
    end
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20140615';
        Tasks{1,1} = 'WB';
        Drug_Dose{1,1} = 0.91;
    end
end
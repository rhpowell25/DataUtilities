function [Dates, Tasks, Drug_Dose] = File_Details(Monkey, Drug_Choice)

%% Define the experiments that will be examined 

% Dates, Tasks, & Dosages
Dates = strings;
Tasks = strings;
Drug_Dose = struct([]);

if strcmp(Monkey, 'Mojito')
    if strcmp(Drug_Choice, 'Con')
        % Display the Drug name
        disp('Control:');
        Dates{1,1} = '20230819'; 
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 'N/A';
    end
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Lexapro:');
        Dates{1,1} = '20230826';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '1.01';
    end
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20230830';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '0.59';
        Dates{2,1} = '20230913';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = '0.78';
    end
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20230902';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '6.11';
    end
end

if strcmp(Monkey, 'Tot')
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20230419';
        Tasks{1,1} = 'PG'; % 1 = KG; 2 = PG
        Drug_Dose{1,1} = '0.52';
    end
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20230414';
        Tasks{1,1} = 'PG'; % 1 = KG; 2 = PG
        Drug_Dose{1,1} = '5.58';
        Dates{2,1} = '20230428';
        Tasks{2,1} = 'PG'; % 1 = KG; 2 = PG
        Drug_Dose{2,1} = '6.64';
    end
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Lexapro:');
        Dates{1,1} = '20230317';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '1.25';
        Dates{2,1} = '20230425';
        Tasks{2,1} = 'PG'; % 1 = KG; 2 = PG
        Drug_Dose{2,1} = '1.3';
    end
    if strcmp(Drug_Choice, 'Con')
        % Display the Drug name
        disp('Control:');
        Dates{1,1} = '20230308';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = 'N/A';
        Dates{2,1} = '20230411'; 
        Tasks{2,1} = 'PG'; % 1 = PG; 2 = KG
        Drug_Dose{2,1} = 'N/A';
    end
end

if strcmp(Monkey, 'Pop')
    if strcmp(Drug_Choice, 'Caff')
        % Display the Drug name
        disp('Caffeine:');
        Dates{1,1} = '20210617';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '6.9';
        Dates{2,1} = '20220304';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = '6.8';
        Dates{3,1} = '20220308';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = '6.3';
    end
    
    if strcmp(Drug_Choice, 'Lex')
        % Display the Drug name
        disp('Escitalopram:');
        Dates{1,1} = '20210813';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '0.9 - 1.4';
        Dates{2,1} = '20210902';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = '1.0';
        Dates{3,1} = '20210917';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = '1.5';
    end
    
    if strcmp(Drug_Choice, 'Cyp')
        % Display the Drug name
        disp('Cyproheptadine:');
        Dates{1,1} = '20210623';
        Tasks{1,1} = 'PG';
        Drug_Dose{1,1} = '0.5';
        Dates{2,1} = '20211001';
        Tasks{2,1} = 'PG';
        Drug_Dose{2,1} = '0.9';
        Dates{3,1} = '20211020';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = '0.8';
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
        Dates{3,1} = '20210922';
        Tasks{3,1} = 'PG';
        Drug_Dose{3,1} = 'N/A';
        Dates{4,1} = '20220214';
        Tasks{4,1} = 'PG';
        Drug_Dose{4,1} = 'N/A';
    end
end





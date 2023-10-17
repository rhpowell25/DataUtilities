
function [Signal, Timing] = Extract_Signal(xds, target_dir, target_center, event)

%% Times for rewarded trials

[rewarded_gocue_time] = TrialAlignmentTimes(xds, target_dir, target_center, 'trial_goCue');
[rewarded_end_time] = TrialAlignmentTimes(xds, target_dir, target_center, 'trial_end');

%% Adjust for 'task_onset'
if contains(event, 'task_onset')
    if strcmp(xds.meta.task, 'multi_gadget') || strcmp(xds.meta.task, 'WB')
       event = 'force_onset';
    elseif isfield(xds, 'curs_p')
        event = 'cursor_onset';
    end
end

%% Cursor Signal
if contains(event, 'cursor')

    % Catch possible sources of error
    if ~isfield(xds, 'curs_p')
        disp('No cursor information in this file');
        Signal = NaN;
        Timing = NaN;
        return
    end

    % Find the vector sum of the cursor position
    temp_Signal = sqrt(xds.curs_p(:,1).^2 + xds.curs_p(:,2).^2);

end
%% EMG Signal
if contains(event, 'EMG')

    % Catch possible sources of error
    if ~isfield(xds, 'EMG')
        disp('No EMG in this file');
        Signal = NaN;
        Timing = NaN;
        return
    end

    % Find the EMG index
    [muscle_groups] = Hand_Muscle_Match(xds, target_dir);
    [M] = EMG_Index(xds, muscle_groups);

    % Extract the selected EMG
    EMG = xds.EMG(:,M);

    % Sum the EMG
    temp_Signal = sum(EMG, 2);

end
%% Force Signal
if contains(event, 'force')
    Force = xds.force;

    [temp_Signal] = Sum_Force(xds.meta.task, Force);
end
%% Extracting the signal during successful trials

% Signal & time measured during each successful trial 
Signal = struct([]); % Signal during each successful trial 
Timing = struct([]); % Time points during each succesful trial 
for ii = 1:length(rewarded_gocue_time)
    idx = (xds.time_frame > rewarded_gocue_time(ii)) & ...
        (xds.time_frame < rewarded_end_time(ii)); 
    Signal{ii, 1} = temp_Signal(idx, :);
    Timing{ii, 1} = xds.time_frame(idx);
end

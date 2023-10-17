function [Bin_Params] = Binning_Parameters

%% Basic settings, some variable extractions, & definitions
% Time before and after the event
before_event = 3;
after_event = 3;

% Neural bin size (sec.)
bin_size = 0.04;

% Size of floating average window (bins)
half_window_size = 1;

% Half length of floating average window (sec.)
half_window_length = (2*half_window_size*bin_size + bin_size)/2;

% Step size of floating average window (bins)
step_size = 1;

% Place the settings in an output structure
Bin_Params = struct( ...
    'before_event', before_event, ... % Time before event (sec.)
    'after_event', after_event, ... % Time after event (sec.)
    'bin_size', bin_size, ... % Neural bin size (sec.)
    'half_window_size', half_window_size, ... % Bins
    'half_window_length', half_window_length, ... % Half length of floating average window (sec.)
    'step_size', step_size); % Bins




























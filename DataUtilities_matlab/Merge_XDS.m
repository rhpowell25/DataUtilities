function [xds] = Merge_XDS(Monkey, Date, Task, Sorted, File_Tags, Save_Merge)

%% Load the xds files

% Load the xds files
xds_one = Load_XDS(Monkey, Date, Task, Sorted, File_Tags{1});
xds_two = Load_XDS(Monkey, Date, Task, Sorted, File_Tags{2});

%% Initialize the output change the meta data

% Ensure the neural data matches
[xds_one, xds_two] = Mismatch(xds_one, xds_two, 0);
xds = xds_one;

% Create the new file name
xds_two_name_length = length(xds_one.meta.rawFileName);
xds_three_name_length = length(xds_two.meta.rawFileName);
max_length = max(xds_two_name_length, xds_three_name_length);
name_matches = zeros(max_length, 1);
for ii = 1:max_length
    name_matches(ii) = strncmp(xds_one.meta.rawFileName, xds_two.meta.rawFileName,ii);
end
final_name_match = find(diff(name_matches) == -1);
if strcmp(xds_one.meta.rawFileName(final_name_match-1:final_name_match), '_0')
    final_name_match = final_name_match - 2;
end
xds.meta.rawFileName = xds_one.meta.rawFileName(1:final_name_match);

% Append with a -ms if sorted
if isequal(xds.sorted, 1)
    xds.meta.rawFileName = strcat(xds.meta.rawFileName, '-ms');
else
    xds.meta.rawFileName = strcat(xds.meta.rawFileName, '-m');
end

% File duration
xds.meta.duration = xds_one.meta.duration + xds.bin_width + xds_two.meta.duration;

%% Merge the time frames

% Time frame
time_addition = xds.time_frame(end) + xds.bin_width;
time_frame = xds_two.time_frame;
time_frame = time_frame + time_addition;
xds.time_frame = cat(1, xds.time_frame, time_frame);

% Raw EMG time frame
if isfield(xds_one, "raw_EMG_time_frame") && isfield(xds_two, "raw_EMG_time_frame")
    raw_bin_width = xds.raw_EMG_time_frame(2) - xds.raw_EMG_time_frame(1);
    raw_time_addition = xds.raw_EMG_time_frame(end) + raw_bin_width;
    raw_EMG_time_frame = xds_two.raw_EMG_time_frame;
    raw_EMG_time_frame = raw_EMG_time_frame + raw_time_addition;
    xds.raw_EMG_time_frame = cat(1, xds.raw_EMG_time_frame, raw_EMG_time_frame);
end

%% Merge the trial table information

trial_table_addition = xds_two.trial_info_table;

% Trial numbers
trial_idx = contains(xds_two.trial_info_table_header, 'number');
first_trial_num = xds_one.trial_info_table{end,trial_idx};
for pp = 1:height(trial_table_addition)
    trial_table_addition{pp, trial_idx} = xds_two.trial_info_table{pp, trial_idx} + first_trial_num;
end

% Start time
start_idx = contains(xds_two.trial_info_table_header, 'startTime');
for pp = 1:height(trial_table_addition)
    trial_table_addition{pp, start_idx} = xds_two.trial_info_table{pp, start_idx} + time_addition;
end
trial_start_time = xds_two.trial_start_time + time_addition;
xds.trial_start_time = cat(1, xds.trial_start_time, trial_start_time);

% End time
end_idx = contains(xds_two.trial_info_table_header, 'endTime');
for pp = 1:height(trial_table_addition)
    trial_table_addition{pp, end_idx} = xds_two.trial_info_table{pp, end_idx} + time_addition;
end
trial_end_time = xds_two.trial_end_time + time_addition;
xds.trial_end_time = cat(1, xds.trial_end_time, trial_end_time);

% Trial result
xds.trial_result = cat(1, xds.trial_result, xds_two.trial_result);

% Target direction
xds.trial_target_dir = cat(1, xds.trial_target_dir, xds_two.trial_target_dir);

% Target corners
xds.trial_target_corners = cat(1, xds.trial_target_corners, xds_two.trial_target_corners);

% Touch pad time
if contains(xds_two.trial_info_table_header, 'touchPadTime')
    touchPad_idx = contains(xds_two.trial_info_table_header, 'touchPadTime');
    for pp = 1:height(trial_table_addition)
        trial_table_addition{pp, touchPad_idx} = xds_two.trial_info_table{pp, touchPad_idx} + time_addition;
    end
end

% Target on time
if contains(xds_two.trial_info_table_header, 'tgtOnTime')
    tgtOn_idx = contains(xds_two.trial_info_table_header, 'tgtOnTime');
    for pp = 1:height(trial_table_addition)
        trial_table_addition{pp, tgtOn_idx} = xds_two.trial_info_table{pp, tgtOn_idx} + time_addition;
    end
end

% Go cue time
goCue_idx = contains(xds_two.trial_info_table_header, 'goCueTime');
for pp = 1:height(trial_table_addition)
    trial_table_addition{pp, goCue_idx} = xds_two.trial_info_table{pp, goCue_idx} + time_addition;
end
trial_gocue_time = xds_two.trial_gocue_time + time_addition;
xds.trial_gocue_time = cat(1, xds.trial_gocue_time, trial_gocue_time);

% Concatenate the new trial table
xds.trial_info_table = cat(1, xds_one.trial_info_table, trial_table_addition);

%% Remove any floating point errors

round_digit = abs(floor(log10(xds.bin_width)));
xds.time_frame = round(xds.time_frame, round_digit);
if isfield(xds_one, "raw_EMG_time_frame") && isfield(xds_two, "raw_EMG_time_frame")
    raw_round_digit = abs(floor(log10(raw_bin_width)));
    xds.raw_EMG_time_frame = round(xds.time_frame, raw_round_digit);
end

for pp = 1:height(xds.trial_info_table)
    xds.trial_info_table{pp, start_idx} = round(xds.trial_info_table{pp, start_idx}, round_digit);
    xds.trial_info_table{pp, end_idx} = round(xds.trial_info_table{pp, end_idx}, round_digit);
    if contains(xds_two.trial_info_table_header, 'touchPadTime')
        xds.trial_info_table{pp, touchPad_idx} = round(xds.trial_info_table{pp, touchPad_idx}, round_digit);
    end
    if contains(xds_two.trial_info_table_header, 'tgtOnTime')
        xds.trial_info_table{pp, tgtOn_idx} = round(xds.trial_info_table{pp, tgtOn_idx}, round_digit);
    end
    xds.trial_info_table{pp, goCue_idx} = round(xds.trial_info_table{pp, goCue_idx}, round_digit);
end
xds.trial_start_time = round(xds.trial_start_time, round_digit);
xds.trial_end_time = round(xds.trial_end_time, round_digit);
xds.trial_gocue_time = round(xds.trial_gocue_time, round_digit);

%% Stack the neural data

% Spikes
spikes = xds_two.spikes;
for ii = 1:length(spikes)
    spikes{ii} = spikes{ii} + time_addition;
    xds.spikes{ii} = cat(1, xds.spikes{ii}, spikes{ii});
end

% Spike Waveforms
spike_waveforms = xds_two.spike_waveforms;
for ii = 1:length(spike_waveforms)
    xds.spike_waveforms{ii} = cat(1, xds.spike_waveforms{ii}, spike_waveforms{ii});
end

% Spike Counts
spike_counts = xds_two.spike_counts;
xds.spike_counts = cat(1,xds.spike_counts, spike_counts);

% Nonlinear Waveforms
if isfield(xds_one, "nonlin_waveforms") && isfield(xds_two, "nonlin_waveforms")
    nonlin_waveforms = xds_two.nonlin_waveforms;
    for ii = 1:length(nonlin_waveforms)
        xds.nonlin_waveforms{ii} = cat(1, xds.nonlin_waveforms{ii}, nonlin_waveforms{ii});
    end
end

%% Merge the force
force = xds_two.force;
xds.force = cat(1,xds.force, force);

%% Cursor information
if isfield(xds_one, "curs_p") && isfield(xds_two, "curs_p")
    curs_p = xds_two.curs_p;
    xds.curs_p = cat(1,xds.curs_p, curs_p);
    
    curs_v = xds_two.curs_v;
    xds.curs_v = cat(1,xds.curs_v, curs_v);
    
    curs_a = xds_two.curs_a;
    xds.curs_a = cat(1,xds.curs_a, curs_a);
end

%% Merge the EMG
if isfield(xds_one, "EMG") && isfield(xds_two, "EMG")
    % EMG
    EMG = xds_two.EMG;
    xds.EMG = cat(1, xds.EMG, EMG);
    
    % Raw EMG
    raw_EMG = xds_two.raw_EMG;
    xds.raw_EMG = cat(1, xds.raw_EMG, raw_EMG);
end

%% Save the updated xds
if isequal(Save_Merge, 1)
    Save_XDS(xds);
end












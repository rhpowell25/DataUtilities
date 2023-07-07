function [xds] = Merge_XDS(xds_morn, xds_noon)

%% Initialize the output & stack the variables

xds = xds_morn;

time_addition = xds.time_frame(end) + xds.bin_width;

% Time frame
time_frame = xds_noon.time_frame;
time_frame = time_frame + time_addition;
xds.time_frame = cat(1, xds.time_frame, time_frame);

% Spikes
spikes = xds_noon.spikes;
for ii = 1:length(spikes)
    spikes{ii} = spikes{ii} + time_addition;
    xds.spikes{ii} = cat(1, xds.spikes{ii}, spikes{ii});
end

% Spike Waveforms
spike_waveforms = xds_noon.spike_waveforms;
for ii = 1:length(spike_waveforms)
    xds.spike_waveforms{ii} = cat(1, xds.spike_waveforms{ii}, spike_waveforms{ii});
end

% Spike Counts
spike_counts = xds_noon.spike_counts;
xds.spike_counts = cat(1,xds.spike_counts, spike_counts);

% Force
force = xds_noon.force;
xds.force = cat(1,xds.force, force);

% Nonlinear Waveforms
nonlin_waveforms = xds_noon.nonlin_waveforms;
for ii = 1:length(nonlin_waveforms)
    xds.nonlin_waveforms{ii} = cat(1, xds.nonlin_waveforms{ii}, nonlin_waveforms{ii});
end












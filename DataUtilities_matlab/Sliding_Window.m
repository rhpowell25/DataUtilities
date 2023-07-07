function [sliding_avg, sliding_array, array_idxs] = Sliding_Window(array, half_window_size, step_size)

%% Slide a window across the length of the array
% Define the output variables
sliding_array = struct([]);
array_idxs = struct([]);
sliding_avg = zeros(length(array), 1);

% Initialize the counters
tt = 1;
cc = 1;

for ii = 1:length(array)
    try
        sliding_array{tt,1} = array(cc - half_window_size:cc + half_window_size);
        array_idxs{tt,1} = cc - half_window_size:cc + half_window_size;
        sliding_avg(tt,1) = mean(array(cc - half_window_size:cc + half_window_size));
        %fprintf('%s to %s \n', string(cc - half_window), string(cc + half_window))
    catch
        sliding_avg(tt) = [];
        cc = cc + round(step_size);
        continue
    end
    tt = tt + 1;
    cc = cc + round(step_size);
end

function Effect_Size = Cohen_D(per_trial_fire_rate_1, per_trial_fire_rate_2)

%% Find the mean firing rates
avg_fire_rate_1 = mean(per_trial_fire_rate_1);
avg_fire_rate_2 = mean(per_trial_fire_rate_2);

%% Find the pooled standard deviation
% Standard deviations
std_fire_rate_1 = std(per_trial_fire_rate_1);
std_fire_rate_2 = std(per_trial_fire_rate_2);

% Number of trials
n_1 = length(per_trial_fire_rate_1);
n_2 = length(per_trial_fire_rate_2);

% Cohen's D vs. Cohen's SD
if length(per_trial_fire_rate_1) ~= length(per_trial_fire_rate_2)
    pooled_std_num = (n_1 - 1)*std_fire_rate_1.^2 + (n_2 - 1)*std_fire_rate_2.^2;
    pooled_std_den = n_1 + n_2 - 2;
else
    pooled_std_num = std_fire_rate_1.^2 + std_fire_rate_2.^2;
    pooled_std_den = 2;
end
pooled_std_fire_rate = sqrt(pooled_std_num / pooled_std_den);

%% Find the Cohen's D effect size

Effect_Size = (avg_fire_rate_2 - avg_fire_rate_1) / pooled_std_fire_rate;







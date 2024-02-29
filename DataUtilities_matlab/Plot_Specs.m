function [Plot_Params] = Plot_Specs

%% Font & plotting specifications
title_font_size = 14;
label_font_size = 30;
axis_font_size = 20;
legend_size = 30;
mean_line_width = 5;
axis_line_width = 1;
font_name = 'Arial';
fig_size = 700;
title_color =  'k';

% Place the settings in an output structure
Plot_Params = struct( ...
    'label_font_size', label_font_size, ... 
    'legend_size', legend_size, ... 
    'mean_line_width', mean_line_width, ...
    'axis_line_width', axis_line_width, ...
    'title_font_size', title_font_size, ...
    'axis_font_size', axis_font_size, ...
    'font_name', font_name, ... 
    'title_color', title_color, ...
    'fig_size', fig_size);


























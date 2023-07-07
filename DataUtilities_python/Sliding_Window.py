# -*- coding: utf-8 -*-
import numpy as np

class Sliding_Window():    
    
    def __init__(self, array, window_size, step_size):
        
        #%% Slide a window across the length of the array
        # Define the output variables
        sliding_array = [[] for ii in range(len(array))]
        array_idxs = [[] for ii in range(len(array))]
        sliding_avg = np.zeros(len(array))
        
        # Initialize the counters
        tt = 0
        cc = 0
        
        # Center the window
        half_window = round(window_size / 2)
        
        for ii in range(len(array)):
            sliding_array[tt] = array[cc - half_window:cc + half_window + 1]
            array_idxs[tt] = np.linspace(cc - half_window, cc + half_window, int(window_size) + 1)
            sliding_avg[tt] = np.mean(array[cc - half_window:cc + half_window + 1])
            tt = tt + 1
            cc = cc + round(step_size)
            
        #%% Save the necessary variables
        self.sliding_avg = sliding_avg
        self.sliding_array = sliding_array
        self.array_idxs = array_idxs
























# -*- coding: utf-8 -*-
import numpy as np

class Sliding_Window():    
    
    def __init__(self, array, window_size, step_size):
        
        #%% Slide a window across the length of the array
        # Define the output variables
        self.sliding_array = [[] for ii in range(len(array))]
        self.array_idxs = [[] for ii in range(len(array))]
        self.sliding_avg = np.zeros(len(array))
        
        # Initialize the counters
        tt = 0
        cc = 0
        
        # Center the window
        half_window = round(window_size / 2)
        
        for ii in range(len(array)):
            self.sliding_array[tt] = array[cc - half_window:cc + half_window]
            self.array_idxs[tt] = np.linspace(cc - half_window, cc + half_window, int(window_size) + 1)
            self.sliding_avg[tt] = np.mean(array[cc - half_window:cc + half_window])
            tt = tt + 1
            cc = cc + round(step_size)
            
               
























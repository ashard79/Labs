#!/usr/bin/env python3
 
# Script: ops 301 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/27/23
# Purpose: Create a Python script that fetches this information using Psutil:
# Time spent by normal processes executing in user mode
# Time spent by processes executing in kernel mode
# Time when system was idle
# Time spent by priority processes executing in user mode
# Time spent waiting for I/O to complete.
# Time spent for servicing hardware interrupts
# Time spent for servicing software interrupts
# Time spent by other operating systems running in a virtualized environment
# Time spent running a virtual CPU for guest operating systems under the control of the Linux kernel

import psutil

# Main

# Get CPU times
cpu_times = psutil.cpu_times()
# Getting the time spent then printing result
user_time = cpu_times.user
print(f"Time spent by normal processes executing in user mode: {user_time} seconds")

cpu_times = psutil.cpu_times()

# Getting the time spent in kernel mode then print
kernel_time = cpu_times.system
print(f"Time spent by processes executing in kernel mode: {kernel_time} seconds")

cpu_times = psutil.cpu_times()

# Getting the idle time then print
idle_time = cpu_times.idle
print(f"Time when system was idle: {idle_time} seconds")

import time

def measure_interrupt_time():
    start_time = time.perf_counter()
    
# code that generates hardware interrupts
    
    end_time = time.perf_counter()
    interrupt_time = end_time - start_time
    
    print("Time spent on servicing hardware interrupts:", interrupt_time, "seconds")

# Calling function to measure interrupt time
measure_interrupt_time()

import time

def measure_interrupt_time():
    start_time = time.perf_counter()
    
    # Code after the software interrupt

    end_time = time.perf_counter()
    interrupt_time = end_time - start_time

    print("Time spent on servicing software interrupts:", interrupt_time, "seconds")

# Calling the function to measure interrupt time
measure_interrupt_time()












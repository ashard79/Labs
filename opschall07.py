#!/usr/bin/env python3

# Script: ops 301 class 07 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/13/23
# Purpose: Create a Python script that generates all directories sub-directories 
# and files for a user-provided directory path.
# Script must ask the user for a file path and read a user input string into a variable.
# Script must use the os.walk() function from the os library.
# Script must enclose the os.walk() function within a python function that hands it the user input file path.

# Main

import os

### Define function


def file_show(paths):
    for (root, dirs, files) in os.walk(paths):
        print(root)
        print(dirs)
        print(files)

# Main

paths = input("Please choose a directory for infomation!")
file_show(paths)

# End




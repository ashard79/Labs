#!/usr/bin/env python3
# Script: ops 301 class 10 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/24/23
# Purpose: Using file handling commands, create a Python script that creates a new .txt file
# Append three lines, prints to the screen the first line, then deletes the .txt file.

import os

# Created new text file
football_path = "football.txt"

# Main

# Open the file in write mode
football_path = "football.txt"
with open(football_path, "w") as football:
    # Writing content placed into the file
    football.write("The New York Jets, a professional football team based in New York City.")


#  Appending three lines
with open(football_path, "a") as football:
    football.write("We love Aron Rodgers\n")
    football.write("Jets are going to the Super Bowl\n")
    football.write("We are going 17-0 this year\n")

# Print first Line
with open(football_path, "r") as football:
  
  for line in football:
    print("Line: ", line.strip())


os.remove(football_path)    


# End
   






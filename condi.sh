#!/bin/bash

# Script: ops 201 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 02/27/23
# Purpose: Create a script that detects if a file or directory exists
#          Then create it if it does not exist
#          Your script must use at least one array, one loop, and one conditional

while true ; do

echo "1) File 2)Directory"
read Type
echo "Enter file/directory name"
read file_or_dir
echo $Type
# Main

# Check if file/directory exists
if [ -e "$file_or_dir" ]; then
  echo "$file_or_dir already exists"
else 
# make file/directory
if [[ $Type == "1" ]]; then 
  touch "$file_or_dir" 2>/dev/null 
  echo "$file_or_dir created successfully"
else 
mkdir "$file_or_dir"
fi 
fi
echo "would you like to check for another file or directory"
read user_input
echo $user_input
if [[ $user_input == "no" ]]; then
break

fi
done
# End
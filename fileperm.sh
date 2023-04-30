#!/bin/bash
# Script: ops 201 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 04/29/23
# Purpose: Create a bash script that alters file permissions of everything in a directory.

# Main

read -p "Enter permission number: " permission

while ! chmod $permission /dev/null 2>&1; do
    echo "Invalid permission number. Please enter a valid number."
    read -p "Enter permission number: " permission
done

echo "Setting permission to $permission..."
chmod $permission /path/to/file




# End
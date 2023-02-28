#!/bin/bash

# Script: ops 201 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 02/27/23
# Purpose: Write a script that displays running processes
#          Asks the user for a PID
#          Kill the process with that PID
#          Use a loop in your script

# Main

# Write a script that displays running processes, asks the user for a PID, then kills the process with that PID.

ps

read -p "Enter the PID: " pid

kill -SIGTERM $pid

# This loop will facilitate the menu system of your script, so that it can prompt the user to choose an option.





# End
#!/bin/bash

# Script: ops 201 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 02/27/23
# Purpose: Write a script that displays running processes
#          Asks the user for a PID
#          Kill the process with that PID
#          Use a loop in your script

input="0"

while [[ $input != "1" ]]; do
    echo "Please choose one of the following"
    echo "1) continue"
    echo "2) Dont continue"
    echo "Enter the number"
    read input
done

ps

kill $pid


# Main



# Write a script that displays running processes, asks the user for a PID, then kills the process with that PID.





# This loop will facilitate the menu system of your script, so that it can prompt the user to choose an option.





# End
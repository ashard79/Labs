# !/bin/bash

# Script:  Ops 301 Challenge 02
# Author:  Osaremeh Abel
# Date of last provision:  April 24th, 2023
# Purpose: M
# Manipulateing a variable in bash to apply today’s date to a log file.



# Main

# show time and date
echo "Today's Date and current Time:"
echo `date`

# copied system log into working directory 
sudo cp /var/log/syslog .

# created a new file
cat timedate.txt

# appending into new file
echo "Current date and time into file: `date` " >> timedate.txt
echo "new Appended file: "
cat timedate.txt


# End




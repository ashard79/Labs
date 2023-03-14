#!/bin/bash

# Script: ops 201 class 09 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 03/13/23

# Main

# Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt.
$events = Get-EventLog -LogName System -After (Get-Date).AddDays(-1)
$events | Out-File "C:\Users\Admin\Desktop\last_24.txt"

# Output all “error” type events from the System event log to a file on your desktop named errors.txt.
$events = Get-EventLog -LogName System -EntryType Error
$events | Out-File "C:\Users\Admin\Desktop\errors.txt"

# Print to the screen all events with ID of 16 from the System event log.
Get-EventLog -LogName System -InstanceId 16

# Print to the screen the most recent 20 entries from the System event log.’ 
Get-EventLog -LogName System -Newest 20

# Print to the screen all sources of the 500 most recent entries in the System event log.
Get-EventLog -LogName System -Newest 500 | Select-Object -Property *  


#end
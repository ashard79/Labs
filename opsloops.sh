#!/bin/bash

# Script: ops 201 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 02/27/23
# Purpose: Write a script that displays running processes
#          Asks the user for a PID
#          Kill the process with that PID
#          Use a loop in your script


#!/bin/bash

# Main

while true; do
  
  echo "Running processes:"
  ps aux

  read -p "Enter the PID to kill (or 'q' to quit): " pid

  if [[ "$pid" == "q" ]]; then
    break
  fi

  if kill "$pid" >/dev/null 2>&1; then
    echo "Process with PID $pid has been killed."
  else
    echo "Failed to kill process with PID $pid."
  fi

done

# End




















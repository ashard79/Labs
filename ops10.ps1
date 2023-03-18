# Script: ops 201 ops Challenge 10
# Author: Osaremeh Abel
# Date of latest revision: 03/17/23
# Purpose:
#          Use a loop in your script

# Main

# Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object -Property cpu -Descending

# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object -Property Id -Descending

# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | sort-object -Property ws -Descending | Select-Object -First 5 

# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten.
Start-Process iexplore.exe -ArgumentList "https://owasp.org/www-project-top-ten"

#Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten.
for ($x=1; $x -le 10; $x++) {
Start-Process iexplore.exe -ArgumentList "https://owasp.org/www-project-top-ten"
}

Start-Sleep -Seconds 5

# Close all Internet Explorer windows
Stop-Process -Name msedge -Force

# Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.
Get-Process

Stop-Process -Id 9624

#End






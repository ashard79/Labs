# Script: ops 401 self-paced
# Author: Osaremeh Abel
# Date of latest revision: 07/15/23
# Purpose: Create a shell script that automates screen lock on a Windows 10 endpoint.

# Main

# Set the screen lock timeout in seconds.
$lockTimeout = 300

# Imported the necessary DLLs
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class LockWorkStationHelper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool LockWorkStation();
}
"@

# Started a loop to continuously monitor user activity
while ($true) {
    # Get the last user input time
    $lastInputTime = (Get-WmiObject -Query "SELECT LastInputTime FROM Win32_UserActivity WHERE IsActive=TRUE").LastInputTime

    # Calculated the time elapsed since the last user input
    $elapsedTime = (Get-Date) - $lastInputTime

    # Check to see if the elapsed time exceeds the lock timeout
    if ($elapsedTime.TotalSeconds -ge $lockTimeout) {
        # Lock the screen using the LockWorkStation function
        [LockWorkStationHelper]::LockWorkStation()
    }

    # Sleep for a short interval before checking again
    Start-Sleep -Seconds 10
}



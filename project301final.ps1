# Author: Osaremeh Abel
# Script purpose: Script that will assign the Windows server VM a static IPv4 address
function SetStaticIP {
    $AdapterName = Read-Host -Prompt 'Enter the Adapter Name'
    $IPAddress = Read-Host -Prompt 'Enter the IP Address'
    $PrefixLength = Read-Host -Prompt 'Enter the Prefix Length'
    $DefaultGateway = Read-Host -Prompt 'Enter the Default Gateway'
    $DNSServer = Read-Host -Prompt 'Enter the DNS Server'

    # Get the network adapter
    $adapter = Get-NetAdapter -Name $AdapterName

    # Remove existing IP addresses
    $adapter | Remove-NetIPAddress -Confirm:$false

    # Set the new IP address
    $adapter | New-NetIPAddress -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $DefaultGateway

    # Remove existing default gateway
    $adapter | Remove-NetRoute -DestinationPrefix 0.0.0.0/0 -Confirm:$false

    # Set the new default gateway
    $adapter | New-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $DefaultGateway

    # Set the DNS server
    $adapter | Set-DnsClientServerAddress -ServerAddresses $DNSServer
}

function NewMultipleOUs {
    $OUList = Read-Host -Prompt 'Enter the OU Names (separated by commas)'
    $OUs = $OUList.Split(',')
    
    foreach ($OUName in $OUs) {
        $OUName = $OUName.Trim()  # Remove any leading or trailing spaces
        $ouParams = @{
            Name = $OUName
            PassThru = $True
        }
        try {
            New-ADOrganizationalUnit @ouParams
            echo "OU '$OUName' created!"
        } catch {
            echo "Error creating OU '$OUName': $_"
        }
    }
}

function NewGroupInOU {
    $GroupNames = Read-Host -Prompt 'Enter the Group Names (separated by commas)'
    $GroupNameList = $GroupNames.Split(',')

    foreach ($GroupName in $GroupNameList) {
        $GroupName = $GroupName.Trim()  # Remove any leading or trailing spaces
        
        $GroupScope = Read-Host -Prompt "Enter the Group Scope for '$GroupName' (Global, Universal, DomainLocal)"
        
        $OUList = Read-Host -Prompt "Enter the OUs to assign '$GroupName' to (separated by commas)"
        $OUs = $OUList.Split(',')
        
        $UserSAMAccountNames = Read-Host -Prompt "Enter the User SAMAccountNames to add to '$GroupName' (separated by commas, press Enter for none)"
        $UserSAMAccountNamesList = $UserSAMAccountNames.Split(',')
        
        $groupParams = @{
            Name = $GroupName
            GroupScope = $GroupScope
            PassThru = $True
        }
        
        $group = New-ADGroup @groupParams
        echo "New group '$GroupName' created!"
        
        foreach ($OUName in $OUs) {
            $OUName = $OUName.Trim()  # Remove any leading or trailing spaces
            try {
                $groupDN = (Get-ADGroup -Filter "Name -eq '$GroupName'").DistinguishedName
                Move-ADObject -Identity $groupDN -TargetPath ("OU=$OUName,DC=harmonitech,DC=com")
                echo "Group '$GroupName' assigned to OU '$OUName'!"
            } catch {
                echo "Error assigning group '$GroupName' to OU '$OUName': $_"
            }
        }
        
        foreach ($UserSAMAccountName in $UserSAMAccountNamesList) {
            $UserSAMAccountName = $UserSAMAccountName.Trim()  # Remove any leading or trailing spaces
            try {
                Add-ADGroupMember -Identity $group.Name -Members $UserSAMAccountName
                echo "User '$UserSAMAccountName' added to group '$GroupName'!"
            } catch {
                echo "Error adding user '$UserSAMAccountName' to group '$GroupName': $_"
            }
        }
    }
}






function autoconfig {
    param (
        [switch]$TaskRun
    )

    # If the -TaskRun switch is present, this is the post-restart run
    if ($TaskRun) {
        NewBunchU
        NewMultipleOUs
        NewGroupInOU
        SetStaticIP

        # Delete the scheduled task
        schtasks.exe /Delete /TN "MyScript" /F

        # Store the taskrun flag for resuming after logon
        $taskRunFlag = "TaskRun"
        Set-Content -Path "C:\Temp\TaskRunFlag.txt" -Value $taskRunFlag
    } else {
        # This is the pre-restart run

        # Check if the taskrun flag exists
        $taskRunFlagPath = "C:\Temp\TaskRunFlag.txt"
        if (Test-Path $taskRunFlagPath) {
            # Remove the taskrun flag file
            Remove-Item -Path $taskRunFlagPath

            # Resume from the post-restart run
            ResumeFromPostRestart
            return
        }

        # Prompt the user for the username to log back in as after restart
        $username = Read-Host -Prompt "Enter the username to log back in as after restart"

        # Create a scheduled task to run this script at user logon with -TaskRun switch
        $scriptPath = $PSCommandPath
        $taskCommand = "powershell.exe -WindowStyle Normal -File `"$scriptPath`" -TaskRun"
        $taskArguments = "-Create -TN `"MyScript`" -SC ONLOGON -RU `"$username`" -TR `"$taskCommand`""
        Start-Process schtasks.exe -ArgumentList $taskArguments -Wait -NoNewWindow

        NewADForest -ForestName "harmonitech.com" -DomainName "harmonitech" -DomainNetBIOSName "HARMONITECH" -DSRMPassword "Catatemydog89!"
        #shutdown.exe /r /t 60
    }
}










# Menu system
do {
    ShowHelp
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
    '1' { NewUser }
    '2' { NewGroup }
    '3' { NewOU }
    '4' { ModifyUser }
    '5' { ModifyGroup }
    '6' { ModifyOU }
    '7' { ModifyPassword }
    '8' { AddUserToGroup }
    '9' { RemoveUser }
    '10' { ListUsers }
    '11' { RenameDevice }
    '12' { NewBunchU }
    '13' { NewADForest -ForestName "harmonitech.com" -DomainName "harmonitech" -DomainNetBIOSName "HARMONITECH" -DSRMPassword "Catatemydog89!" }
    '14' { SetStaticIP }
    '15' { NewMultipleOUs }
    '16' { NewGroupInOU }
    '17' { autoconfig }
    '18' { return }
    default { Write-Host "Invalid choice, please try again." }
    }
   } while ($true)
   

#END
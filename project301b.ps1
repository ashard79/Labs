# Author: Osaremeh Abel
# Script purpose: Script that will assign the Windows server VM a static IPv4 address




# Set the network adapter name and the desired IPv4 address
$adapterName = "Ethernet"  # Change this to match your network adapter name
$ipAddress = "192.168.1.100"  # Change this to the desired IPv4 address

# Get the network adapter object
$adapter = Get-NetAdapter | Where-Object {$_.Name -eq $adapterName}

if ($adapter -eq $null) {
    Write-Host "Network adapter '$adapterName' not found."
    exit 1
}

# Set the IPv4 address configuration
$ipConfig = $adapter | Get-NetIPInterface | Where-Object {$_.InterfaceAlias -eq $adapterName}
$ipConfig | Set-NetIPInterface -Dhcp Disabled
$ipConfig | New-NetIPAddress -AddressFamily IPv4 -IPAddress $ipAddress -PrefixLength 24

# Verify the configuration
$ipConfig | Get-NetIPAddress



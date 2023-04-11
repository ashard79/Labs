Write-Host "Disabling unnecessary Windows services..."

Get-Service ALG | Set-Service -StartupType Disabled
Get-Service CertPropSvc | Set-Service -StartupType Disabled
Get-Service TabletInputService | Set-Service -StartupType Disabled
Get-Service WMPNetworkSvc | Set-Service -StartupType Disabled
Get-Service NaturalAuthentication | Set-Service -StartupType Disabled

Write-Host "Unnecessary Windows services disabled successfully." 
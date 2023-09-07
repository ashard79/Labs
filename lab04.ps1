# Osaremeh Abel 402 selfpaced
# Lab 04
# Date 09/06/23


# To ensure 'Password must meet complexity requirements' is set to 'Enabled'
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PasswordComplexity" -Value 1

#'Configure SMB v1 server' is set to 'Disabled'
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0

# Informed user about the changes
Write-Host "Password complexity and SMBv1 settings have been configured."

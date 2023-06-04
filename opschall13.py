#!/usr/bin/env python3

# Script: ops 301 class 13 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 06/04/23
# Purpose: Write a Powershell script that adds the below person to AD.
# Franz Ferdinand is the TPS Reporting Lead at GlobeX USA in Springfield, OR office.
# Franz is part of the TPS Department. Franz’s email is ferdi@GlobeXpower.com.
# Test your script. Verify in ADAC that the user was created with the correct attributes. 
# If anything is missing, delete the user in ADAC and re-attempt from Powershell ISE.


# Main
Import-Module ActiveDirectory

New-ADUser -SamAccountName "CDavid" -Name "ChewDavid" -OtherAttributes @{'title'="director";'mail'="chewdavid@fabrikam.com"}

# Author: Osaremeh Abel
# Script purpose: Script that will create new users to the org


Import-Module ActiveDirectory

# MAIN

# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$users = @{
    "CEO" = @{
        "Name" = "Nathan Drake"
        "Group" = "Executive Leadership"
        "Department" = "Executive Office"
        "OU" = "Leadership"
        "samAccountName" = "ndrake"
        "Email" = "ndrake@VerveTech.com"
    }
    "CTO" = @{
        "Name" = "Gordon Freeman"
        "Group" = "Technology Leadership"
        "Department" = "Information Technology"
        "OU" = "Leadership"
        "samAccountName" = "gfreeman"
        "Email" = "gfreeman@VerveTech.com"
    }
    "CFO" = @{
        "Name" = "Agent 47"
        "Group" = "Finance Leadership"
        "Department" = "Finance"
        "OU" = "Leadership"
        "samAccountName" = "a47"
        "Email" = "a47@VerveTech.com"
    }
    "COO" = @{
        "Name" = "Arthur Morgan"
        "Group" = "Operations Leadership"
        "Department" = "Operations"
        "OU" = "Leadership"
        "samAccountName" = "amorgan"
        "Email" = "amorgan@VerveTech.com"
    }
    "VP of Sales" = @{
        "Name" = "Nathan Hale"
        "Group" = "Sales"
        "Department" = "Sales"
        "OU" = "Departments"
        "samAccountName" = "nhale"
        "Email" = "nhale@VerveTech.com"
    }
    "VP of Marketing" = @{
        "Name" = "Faith Connors"
        "Group" = "Marketing"
        "Department" = "Marketing"
        "OU" = "Departments"
        "samAccountName" = "fconnors"
        "Email" = "fconnors@VerveTech.com"
    }
    "HR Manager" = @{
        "Name" = "Doom Guy"
        "Group" = "Human Resources"
        "Department" = "Human Resources"
        "OU" = "Departments"
        "samAccountName" = "dguy"
        "Email" = "dguy@VerveTech.com"
    }
    "IT Manager" = @{
        "Name" = "Alex Mercer"
        "Group" = "IT Management"
        "Department" = "Information Technology"
        "OU" = "Departments"
        "samAccountName" = "amercer"
        "Email" = "amercer@VerveTech.com"
    }
}

# Add users to Active Directory
foreach ($user in $users.GetEnumerator()) {
    $name = $user.Value.Name
    $group = $user.Value.Group
    $department = $user.Value.Department
    $ou = $user.Value.OU
    $samAccountName = $user.Value.samAccountName
    $email = $user.Value.Email

    $properties = @{
        'SamAccountName' = $samAccountName
        'Name' = $name
        'OtherAttributes' = @{
            'title' = $group
            'mail' = $email
        }
    }

    # To a create user in the Active Directory
    New-ADUser @properties -Enabled $true -ChangePassword




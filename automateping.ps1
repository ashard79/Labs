#!/bin/bash

$hostname = "espn.com"
$pingResult = Test-Connection $hostname -Count 1 -ErrorAction SilentlyCountinue
if ($pingResult -ne $null) {
    Write-Output "$hostname is online."
}
else {
    Write-Output "$hostname is offline."
}


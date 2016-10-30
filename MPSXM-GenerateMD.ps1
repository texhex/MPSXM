#Generate markdown overview for the functions in MPSXM
#1.05
#Michael Hex

#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

#Import 
Import-Module "$PSScriptRoot\MPSXM.psm1" -Force








cls

#Document all in MPSXM by using a function from MPSXM :)
Get-QuickReference -Module "MPSXM" -Output CommonMark


#simple tests
#Get-QuickReference "Get-RunningInISE"
#Get-QuickReference "Add-RegistryValue" 

#Get-QuickReference "Add-RegistryValue" -Output "CommonMark"

#$QuickRef=Get-QuickReference "Show-MessageBox" -Output Objects
#$QuickRef | format-list



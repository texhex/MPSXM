#Debug stuff
#https://github.com/texhex/MPSXM

#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

#Import 
Import-Module "$PSScriptRoot\MPSXM.psm1" -Force



ConvertTo-Version "1.06.08.1" -RespectLeadingZeros




write-host "*** ENDE ***"

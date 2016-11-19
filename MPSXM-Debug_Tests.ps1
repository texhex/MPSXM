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




#The standard DateTime formaters (u/s) do not include milliseconds, so we need to create our own format
#"yyyy'-'MM'-'dd HH':'mm':'ss'.'fff'Z'".

#https://en.wikipedia.org/wiki/ISO_8601
#hh:mm:ss.sss




write-host "*** ENDE ***"

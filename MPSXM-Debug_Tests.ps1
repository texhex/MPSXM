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



#throw New-Exception -DirectoryNotFound #-Explanation "C:\LINUX not found"

 $dateTimeLocal=New-Object System.DateTime(2016,12,21,4,5,3,999,[DateTimeKind]::Local)
$dateTimeUnspec=New-Object System.DateTime(2016,12,22,6,7,3,999,[DateTimeKind]::Unspecified)
   $dateTimeUTC=New-Object System.DateTime(2016,12,23,8,9,3,999,[DateTimeKind]::Utc)


$dtSource=$dateTimeLocal
write-host "Original time..........: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-DateTimeUTC $dtSource -ForceUTC
write-host "ToDateTimeUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-DateTimeUTC $dtSource
write-host "ToDateTimeUTC..........: $dtTest (Kind: $($dtTest.Kind))"

$dtSource=$dateTimeUnspec
write-host "Original time..........: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-DateTimeUTC $dtSource -ForceUTC
write-host "ToDateTimeUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-DateTimeUTC $dtSource
write-host "ToDateTimeUTC..........: $dtTest (Kind: $($dtTest.Kind))"

$dtSource=$dateTimeUTC
write-host "Original time..........: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-DateTimeUTC $dtSource -ForceUTC
write-host "ToDateTimeUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-DateTimeUTC $dtSource
write-host "ToDateTimeUTC..........: $dtTest (Kind: $($dtTest.Kind))"


#Convert a UTC back to a local time
write-host "Original time.........: $dateTimeUnspec (LocalTime)" 
$dtInUTC=ConvertTo-DateTimeUTC $dateTimeUnspec
write-host "Time in UTC...........: $dtInUTC" 
$dtLocal=ConvertFrom-DateTimeUTC $dtInUTC
write-host "Time in local timzeone: $dtLocal" 

#Won't work because source is not in UTC
#$crash=ConvertFrom-DateTimeUTC $dateTimeUnspec

write-host "*** ENDE ***"

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

Clear-Host

$reg="HKCU\Software\MPSXM"

#Set-RegistryValue -Path $regPath -Value "Value of default key"
#Set-RegistryValue -Path $regPath -Name "RegTest 1" -Value 0


#Set-RegistryValue -Path $regPath -Name $null -Value 0

#Write to (Default) value
Set-RegistryValue -Path $reg -Value "Value for (default)"

#Write as REG_DWORD because the value is an int
Set-RegistryValue -Path $regPath -Name "My DWORD Value" -Value 1

#Write as REG_QWORD because the value is a long
Set-RegistryValue -Path $regPath -Name "My QWORD Value" -Value ([long]123)

#Write an int as REQ_QWORD by using the prameter QWordb
Set-RegistryValue -Path $regPath -Name "My QWORD Value 2" -Value 2 -Type QWord


$testRead=Get-RegistryValue -Path $regPath -Name "My DWORD Value"
write-host "Read My DWORD Value: [$testRead]"

$testRead=Get-RegistryValue -Path $regPath -Name "My DWORD Value DOES NOT EXIST" -DefaultValue 999
write-host "Read My DWORD Value: [$testRead]"

$testRead=Get-RegistryValue -Path $regPath -DefaultValue "Not set"
write-host "Read (Default) value: [$testRead]"

$testRead=Get-RegistryValue -Path "$regPath\XyZ" -DefaultValue "Default Value"
write-host "Read (Default) value non existing path: [$testRead]"



write-host "*** ENDE ***"

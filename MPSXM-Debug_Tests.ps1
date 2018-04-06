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

write-host "---------------------------"

#write-host "---------------------------"


$testObject=[PSCustomObject]@{ Prop1="Prop1_Value"; Prop2=$null; prop3=12.23 }
#$testObject=@{ Prop1="Prop1_Value"; Prop2=$null; prop3=12.23 }

Get-PropertyValueSafe $testObject -Property "Prop1" -Default "NoValue"
Get-PropertyValueSafe $testObject -Property "Prop3" -Default "3_NoValue"
Get-PropertyValueSafe $testObject -Property "PropX" -Default "X_NoValue"
Get-PropertyValueSafe $testObject -Property "Prop2" -Default "Prop2_NoValue"
Get-PropertyValueSafe $testObject -Property $Null -Default "Null_NoValue"
Get-PropertyValueSafe $null -Property $Null -Default "Null_Null_NoValue"
Get-PropertyValueSafe $null -Property $Null
Get-PropertyValueSafe $null
Get-PropertyValueSafe 



write-host "*** ENDE ***"

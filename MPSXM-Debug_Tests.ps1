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

#write-host "---------------------------"



#Test-String "ABC" -Contains "A" #Excepted: TRUE
#Test-String "A" -Contains "A" #Excepted: TRUE

#Test-String $null -Contains "X" #Excepted: FALSE
#Test-String -Contains "X" #Excepted: FALSE

#Test-String "ABC" -Contains $null #Excepted: FALSE
#Test-String "ABC" -Contains #Excepted: FALSE

#Test-String -Contains #Excepted: FALSE
#Test-String $null -Contains $null #Excepted: FALSE


write-host "---------------------------"
#Start-TranscriptTaskSequence -NewLog -Verbose
#Stop-TranscriptIfSupported

#Show-MessageBox -Message "INFO with Title HUGE" -Titel "My Title" -Huge

#Split-Path -Path $myInvocation.ScriptName -Leaf   

Get-QuickReference "Get-TrimmedString" -Output "CommonMark"





write-host "*** ENDE ***"

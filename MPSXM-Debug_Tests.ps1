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


function TestFunction()
{
    $logPath = $env:windir + "\temp"
    $logPath = "X:\WINDOWS\TEMP\SMSTSLog"

    write-host "$logPath"
    write-host $myInvocation.ScriptName
    
    $logName = Split-Path -Path $myInvocation.ScriptName -Leaf   
    Start-TranscriptIfSupported -Path $logPath -Name $logName -NewLog 
   
}


TestFunction

Stop-TranscriptIfSupported

write-host "*** ENDE ***"

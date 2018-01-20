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

$sourceFile="C:\windows\win.ini"
$fileName=Get-FileName $sourceFile
$destFolder=Get-TempFolder

write-host "Copy-FileToDirectory -Filename `"$sourceFile`" -Directory `"$destFolder`""
Copy-FileToDirectory -Filename $sourceFile -Directory $destFolder

$destFileName=Join-Path -Path $destFolder -ChildPath $fileName

write-host "Remove-FileExact -Filename `"$destFileName`""
Remove-FileExact -Filename $destFileName



write-host "---------------------------"





write-host "*** ENDE ***"

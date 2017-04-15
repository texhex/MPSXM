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

#Copy-FileToDirectory "C:\Temp\Run_Me.txt" -Directory "C:\GNARF"

$null

$input=$null
$testArray=ConvertTo-Array $input
write-host "Input: [$input] - ConvertTo-Array: (Count $($testArray.Count)): $testArray"

$input=123
$testArray=ConvertTo-Array $input
write-host "Input: [$input] - ConvertTo-Array (Count $($testArray.Count)): $testArray"

$input=@("")
$testArray=ConvertTo-Array $input
write-host "Input: [$input] - ConvertTo-Array (Count $($testArray.Count)): $testArray"

$input=@("abc")
$testArray=ConvertTo-Array $input
write-host "Input: [$input] - ConvertTo-Array (Count $($testArray.Count)): $testArray"

$input=@("abc", "def")
$testArray=ConvertTo-Array $input
write-host "Input: [$input] - ConvertTo-Array (Count $($testArray.Count)): $testArray"


write-host "*** ENDE ***"

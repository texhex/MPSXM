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


$input="ABCDEFabcdef GHIJ .-\_/-. ?=()=? :\ 1234567 -+/* €$¥£¢ 890"
write-host "Full Teststring: [$input]"

#Do not select anything. Output is empty
$output=Select-StringUnicodeCategory $input 
write-host "Nothing selected: [$output]"

$output=Select-StringUnicodeCategory $input -IncludeLetter
write-host "-IncludeLetters: [$output]"

$output=Select-StringUnicodeCategory $input -IncludeLetter -IncludeNumber
write-host "-IncludeLetters -IncludeNumber: [$output]"

$output=Select-StringUnicodeCategory $input -IncludeLetter -IncludeNumber -IncludeSpace
write-host "-IncludeLetters -IncludeNumber -IncludeSpace: [$output]"

$output=Select-StringUnicodeCategory $input -IncludeLetter -IncludeNumber -IncludeSpace -IncludePunctuation
write-host "-IncludeLetters -IncludeNumber -IncludeSpace -IncludePunctuation: [$output]"

$output=Select-StringUnicodeCategory $input -IncludeLetter -IncludeNumber -IncludeSpace -IncludePunctuation -IncludeSymbol
write-host "-IncludeLetters -IncludeNumber -IncludeSpace -IncludePunctuation -IncludeSymbol: [$output]"






write-host "*** ENDE ***"

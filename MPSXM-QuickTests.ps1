#Quick test for MPSXM 
#1.11
#Michael Hex

#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

#Import 
Import-Module "$PSScriptRoot\MPSXM.psm1" -Force

function Test-Function_GetStringIsNullOrWhitespace()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] #we need this or PowerShell will complain "Cannot bind argument to parameter 'string' because it is an empty string." 
 [string]$string,

 [Parameter(Mandatory=$True,Position=2)]
 [bool]$ExpectedResult
)

 $result=Get-StringIsNullOrWhiteSpace $string
 if ( $result -eq $expectedresult ) 
 {
    write-host "Get-StringIsNullOrWhiteSpace [$string] : $result"
 }
 else
 {
   write-host "Get-StringIsNullOrWhiteSpace $string : FAILED! Expected [$ExpectedResult] but got $result"
 }
}

function Test-Function_GetStringHasData()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] #we need this or PowerShell will complain "Cannot bind argument to parameter 'string' because it is an empty string." 
 [string]$string,

 [Parameter(Mandatory=$True,Position=2)]
 [bool]$ExpectedResult
)

 $result=Get-StringHasData $string
 if ( $result -eq $expectedresult ) 
 {
    write-host "Get-StringHasData [$string] : $result"
 }
 else
 {
   write-host "Get-StringHasData $string : FAILED! Expected [$ExpectedResult] but got $result"
 }
}


write-host "Start"

Start-TranscriptIfSupported


$result=Get-CurrentProcessBitness -Is64bit
write-host "Cur Proc: 64bit $result"

$result=Get-CurrentProcessBitness -Is32bit
write-host "Cur Proc: 32bit $result"

$result=Get-CurrentProcessBitness -IsWoW
write-host "Cur Proc: WoW $result"

write-host "---------------------------"

$result=Get-OperatingSystemBitness -Is64bit
write-host "Cur OS: 64bit $result"

$result=Get-OperatingSystemBitness -Is32bit
write-host "Cur OS: 32bit $result"

write-host "---------------------------"

Test-Function_GetStringIsNullOrWhitespace "a" $False
Test-Function_GetStringIsNullOrWhitespace  "" $true
Test-Function_GetStringIsNullOrWhitespace " " $true
Test-Function_GetStringIsNullOrWhitespace "     " $true
Test-Function_GetStringIsNullOrWhitespace $null $true

write-host "---------------------------"

Test-Function_GetStringHasData "a" $true
Test-Function_GetStringHasData  "" $false
Test-Function_GetStringHasData " " $false
Test-Function_GetStringHasData "     " $false
Test-Function_GetStringHasData $null $false

write-host "---------------------------"

$result=Get-ModuleAvailable "Bitlocker"
write-host "Get Module Availble - BitLocker:  $result"

$result=Get-ModuleAvailable "DISM"
write-host "Get Module Availble - DISM:  $result"

$result=Get-ModuleAvailable "XYZ"
write-host "Get Module Availble - XYZ:  $result"

write-host "---------------------------"

$result=Get-ComputerLastBootupTime
write-host "ComputerLastBootupTime:  $result $($result.Kind)"

write-host "---------------------------"

$result=Get-RunningInISE
write-host "Running in ISE: $result"

write-host "---------------------------"

Start-TranscriptTaskSequence -NewLog
write-host "Blah Blah"

Stop-TranscriptIfSupported
write-host "---------------------------"


write-host "Show message box Test..."

Show-MessageBox -Message "INFO"
Show-MessageBox -Message "ERROR" -Critical
Show-MessageBox -Message "INFO with Title" -Titel "My Title"


write-host "Show message box HUGE Test..."

Show-MessageBox -Message "INFO HUGE" -Huge
Show-MessageBox -Message "ERROR HUGE " -Critical -Huge
Show-MessageBox -Message "INFO with Title HUGE" -Titel "My Title" -Huge

write-host "---------------------------"

write-host "Writing registry value..."
Add-RegistryValue -Path "HKCU:\Software\TEMP\TESTING" -Name "TESTVALUE" -Value "Yes" -REG_SZ

write-host "---------------------------"

$input=12484
write-host "Humanized Bytes [$input] : $(ConvertTo-HumanizedBytesString $input)"

$input=3648573
write-host "Humanized Bytes [$input] : $(ConvertTo-HumanizedBytesString $input)"

$input=23907403745
write-host "Humanized Bytes [$input] : $(ConvertTo-HumanizedBytesString $input)"

write-host "---------------------------"

$dict=New-Dictionary -StringPairs
write-host "***Dictionary -StringPairs ***: $($dict.PSTypenames[0])"
write-host ""

$dict=New-Dictionary -KeyAsString
write-host "***Dictionary -KeyAsString ***: $($dict.PSTypenames[0])"
write-host ""

$dict=New-Dictionary -KeyType "PSObject" -ValueType "string"
write-host "***Dictionary -TypeKey PSObject -TypeValue string ***: $($dict.PSTypenames[0])"
write-host ""

#create a hashtable
$hashtable=@{"AbCdeF"="AbCdeF-Value"; "ZZZ"="ZZZ-Value"}
write-host "Value from hashtable using only lower case letters: $($hashtable["abcdef"])"

#create a dictionary
$dict=New-Dictionary -StringPairs 
$dict.Add("AbCdeF","AbCdeF-value")
$dict.Add("ZZZ","ZZZ-Value")
#A standard dictionary would not return anything because it's case-sensitive
write-host "Value from dictionary using only lower case letters: $($dict["abcdef"])" 

write-host "---------------------------"


Exit-Context -ExitCode 1

#Try it: This will end your session
#Exit-Context -ExitCode 2 -Force

write-host "---------------------------"

Stop-TranscriptIfSupported


write-host " "
write-host " "
write-host "ENDE"



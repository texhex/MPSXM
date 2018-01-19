# Quick test for MPSXM 
# Version 1.13
# by Michael Hex
# https://github.com/texhex/MPSXM


#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

#Import 
Import-Module "$PSScriptRoot\MPSXM.psm1" -Force

function Test-Function_TestStringIsNullOrWhitespace()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] #we need this or PowerShell will complain "Cannot bind argument to parameter 'string' because it is an empty string." 
 [string]$string,

 [Parameter(Mandatory=$True,Position=2)]
 [bool]$ExpectedResult
)

 $result=Test-String -IsNullOrWhiteSpace $string
 if ( $result -eq $expectedresult ) 
 {
    write-host "Test-String -IsNullOrWhiteSpace [$string] : $result"
 }
 else
 {
   write-host "Test-String -IsNullOrWhiteSpace $string : FAILED! Expected [$ExpectedResult] but got $result"
 }
}

function Test-Function_TestStringHasData()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] #we need this or PowerShell will complain "Cannot bind argument to parameter 'string' because it is an empty string." 
 [string]$string,

 [Parameter(Mandatory=$True,Position=2)]
 [bool]$ExpectedResult
)

 $result=Test-String -HasData $string
 if ( $result -eq $expectedresult ) 
 {
    write-host "Test-String -HasData [$string] : $result"
 }
 else
 {
   write-error "Test-String -HasData $string : FAILED! Expected [$ExpectedResult] but got $result"
 }
}

function Test-Function_TestStringContains()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] 
 [string]$string1,

 [Parameter(Mandatory=$True,Position=2)]
 [AllowEmptyString()] 
 [string]$string2,

 [Parameter(Mandatory=$True,Position=3)]
 [bool]$ExpectedResult
)

 $result=Test-String $string1 -Contains $string2
 
 if ( $result -eq $expectedresult ) 
 {
    write-host "Test-String [$string1] -Contains [$string2] : $result"
 }
 else
 {
   write-error "Test-String [$string1] -Contains [$string2] : FAILED! Expected [$ExpectedResult] but got $result"
 }
}

function Test-Function_TestStringStartsWith()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [AllowEmptyString()] 
 [string]$string1,

 [Parameter(Mandatory=$True,Position=2)]
 [AllowEmptyString()] 
 [string]$string2,

 [Parameter(Mandatory=$True,Position=3)]
 [bool]$ExpectedResult
)

 $result=Test-String $string1 -StartsWith $string2
 
 if ( $result -eq $expectedresult ) 
 {
    write-host "Test-String [$string1] -StartsWith [$string2] : $result"
 }
 else
 {
   write-error "Test-String [$string1] -StartsWith [$string2] : FAILED! Expected [$ExpectedResult] but got $result"
 }
}


function Test-DateTimeString()
{
param(
 [Parameter(Mandatory=$True,Position=1)]
 [DateTime]$TestDate
)

 write-host "DateTime Test: Input [$($TestDate.ToString("s"))] (Kind $($TestDate.Kind))"
 
 $asString=ConvertTo-DateTimeString $TestDate
 write-host "          ConvertTo: [$asString] (no parameter)"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"


  $asString=ConvertTo-DateTimeString $TestDate -ForceUTC
 write-host "          ConvertTo: [$asString] -ForceUTC"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"


  $asString=ConvertTo-DateTimeString $TestDate -UTC
 write-host "          ConvertTo: [$asString] -UTC"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"


  $asString=ConvertTo-DateTimeString $TestDate -HideMilliseconds
 write-host "          ConvertTo: [$asString] -HideMilliseconds"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"


   $asString=ConvertTo-DateTimeString $TestDate -HideMilliseconds -ForceUTC
 write-host "          ConvertTo: [$asString] -HideMilliseconds -ForceUTC"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"


   $asString=ConvertTo-DateTimeString $TestDate -HideMilliseconds -UTC
 write-host "          ConvertTo: [$asString] -HideMilliseconds -UTC"

 $dateTimeFromString=ConvertFrom-DateTimeString $asString
 write-host "        ConvertFrom: [$($dateTimeFromString.ToString("s"))] (Kind $($dateTimeFromString.Kind))"
}


Clear-Host
write-host "Start"


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

#General usage:
$test=Test-String -IsNullOrWhiteSpace " " #returns true
$test=Test-String -IsNullOrWhiteSpace "abc" #returns false

#Using a special test function
Test-Function_TestStringIsNullOrWhitespace "a" $False
Test-Function_TestStringIsNullOrWhitespace $null $true
Test-Function_TestStringIsNullOrWhitespace  "" $true
Test-Function_TestStringIsNullOrWhitespace " " $true
Test-Function_TestStringIsNullOrWhitespace "     " $true
Test-Function_TestStringIsNullOrWhitespace "   z " $false



write-host "---------------------------"

#General usage:
$test=Test-String -HasData " " #returns false
$test=Test-String -HasData "abc" #returns true

Test-Function_TestStringHasData "a" $true
Test-Function_TestStringHasData $null $false
Test-Function_TestStringHasData  "" $false
Test-Function_TestStringHasData " " $false
Test-Function_TestStringHasData "     " $false
Test-Function_TestStringHasData "   Z  " $true

write-host "---------------------------"

#General usage:
$test=Test-String "ABCDEFGH" -Contains "d" #returns true
$test=Test-String "ABCDEFGH" -Contains "D" #returns true
$test=Test-String "ABCDEFGH" -Contains "d" -CaseSensitive #return false

Test-Function_TestStringContains "ABCDEFGH" "a" $true
Test-Function_TestStringContains "ABCDEFGH" "abc" $true
Test-Function_TestStringContains "ABCDEFGH" "abCDE" $true
Test-Function_TestStringContains "abcdefgh" "ABC" $true
Test-Function_TestStringContains "abcdefgh" "z" $false
Test-Function_TestStringContains "abcdefgh" "Z" $false

write-host "---------------------------"

$test=Test-String "ABCDEFGH" -StartsWith "abc" #returns true
$test=Test-String "ABCDEFGH" -StartsWith "Abc" #returns true
$test=Test-String "ABCDEFGH" -StartsWith "abc" -CaseSensitive #return false

Test-Function_TestStringStartsWith "ABCDEFGH" "abc" $true 
Test-Function_TestStringStartsWith "ABCDEFGH" "abCDE" $true
Test-Function_TestStringStartsWith "abcdefgh" "ABC" $true
Test-Function_TestStringStartsWith "abcdefgh" "def" $false
 
write-host "---------------------------"


write-host "Get-TrimmedString tests:"

$testval="  Abc Def  "

$result=Get-TrimmedString $testval
write-host " Input: [$testval]; Get-TrimmedString ..........: [$result]"

$result=Get-TrimmedString $testval -StartOnly
write-host " Input: [$testval]; Get-TrimmedString -StartOnly: [$result]"

$result=Get-TrimmedString $testval -EndOnly
write-host " Input: [$testval]; Get-TrimmedString -EndOnly..: [$result]"

$result=Get-TrimmedString $testval -RemoveAll
write-host " Input: [$testval]; Get-TrimmedString -RemoveAll: [$result]"

$result=Get-TrimmedString $testval -Equalize
write-host " Input: [$testval]; Get-TrimmedString -Equalize.: [$result]"

$testval="  Abc Def Ghi  JKLM  NOPQ     RST    "
$result=Get-TrimmedString $testval -RemoveDuplicates
write-host " Input: [$testval]; Get-TrimmedString -RemoveDuplicates: [$result]"


write-host "---------------------------"


write-host "Read String hashtable:"

$hashtable=Read-StringHashtable -File "$PSScriptRoot\ExampleSettings.txt"

foreach ($entry in $hashtable.Keys)
{
  $name=$entry
  $value = $hashtable[$entry]

  write-host "[$name] = [$value]"
}


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

##Required admins rights for access to C:\Windows\Temp
#defaults to C:\Windows\Temp
#Start-TranscriptTaskSequence -NewLog
#write-host "Test text "
#Stop-TranscriptIfSupported

write-host "---------------------------"

#defaults to %TEMP%
Start-TranscriptIfSupported
write-host "This text is added to the log"
Stop-TranscriptIfSupported

write-host "---------------------------"

write-host "ConvertTo-Version [1.20]: $(ConvertTo-Version "1.20")"
write-host "ConvertTo-Version [1.06]: $(ConvertTo-Version "1.06")"
write-host "ConvertTo-Version [3.06.2]: $(ConvertTo-Version "3.06.2")"

write-host "ConvertTo-Version [1.06] -RespectLeadingZeros: $(ConvertTo-Version "1.06" -RespectLeadingZeros)"
write-host "ConvertTo-Version [3.08.1] -RespectLeadingZeros: $(ConvertTo-Version "3.08.1" -RespectLeadingZeros)"


write-host "---------------------------"


write-host "Show message box Test..."

#Show-MessageBox -Message "INFO"
#Show-MessageBox -Message "ERROR" -Critical
#Show-MessageBox -Message "INFO with Title" -Titel "My Title"


write-host "Show message box HUGE Test..."

#Show-MessageBox -Message "INFO HUGE" -Huge
#Show-MessageBox -Message "ERROR HUGE " -Critical -Huge
#Show-MessageBox -Message "INFO with Title HUGE" -Titel "My Title" -Huge

write-host "---------------------------"

write-host "Registry tests"
$regPath="HKCU\Software\MPSXM"

#Write to (Default) value
Set-RegistryValue -Path $regPath -Value "Value for (default)"

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

$dict=New-Dictionary -StringKey
write-host "***Dictionary -StringKey ***: $($dict.PSTypenames[0])"
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


write-host "Testing Exit-Context"
#When executin PowerShell directly from a batch this will end it
#Exit-Context -ExitCode 1

#Try it: This will end your session
#Exit-Context -ExitCode 2 -Force




write-host "---------------------------"

write-host "ConvertTo-DateTimeString() / ConvertFrom-DateTimeString() tests"

 $dateTimeLocal=New-Object System.DateTime(2016,12,21,4,5,3,999,[DateTimeKind]::Local)
$dateTimeUnspec=New-Object System.DateTime(2016,12,22,6,7,3,999,[DateTimeKind]::Unspecified)
   $dateTimeUTC=New-Object System.DateTime(2016,12,23,8,9,3,999,[DateTimeKind]::Utc)

write-host "***************"
$ignored=Test-DateTimeString $dateTimeLocal
write-host "***************"
$ignored=Test-DateTimeString $dateTimeUnspec
write-host "***************"
$ignored=Test-DateTimeString $dateTimeUTC

write-host "---------------------------"

write-host "ConvertTo-UTC() / ConvertFrom-UTC() tests"

$dtSource=$dateTimeLocal
write-host " Original time..: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-UTC $dtSource -ForceUTC
write-host " ToUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-UTC $dtSource
write-host " ToUTC..........: $dtTest (Kind: $($dtTest.Kind))"

$dtSource=$dateTimeUnspec
write-host " Original time..: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-UTC $dtSource -ForceUTC
write-host " ToUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-UTC $dtSource
write-host " ToUTC..........: $dtTest (Kind: $($dtTest.Kind))"

$dtSource=$dateTimeUTC
write-host " Original time..: $dtSource (Kind: $($dtSource.Kind))" 
 $dtTest=ConvertTo-UTC $dtSource -ForceUTC
write-host " ToUTC -ForceUTC: $dtTest (Kind: $($dtTest.Kind))"
 $dtTest=ConvertTo-UTC $dtSource
write-host " ToUTC..........: $dtTest (Kind: $($dtTest.Kind))"


$dtNow=Get-Date
#Convert a UTC back to a local time
write-host "Original time...............: $dtNow (LocalTime)" 
$dtInUTC=ConvertTo-UTC $dtNow
write-host "Time in UTC.................: $dtInUTC" 
$dtLocal=ConvertFrom-UTC $dtInUTC
write-host "Time in local timzeone again: $dtLocal" 

#Won't work because source is not in UTC
#$crash=ConvertFrom-DateTimeUTC $dateTimeUnspec

write-host "---------------------------"

$result=Test-Admin
write-host "Is the user admin: $result"

write-host "---------------------------"

$testpath="C:\mypath\MyFile.txt"

$result=Get-FileName $testpath
write-host "Get-Filename `"$testpath`": [$result]"

$result=Get-FileName $testpath -WithoutExtension
write-host "Get-Filename `"$testpath`" -WithoutExtension: [$result]"

write-host "---------------------------"

$testpath="C:\Windows\Win31.exe"
$result=Test-FileExists $testpath
write-host "Test-FileExists `"$testpath`": $result"

$testpath="C:\Windows\explorer.exe"
$result=Test-FileExists $testpath
write-host "Test-FileExists `"$testpath`": $result"

write-host "---------------------------"

$testpath="C:\Windows\System32\drivers\etc\hosts"
$result=Get-ContainingDirectory $testpath
write-host "Get-ContainingDirectory `"$testpath`": [$result]"

$testpath="\\my-file-server\group4\data\List.xlsx"
$result=Get-ContainingDirectory $testpath
write-host "Get-ContainingDirectory `"$testpath`": [$result]"

$testpath="C:\mypath\MyFile.txt"
$result=Get-ContainingDirectory $testpath
write-host "Get-ContainingDirectory `"$testpath`": [$result]"

$testpath="C:\mypath"
$result=Get-ContainingDirectory $testpath
write-host "Get-ContainingDirectory `"$testpath`": [$result]"

write-host "---------------------------"

$testpath="C:\NOT-EXISTING-PATH\"
$result=Test-DirectoryExists $testpath
write-host "Test-DirectoryExists `"$testpath`": $result"

$testpath="C:\Windows"
$result=Test-DirectoryExists $testpath
write-host "Test-DirectoryExists `"$testpath`": $result"

write-host "---------------------------"

$sourceFile="C:\windows\win.ini"
$destFolder=$env:TEMP

write-host "Copy-FileToDirectory -Filename `"$sourceFile`" -Directory `"$destFolder`""
Copy-FileToDirectory -Filename $sourceFile -Directory $destFolder
write-host "---------------------------"

write-host "Testing ConvertTo-Array()"

write-host "Input is (`$Null)"
$array=ConvertTo-Array $null
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

$input=""
write-host "Input is (empty string)"
$array=ConvertTo-Array $input
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

$input="One"
write-host "Input is [$input]"
$array=ConvertTo-Array $input
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

$input=@()
write-host "Input is [$input]"
$array=ConvertTo-Array $input
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

$input=@("ArrayItem1")
write-host "Input is [$input]"
$array=ConvertTo-Array $input
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

$input=@("ArrayItem1","ArrayItem2")
write-host "Input is [$input]"
$array=ConvertTo-Array $input
write-host " Array count $($array.Count)"
foreach($item in $array)
{
   write-host "  ForEach loop [$item]"
} 

write-host "---------------------------"

write-host "Testing Select-StringUnicodeCategory"

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

write-host "---------------------------"



write-host " "
write-host " "
write-host "ENDE"



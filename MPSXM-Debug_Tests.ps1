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




write-host "Start"

$dict=New-Dictionary -StringPairs
write-host "***Dictionary -StringPairs - Type***: $($dict.PSTypenames[0])"
write-host ""

$dict=New-Dictionary -KeyAsString
write-host "***Dictionary -KeyAsString - Type***: $($dict.PSTypenames[0])"
write-host ""

$dict=New-Dictionary -KeyType "PSObject" -ValueType "string"
write-host "***Dictionary -TypeKey PSObject -TypeValue string - Type***: $($dict.PSTypenames[0])"
write-host ""

#create a hashtable
$hashtable=@{"AbCdeF"="AbCdeF-Value"; "ZZZ"="ZZZ-Value"}
write-host "Value from hashtable using only lower case letters: $($hashtable["abcdef"])"

$dict=New-Dictionary -StringPairs 
$dict.Add("AbCdeF","AbCdeF-value")
$dict.Add("ZZZ","ZZZ-Value")
#A standard dictionary would not return anything because it's case-sensitive
write-host "Value from dictionary using only lower case letters: $($dict["abcdef"])" 



#throw New-Exception -InvalidArgument "My explanation" 

#Send-Exception -ArgumentException
#Send-Exception -InvalidOperation
#Send-Exception -InvalidFormat


#$dict=New-Dictionary -KeyAndValuePSObject
#write-host "Dictionary -KeyAndValuePSOBject - Type: $($dict.PSTypenames[0])"



#write-host "String Dictionary, type: $($type1.TypeName))"


#$dict_object=New-Dictionary -TypeKey string -TypeValue PSObject
#$dict_object | (Get-Member).TypeName



write-host " "
write-host " "
write-host "ENDE"

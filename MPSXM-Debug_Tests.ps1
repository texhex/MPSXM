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

$testJSon = @"
{
"Objectname": "[computer].[WIFIAdapter]",
"ConnectionString": "",
"Commands": [
    {
        "SQLTemplate": "DELETE FROM @@OBJECT_NAME@@ WHERE @@COLUMN@@=@@PARAMETER@@;",
        "ColumnMap": [
            {
                "Column": "CID",
                "Source": "CID",
                "Type": "Int"
            }
        ],
        "Data": []
    },
    {
        "SQLTemplate": "INSERT INTO @@OBJECT_NAME@@(@@COLUMN@@) VALUES(@@PARAMETER@@);",
        "ColumnMap": [
            {
                "Column": "CID",
                "Source": "CID",
                "Type": "Int"
            },
            {
                "Column": "Name",
                "Source": "Adapter",
                "Type": "NVarChar"
            },
            {
                "Column": "MACAddress",
                "Source": "MACAddress",
                "Type": "NVarChar"
            },
            {
                "Column": "DriverVendor",
                "Source": "DriverVendor",
                "Type": "NVarChar"
            },                
            {
                "Column": "DriverDate",
                "Source": "DriverDate",
                "Type": "DateTime2"
            },
            {
                "Column": "DriverVersion",
                "Source": "DriverVersionText",
                "Type": "NVarChar"
            }               
        ],
        "Data": []
    }
]
}
"@



write-host "---------------------------"

$hashtable = ConvertFrom-JsonToHashtable $testJSon
$hashtable.GetType()

write-host (ConvertTo-Json $hashtable -Depth 10)


write-host "*** ENDE ***"

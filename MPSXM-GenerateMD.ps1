#Generate markdown overview for the functions in MPSXM
#1.04
#Michael Hex

#This script requires PowerShell 4.0 or higher 
#requires -version 4.0

#Guard against common code errors
Set-StrictMode -version 2.0

#Terminate script on errors 
$ErrorActionPreference = 'Stop'

#Import 
Import-Module "$PSScriptRoot\MPSXM.psm1" -Force


#github requires three back-ticks but this is an escape char for PS 
Set-Variable CODE_BLOCK_END "``````" –option ReadOnly -Force
Set-Variable CODE_BLOCK_START "$($CODE_BLOCK_END)powershell" –option ReadOnly -Force


function Get-ParameterText()
{
[OutputType([string])] 
param(
  [Parameter(Mandatory=$True,Position=1)]
  $Param
 )

 $name=$Param.name

 #we might suck a docs and forgot the description
 try 
 {
   $desc=$Param.Description.Text
   $desc=$desc.Trim()
 }
 catch
 {
   $desc="## **PARAMETER DESCRIPTION MISSING** ##"
 }
 
 #Syntax is: <List> <BOLD>NAME<BOLD> - Description
 $result="- *$Name* - $desc"
 return $result
}

function Get-SyntaxText()
{
[OutputType([string])] 
param(
  [Parameter(Mandatory=$True,Position=1)]
  [string]$Syntax
)
 $Syntax=$Syntax.Trim()
 
 $output=""

 #check if we have more than one entry in syntax
 $syntaxTokens=$syntax.Split("`n")
 foreach ($syntaxToken in $syntaxTokens)
 {
   $syntaxToken=$syntaxToken.Trim()

   if ( $syntaxToken -ne "" ) 
   {
     #most of the function do not support common params, so we leave this out
     $syntaxToken=$syntaxToken.Replace("[<CommonParameters>]", "")
     $output += "$syntaxToken`n"
   }
 }

 if ( $output.EndsWith("`n") )
 {
    $output=$output.TrimEnd("`n")
 }

 return $output 
}


#get all functions from our Module
$functions=Get-Command -Module MPSXM

cls

#DEBUG:
#$functions=Get-Command -Module MPSXM "Get-OperatingSystemBitness"

foreach ($function in $functions)
{

   $functionName = $function.Name

   $help=get-help $functionName
   $synopsis=$help.Synopsis
   $syntax=$help.Syntax | Out-String
   
   $syntaxText=Get-SyntaxText $syntax

   write-host "### $($functionName) ###"
   write-host "$synopsis"
   write-host $CODE_BLOCK_START
   write-host "$syntaxText"
   write-host $CODE_BLOCK_END
   write-host " "

   #parameters might be null
   if ( $help.parameters -ne $null  )
   {
     #parameters can be a string ?!??!?!?!
     if ( $help.parameters -isnot [String] ) 
     {
        #the parameter can also be null
        if ( $help.parameters.parameter -ne $null )
        {
           #when we are here, we might have one or more params
           #I have no idea how to better check this, since -is [array] is not working          
           try
           {
             $paramCount=$help.parameters.parameter.Count
             $param=$null
           }
           catch
           {
             $paramCount=1
             $param=$help.parameters.parameter
           }

           #if there is only one parameter, use it directly
           if ( $paramCount -eq 1 )
           {
              write-host "$(Get-ParameterText $param)"
           }
           else
           {
             $params=$help.parameters.parameter
  
              foreach ($param in $params)
              {
                #write-host "Param: $($param.Name)"
                write-host "$(Get-ParameterText $param)"
              }
           }
         }
      }
   }

   write-host " "
}
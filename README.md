# Michael's PowerShell eXtension Module (MPSXM)
A PowerShell module (v4+) with assorted functions. I added a function to this module as soon as I realized I will need it in more than one script. I release it under the Apache 2 License with the hope that other might find it useful too. 

## How to use ##

Just download it from [Releases](https://github.com/texhex/MPSXM/releases/latest) and put it in your ```PSModulePath``` path (see [MSDN](https://msdn.microsoft.com/en-us/library/dd878350(v=vs.85).aspx)). 

You can also put it in the same directory where your script is and add it with ```Import-Module "$PSScriptRoot\MPSXM.psm1"```. 


## Included Functions
<!---------------------------------- START HERE ---------------------------------->
<!---------------------------------- START HERE ---------------------------------->
<!---------------------------------- START HERE ---------------------------------->



### Add-RegistryValue ###
Adds a value to the given registry path. Right now only string values are supported.
```powershell
  Add-RegistryValue [-Path] <String> [-Name] <String> [-Value] <String> -REG_SZ 
```
 
- *Path* - The registry path, e.g. HKCU:\Software\TEMP\TSVARS
- *Name* - The name of the registry value
- *Value* - The value
- *REG_SZ* - The data will be written as REG_SZ
 
### ConvertTo-HumanizedBytesString ###
Returns a string optimized for readability.
```powershell
  ConvertTo-HumanizedBytesString [-bytes] <Int64> 
```
 
- *bytes* - The value of bytes that should be returned as humanized string.
 
### ConvertTo-Version ###
Returns a VERSION object with the version number converted from the given text.
```powershell
  ConvertTo-Version [[-Text] <String>] [-RespectLeadingZeros] 
```
 
- *Text* - The input string to be converted, e.g. 1.3.44.
- *RespectLeadingZeros* - Respect leading zeros by shifting the parts right, e.g. 1.02.3 becomes 1.0.2.3.
 
### Exit-Context ###
Will exit from the current context and sets an exit code. Nothing will be done when running in ISE.
```powershell
  Exit-Context [-ExitCode] <Int32> [-Force] 
```
 
- *ExitCode* - The number the exit code should be set to.
- *Force* - Will enfore full exit by using ENVIRONMENT.Exit()
 
### Get-ComputerLastBootupTime ###
Returns the date and time of the last bootup time of this computer.
```powershell
  Get-ComputerLastBootupTime 
```
 
 
### Get-CurrentProcessBitness ###
Returns information about the current powershell process.
```powershell
  Get-CurrentProcessBitness -Is64bit 
  Get-CurrentProcessBitness -Is32bit 
  Get-CurrentProcessBitness -IsWoW 
```
 
- *Is64bit* - Returns $True if the current script is running as 64-bit process.
- *Is32bit* - Returns $True if the current script is running as 32-bit process.
- *IsWoW* - Returns $True if the current script is running as 32-bit process on a 64-bit machine (Windows on Windows).
 
### Get-ModuleAvailable ###
Returns true if the module exist; it uses a a method that is about 10 times faster then using Get-Module -ListAvailable
```powershell
  Get-ModuleAvailable [-Name] <String> 
```
 
- *Name* - The name of the module to be checked
 
### Get-OperatingSystemBitness ###
Returns information about the current operating system
```powershell
  Get-OperatingSystemBitness -Is64bit 
  Get-OperatingSystemBitness -Is32bit 
```
 
- *Is64bit* - Returns $True if the current operating system is 64-bit
- *Is32bit* - Returns $True if the current operating system is 32-bit
 
### Get-RandomString ###
Returns a random string (only Aa-Zz are used).
```powershell
  Get-RandomString [-Length] <Int32> 
```
 
- *Length* - The length of the string that should be generated.
 
### Get-RunningInISE ###
Returns if the current script is executed by Windows PowerShell ISE
```powershell
  Get-RunningInISE 
```
 
 
### Get-StringHasData ###
Returns true if the string contains data (not $null, empty or only white spaces)
```powershell
  Get-StringHasData [-string] <String> 
```
 
- *string* - The string value to be checked
 
### Get-StringIsNullOrWhiteSpace ###
Returns true if the string is either $null, empty, or consists only of white-space characters.
```powershell
  Get-StringIsNullOrWhiteSpace [-string] <String> 
```
 
- *string* - The string value to be checked
 
### Get-TempFolder ###
Returns a path to the temporary folder without any (8+3) paths in it
```powershell
  Get-TempFolder 
```
 
 
### Read-StringHashtable ###
Reads a hashtable from a file where the key-value pairs are stored as Key==Value
```powershell
  Read-StringHashtable [-File] <String> 
```
 
- *File* - The file to read the hashtable from
 
### Show-MessageBox ###
Shows the message box to the user using a message box.
```powershell
  Show-MessageBox [-Message] <String> [[-Titel] <String>] [-Critical] [-Huge] 
```
 
- *Message* - The message to be displayed inside the message box.
- *Titel* - The title for the message box. If empty, the full script filename is used.
- *Critical* - Show an critical icon inside the message box. If not set, an information icon is used.
- *Huge* - Adds extra lines to the message to ensure the message box appears bigger.
 
### Start-TranscriptIfSupported ###
Starts a transscript, but ignores if the host does not support it.
```powershell
  Start-TranscriptIfSupported [[-Path] <String>] [[-Name] <String>] [-NewLog] 
```
 
- *Path* - The path where to store the transcript. If empty, the %TEMP% folder is used.
- *Name* - The name of the log file. If empty, the file name of the calling script is used.
- *NewLog* - Create a new log file every time a transcript is started ([Name].log-XX.txt)
 
### Start-TranscriptTaskSequence ###
If the scripts runs in MDT or SCCM, the transcript will be stored in the path LOGPATH defines. If not, C:\WINDOWS\TEMP is used.
```powershell
  Start-TranscriptTaskSequence [-NewLog] 
```
 
- *NewLog* - When set, will create a log file every time a transcript is started
 
### Stop-TranscriptIfSupported ###
Stops a transscript, but ignores if the host does not support it.
```powershell
  Stop-TranscriptIfSupported 
```


 
 
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->

## Contributions
Any constructive contribution is very welcome! If you encounter a bug or have an addition, please create a [new issue](https://github.com/texhex/MPSXM/issues/new).

## License
Copyright © 2016 [Michael Hex](http://www.texhex.info/). Licensed under the **Apache 2 License**. For details, please see LICENSE.txt.

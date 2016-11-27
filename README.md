# Michael's PowerShell eXtension Module (MPSXM)
A PowerShell module (v4+) with assorted functions. I added a function to this module as soon as I realized I will need it in more than one script. I release it under the Apache 2 License with the hope that other might find it useful too. 

## How to use ##

Just download it from [Releases](https://github.com/texhex/MPSXM/releases/latest) and put it in your ```PSModulePath``` path (see [MSDN](https://msdn.microsoft.com/en-us/library/dd878350(v=vs.85).aspx)). 

You can also put it in the same directory where your script is and add it with ```Import-Module "$PSScriptRoot\MPSXM.psm1"```. 

## Examples ##

Examples for each function are included in ``MPSXM-QuickTests.ps1``.

## Included Functions
<!---------------------------------- START HERE ---------------------------------->
<!---------------------------------- START HERE ---------------------------------->
<!---------------------------------- START HERE ---------------------------------->



### Test-Admin ###
Determines if the current powershell is elevated (running with administrator privileges).
```powershell
Test-Admin
```

### Get-ComputerLastBootupTime ###
Returns the date and time of the last bootup time of this computer.
```powershell
Get-ComputerLastBootupTime
```

### Exit-Context ###
Will exit from the current context and sets an exit code. Nothing will be done when running in ISE.
```powershell
Exit-Context [-ExitCode] <Int32> [-Force]
```
 - *ExitCode* - The number the exit code should be set to.
 - *Force* - Will enfore full exit by using ENVIRONMENT.Exit()

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

### ConvertFrom-DateTimeString ###
Converts a string (created by ConvertTo-DateTimeString() to a DateTime. If the given string contains a time zone (...+/-01:00),
the DateTime is converted to local time. If the given string is in UTC (...Z), no conversion will take place.
```powershell
ConvertFrom-DateTimeString [-DateTimeString] <String>
```
 - *DateTimeString* - The string to be converted to a DateTime

### ConvertTo-DateTimeString ###
Converts a DateTime to a string as definied by ISO 8601. The result will be [2016-11-24 14:59:16.718+01:00] for local and [2016-11-19 14:24:09.718Z] for UTC values.
```powershell
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds]
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds] -UTC
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds] -ForceUTC
```
 - *DateTime* - The DateTime to be converted to a string
 - *HideMilliseconds* - Do not include milliseconds in the result
 - *UTC* - Convert the DateTime to UTC before converting it to a string.
 - *ForceUTC* - Ignore the time zone/kind (Local, Unspecified, UTC) of the given DateTime and use it as if it were UTC already.

### New-Dictionary ###
Returns a dictionary that can be used like a hashtable (Key-Value pairs) but the pairs are not sorted by the key as in a hashtable
```powershell
New-Dictionary -StringPairs
New-Dictionary -StringKey
New-Dictionary -KeyType <String> -ValueType <String>
```
 - *StringPairs* - Both the key and the value of the dictionary are strings. Accessing values using object[Key] is case-insensitve.
 - *StringKey* - The key of the dictionary is of type string, the value is of type PSObject. Accessing values using object[Key] is case-insensitve.
 - *KeyType* - Defines the type used for the key. Accessing values using object[Key] is NOT case-insensitve, it's case-sensitive.
 - *ValueType* - Defines the type used for the value.

### New-Exception ###
Generates an exception ready to be thrown, the expected usage is [throw New-Exception -(TypeOfException) "Explanation why exception is thrown"]
```powershell
New-Exception -InvalidArgument [[-Explanation] <String>] [-NoCallerName]
New-Exception -InvalidOperation [[-Explanation] <String>] [-NoCallerName]
New-Exception -InvalidFormat [[-Explanation] <String>] [-NoCallerName]
New-Exception -FileNotFound [[-Explanation] <String>] [-NoCallerName]
New-Exception -DirectoryNotFound [[-Explanation] <String>] [-NoCallerName]
```
 - *InvalidArgument* - The exception it thrown because of a value does not fall within the expected range
 - *InvalidOperation* - The exception is thrown because the operation is not valid due to the current state of the object
 - *InvalidFormat* - The exception is thrown because one of the identified items was in an invalid format
 - *FileNotFound* - The exception is thrown because a file can not be found/accessed
 - *DirectoryNotFound* - The exception is thrown because a directory can not be found/accessed
 - *Explanation* - A description why the exception is thrown. If empty, a standard text matching the type of exception beeing generated is used
 - *NoCallerName* - By default, the name of the function or script generating the exception is included in the explanation

### ConvertTo-HumanizedBytesString ###
Returns a string optimized for readability.
```powershell
ConvertTo-HumanizedBytesString [-bytes] <Int64>
```
 - *bytes* - The value of bytes that should be returned as humanized string.

### Test-IsISE ###
Returns if the current script is executed by Windows PowerShell ISE
```powershell
Test-IsISE
```

### Show-MessageBox ###
Shows the message box to the user using a message box.
```powershell
Show-MessageBox [-Message] <String> [[-Titel] <String>] [-Critical] [-Huge]
```
 - *Message* - The message to be displayed inside the message box.
 - *Titel* - The title for the message box. If empty, the full script filename is used.
 - *Critical* - Show an critical icon inside the message box. If not set, an information icon is used.
 - *Huge* - Adds extra lines to the message to ensure the message box appears bigger.

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

### Get-QuickReference ###
Returns a quick reference about the given function or all functions in the module (if you are on GitHub, this text was generated with it).
```powershell
Get-QuickReference [-Name] <String> [-Output <String>] [-Module]
```
 - *Name* - Name of the function or the module to generate a quick reference
 - *Output* - If the output should be a string (default), CommonMark or the real objects
 - *Module* - Name specifies a module, a quick reference for all functions in the module should be generated

### Get-RandomString ###
Returns a random string (only Aa-Zz and 0-9 are used).
```powershell
Get-RandomString [-Length] <Int32>
```
 - *Length* - The length of the string that should be generated.

### Add-RegistryValue ###
Adds a value to the given registry path. Right now only string values are supported.
```powershell
Add-RegistryValue [-Path] <String> [-Name] <String> [-Value] <String> -REG_SZ
```
 - *Path* - The registry path, e.g. HKCU:\Software\TEMP\TSVARS
 - *Name* - The name of the registry value
 - *Value* - The value
 - *REG_SZ* - The data will be written as REG_SZ

### Get-RunningInISE ###
Returns if the current script is executed by Windows PowerShell ISE (uses Test-IsISE internally)
```powershell
Get-RunningInISE
```

### Get-StringHasData ###
Returns true if the string contains data (does not contain $null, empty or only white spaces). Uses [Test-String -HasData] internally.
```powershell
Get-StringHasData [-string] <String>
```
 - *string* - The string value to be checked

### Read-StringHashtable ###
Reads a hashtable from a file where the Key-Value pairs are stored as Key==Value
```powershell
Read-StringHashtable [-File] <String>
```
 - *File* - The file to read the hashtable from

### Get-StringIsNullOrWhiteSpace ###
Returns true if the string is either $null, empty, or consists only of white-space characters (uses [Test-String -IsNullOrWhiteSpace] internally)
```powershell
Get-StringIsNullOrWhiteSpace [-string] <String>
```
 - *string* - The string value to be checked

### Test-String ###
Tests the given string for a condition
```powershell
Test-String [[-String] <String>] -HasData
Test-String [[-String] <String>] -IsNullOrWhiteSpace
Test-String [[-String] <String>] -Contains [[-SearchFor] <String>] [-CaseSensitive]
Test-String [[-String] <String>] -StartsWith [[-SearchFor] <String>] [-CaseSensitive]
```
 - *String* - The string the specified operation should be performed on
 - *HasData* - Returns true if the string contains data (not $null, empty or only white spaces)
 - *IsNullOrWhiteSpace* - Returns true if the string is either $null, empty, or consists only of white-space characters.
 - *Contains* - Returns true if string contains the text in SearchFor. A case-insensitive (ABCD = abcd) is performed by default.
 - *StartsWith* - Returns true if the string starts with the text in SearchFor. A case-insensitive (ABCD = abcd) is performed by default.
 - *SearchFor* - The string beeing sought
 - *CaseSensitive* - Perform an operation that respect letter casing, so [ABC] is different from [aBC].

### Get-TempFolder ###
Returns a path to the temporary folder without any (8+3) paths in it
```powershell
Get-TempFolder
```

### Start-TranscriptIfSupported ###
Starts a transscript, but ignores if the host does not support it.
```powershell
Start-TranscriptIfSupported [[-Path] <String>] [[-Name] <String>] [-NewLog]
```
 - *Path* - The path where to store the transcript. If empty, the %TEMP% folder is used.
 - *Name* - The name of the log file. If empty, the file name of the calling script is used.
 - *NewLog* - Create a new log file every time a transcript is started ([Name].log-XX.txt)

### Stop-TranscriptIfSupported ###
Stops a transscript, but ignores if the host does not support it.
```powershell
Stop-TranscriptIfSupported
```

### Start-TranscriptTaskSequence ###
If the scripts runs in MDT or SCCM, the transcript will be stored in the path LOGPATH defines. If not, C:\WINDOWS\TEMP is used.
```powershell
Start-TranscriptTaskSequence [-NewLog]
```
 - *NewLog* - When set, will create a log file every time a transcript is started

### Get-TrimmedString ###
Removes white-space characters from the given string. By default, it removes all leading and trailing white-spaces chracters.
```powershell
Get-TrimmedString [[-String] <String>]
Get-TrimmedString [[-String] <String>] -StartOnly
Get-TrimmedString [[-String] <String>] -EndOnly
Get-TrimmedString [[-String] <String>] -Equalize
Get-TrimmedString [[-String] <String>] -RemoveDuplicates
Get-TrimmedString [[-String] <String>] -RemoveAll
```
 - *String* - The string to be trimmed
 - *StartOnly* - Only remove leading white-space chracters
 - *EndOnly* - Only remove trailing white-space chracters
 - *Equalize* - Removes all leading and trailing white-space characters, then replace any character considered to be a white-space with the standard white-space character (U+0020)
 - *RemoveDuplicates* - Removes all leading and trailing white-space characters, then replace any white-space duplicates with 
one white-space (U+0020)
 - *RemoveAll* - Removes all white-space chracters from the string

### ConvertFrom-UTC ###
Converts a given Coordinated Universal Time (UTC) DateTime to local time.
```powershell
ConvertFrom-UTC [-DateTime] <DateTime>
```
 - *DateTime* - The DateTime to be converted to local time from UTC. Inputs not in UTC will result in an exception.

### ConvertTo-UTC ###
Converts a given DateTime to a Coordinated Universal Time (UTC) DateTime.
```powershell
ConvertTo-UTC [-DateTime] <DateTime> [-ForceUTC]
```
 - *DateTime* - The DateTime to be converted to UTC. A DateTime without time zone (Kind=Unspecified) is assumed to be in local time. Values already in UTC will be returned as is.
 - *ForceUTC* - Ignore the time zone/kind (Local, Unspecified, UTC) of the given DateTime and return the same date and time as the input as UTC

### ConvertTo-Version ###
Returns a VERSION object with the version number converted from the given text.
```powershell
ConvertTo-Version [[-Text] <String>] [-RespectLeadingZeros]
```
 - *Text* - The input string to be converted, e.g. 1.3.44.
 - *RespectLeadingZeros* - Respect leading zeros by shifting the parts right, e.g. 1.02.3 becomes 1.0.2.3.

 
 
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->

## Contributions
Any constructive contribution is very welcome! If you encounter a bug or have an addition, please create a [new issue](https://github.com/texhex/MPSXM/issues/new).

## License
Copyright © 2016 [Michael Hex](http://www.texhex.info/). Licensed under the **Apache 2 License**. For details, please see LICENSE.txt.

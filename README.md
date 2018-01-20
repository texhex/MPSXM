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


### Add-RegistryValue ###
Adds a value to the given registry path. Uses [Set-RegistryValue] internally.
```powershell
Add-RegistryValue [-Path] <String> [-Name] <String> [-Value] <String> -REG_SZ
```
 - *Path* - The registry path, e.g. HKCU:\Software\TEMP\TSVARS
 - *Name* - The name of the registry value
 - *Value* - The value
 - *REG_SZ* - The data will be written as REG_SZ

### ConvertFrom-DateTimeString ###
Converts a string (created by ConvertTo-DateTimeString() to a DateTime. If the given string contains a time zone (...+/-01:00),
the DateTime is converted to local time. If the given string is in UTC (...Z), no conversion will take place.
```powershell
ConvertFrom-DateTimeString [-DateTimeString] <String>
```
 - *DateTimeString* - The string to be converted to a DateTime

### ConvertFrom-UTC ###
Converts a given Coordinated Universal Time (UTC) DateTime to local time.
```powershell
ConvertFrom-UTC [-DateTime] <DateTime>
```
 - *DateTime* - The DateTime to be converted to local time from UTC. Inputs not in UTC will result in an exception.

### ConvertTo-Array ###
Convert a single value or a list of objects to an array; this way (Array).Count or a ForEach() loop always works. An input of $null will result in an array with length 0.
```powershell
ConvertTo-Array [[-InputObject] <Object>]
```
 - *InputObject* - A single object, a list of objects or $null

### ConvertTo-DateTimeString ###
Converts a DateTime to a string as definied by ISO 8601. The result will be in the format [2016-11-24 14:59:16.718+01:00] for local and [2016-11-19 14:24:09.718Z] for UTC values.
```powershell
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds]
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds] -UTC
ConvertTo-DateTimeString [-DateTime] <DateTime> [-HideMilliseconds] -ForceUTC
```
 - *DateTime* - The DateTime to be converted to a string
 - *HideMilliseconds* - Do not include milliseconds in the result
 - *UTC* - Convert the DateTime to UTC before converting it to a string.
 - *ForceUTC* - Ignore the time zone/kind (Local, Unspecified, UTC) of the given DateTime and use it as if it were UTC already.

### ConvertTo-HumanizedBytesString ###
Returns a string optimized for readability.
```powershell
ConvertTo-HumanizedBytesString [-bytes] <Int64>
```
 - *bytes* - The value of bytes that should be returned as humanized string.

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

### Copy-FileToDirectory ###
Copies a file to a directory, overwritting any existing copy
```powershell
Copy-FileToDirectory [-Filename] <String> [-Directory] <String>
```
 - *Filename* - The full path to a file, e.g. C:\Temp\Testfile.txt
 - *Directory* - Path to the destination directory, e.g. C:\Windows\Temp

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

### Get-ContainingDirectory ###
Returns the directory containing the item defined in the path string
```powershell
Get-ContainingDirectory [-Path] <String>
```
 - *Path* - The string path e.g. C:\Path\MyFile.txt

### Get-CurrentProcessBitness ###
Returns information about the current powershell process.
```powershell
Get-CurrentProcessBitness -Is32bit
Get-CurrentProcessBitness -IsWoW
Get-CurrentProcessBitness -Is64bit
```
 - *Is32bit* - Returns $True if the current script is running as 32-bit process.
 - *IsWoW* - Returns $True if the current script is running as 32-bit process on a 64-bit machine (Windows on Windows).
 - *Is64bit* - Returns $True if the current script is running as 64-bit process.

### Get-FileName ###
Returns the filename (with or without the extension) from a path string
```powershell
Get-FileName [-Path] <String> [-WithoutExtension]
```
 - *Path* - The string path containing a filename, e.g. C:\Path\MyFile.txt
 - *WithoutExtension* - Return the filename without extension (MyFile.txt would be returned as MyFile)

### Get-ModuleAvailable ###
Returns true if the module exist; it uses a a method that is about 10 times faster then using Get-Module -ListAvailable
```powershell
Get-ModuleAvailable [-Name] <String>
```
 - *Name* - The name of the module to be checked

### Get-OperatingSystemBitness ###
Returns information about the current operating system
```powershell
Get-OperatingSystemBitness -Is32bit
Get-OperatingSystemBitness -Is64bit
```
 - *Is32bit* - Returns $True if the current operating system is 32-bit
 - *Is64bit* - Returns $True if the current operating system is 64-bit

### Get-QuickReference ###
Returns a quick reference about the given function or all functions in the module. The text returned includes function name, call syntax and parameters extracted from the function itself. 
If you are on GitHub: the entire reference page was generated with it.
```powershell
Get-QuickReference [-Name] <String> [-Output <String>] [-Module] [-SortByNoun]
```
 - *Name* - Name of the function or the module to generate a quick reference
 - *Output* - If the output should be a string (default), CommonMark or the real objects
 - *Module* - Name specifies a module, a quick reference for all functions in the module should be generated
 - *SortByNoun* - If a module is given, the functions are sorted by verb (e.g. all Get-xxx together, all Set-xxx together). This can be changed to be sorted by Noun, the second part of a function.

### Get-RandomString ###
Returns a random string (only Aa-Zz and 0-9 are used).
```powershell
Get-RandomString [-Length] <Int32>
```
 - *Length* - The length of the string that should be generated.

### Get-RegistryValue ###
Reads a registry value.
```powershell
Get-RegistryValue [-Path] <String> [-Name <String>] [-DefaultValue <Object>]
```
 - *Path* - The registry path, e.g. HKCU\Software\MPSXM\
 - *Name* - The name of the registry value to be read. If not defined, the (default) value is used
 - *DefaultValue* - The value to return if name does not exist. If not defined, $null is returned if Name does not exist

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

### Get-StringIsNullOrWhiteSpace ###
Returns true if the string is either $null, empty, or consists only of white-space characters (uses [Test-String -IsNullOrWhiteSpace] internally)
```powershell
Get-StringIsNullOrWhiteSpace [-string] <String>
```
 - *string* - The string value to be checked

### Get-TempFolder ###
Returns a path to the temporary folder without any (8+3) paths in it
```powershell
Get-TempFolder
```

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

### Read-StringHashtable ###
Reads a hashtable from a file where the Key-Value pairs are stored as Key==Value
```powershell
Read-StringHashtable [-File] <String>
```
 - *File* - The file to read the hashtable from

### Remove-FileExact ###
Deletes a file; no wildcards are accepted, the filename must be exact. Exact also means that an 8+3 alias is not allowed (Filena~1). If the file does not exist, no error is generated.
```powershell
Remove-FileExact [[-Filename] <String>]
```
 - *Filename* - The full path to the file that should be deleted.

### Select-StringUnicodeCategory ###
Selects (filters) characters based on their unicode category from the given string. [Select-StringUnicodeCategory "A B C 123" -IncludeLetter] would return "ABC"
```powershell
Select-StringUnicodeCategory [[-String] <String>] [-IncludeLetter] [-IncludeNumber] [-IncludeSpace] [-IncludePunctuation] [-IncludeSymbol]
```
 - *String* - The string the operation should be performed on
 - *IncludeLetter* - Include letter characters
 - *IncludeNumber* - Include number characters
 - *IncludeSpace* - Include the default space character (u0020)
 - *IncludePunctuation* - Include punctuation characters
 - *IncludeSymbol* - Include symbol characters

### Set-RegistryValue ###
Writes a registry value in the given registry path.
```powershell
Set-RegistryValue [-Path] <String> [-Name <String>] -Value <Object> [-Type {Unknown | String | ExpandString | Binary | DWord | MultiString | QWord | None}]
```
 - *Path* - The registry path, e.g. HKCU\Software\MPSXM\
 - *Name* - The name of the registry value. If not defined, the (default) value is used
 - *Value* - The value to be written
 - *Type* - The data type used in the registry (REG_xx). If not specified, the type of the given value will be used to assign DWord, QWord or String.

### Show-MessageBox ###
Shows the message to the user using a message box.
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

### Test-Admin ###
Determines if the current powershell is elevated (running with administrator privileges).
```powershell
Test-Admin
```

### Test-DirectoryExists ###
Returns if a the given directory exists
```powershell
Test-DirectoryExists [-Path] <String>
```
 - *Path* - The string path of a directory, e.g. C:\Windows

### Test-FileExists ###
Returns if a the given file exists
```powershell
Test-FileExists [-Path] <String>
```
 - *Path* - The string path of the fiel , e.g. C:\Temp\MyFile.txt"

### Test-IsISE ###
Returns if the current script is executed by Windows PowerShell ISE
```powershell
Test-IsISE
```

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






 
 
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->
<!---------------------------------- STOP HERE ---------------------------------->

## Contributions
Any constructive contribution is very welcome! If you encounter a bug or have an addition, please create a [new issue](https://github.com/texhex/MPSXM/issues/new).

## License
Copyright © 2010-2018 [Michael Hex](http://www.texhex.info/). Licensed under the **Apache 2 License**. For details, please see LICENSE.txt.

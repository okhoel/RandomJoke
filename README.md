# RandomJoke - PowerShell Module
This is a PowerShell module for printing random jokes in Norwegian

## Installation
After downloading the code you need to import the module
```powershell
Import-Module .\RandomJoke.psd1
```
## Usage
```powershell
Get-RandomJoke
```
## Contribution
You can add jokes to this module by editing the Jokes.ps1 in the Private-folder.
The joke needs to be in a script block that is added til the `$jokes` variable. This can be done like this:
```powershell
$jokes += {"Katten med slips!"}
```
But the reason for using a script block is that you can make PowerShell code that generates the joke. What about decoding a base64 string?
```powershell
$jokes += {[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("SMO4cnQgb20gc3ZlbnNrZW4gc29tIGdpa2sgdGlsIHBvbGl0aWV0IGZvcmRpIHBhcmFwbHllbiBoYW5zIHZhciBzbMOldHQgbmVkPw=="))}
```
This way you can have fun writng the jokes as well as reading them. :smile:
Your imagination is the only limit to what you can do.
Feel free to send pull requests with additional jokes.

To make sure Norwegian characters are displayed properly the encoding of the Jokes.ps1 should be 'UTF-8 with BOM'.

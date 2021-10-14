# RandomJoke - PowerShell Module
This is a PowerShell module for printing random jokes. You can choose from a given set of languages, and Norwegian is the default.

## Installation
You can install the module by cloning this repository.
```powershell
git clone https://github.com/okhoel/RandomJoke
Import-Module .\RandomJoke\RandomJoke
```
## Usage
```powershell
Get-RandomJoke
Get-RandomJoke -Language English
```
## Contribution
You can add jokes to this module by editing the Jokes.ps1 in the Private-folder.
The joke needs to be in a Joke object that is added til the `$jokes` variable. The Joke object contains a language specifier and a script block that outputs a string with the joke. This can be done like this:
```powershell
$jokes += [Joke]::new("Norwegian", {"Katten med slips!"})
```
But the reason for using a script block is that you can make PowerShell code that generates the joke. What about decoding a base64 string?
```powershell
$jokes += [Joke]::new("Norwegian", {[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("SMO4cnQgb20gc3ZlbnNrZW4gc29tIGdpa2sgdGlsIHBvbGl0aWV0IGZvcmRpIHBhcmFwbHllbiBoYW5zIHZhciBzbMOldHQgbmVkPw=="))})
```
This way you can have fun writng the jokes as well as reading them. :smile:
Your imagination is the only limit to what you can do.
Feel free to send pull requests with additional jokes.

To make sure special characters are displayed properly the encoding of the Jokes.ps1 should be 'UTF-8 with BOM'.

## Forks and pull requests
This repository is a good place to practice GitHub concepts like forks and pull requests.

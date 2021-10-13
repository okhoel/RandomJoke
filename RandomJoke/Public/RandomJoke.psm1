<#
.SYNOPSIS
List available languages in the RandomJoke module

.DESCRIPTION
Use this to list the available languages you can use for the -Languages attribute i Get-RandomJoke.

.EXAMPLE
Get-RandomJokeLanguage

List all available languages
#>
function Get-RandomJokeLanguages{
    [Language].GetEnumNames()
}
<#
.SYNOPSIS
Print a random joke in the given language

.DESCRIPTION
This will print a random joke. You can specify what language you want the joke to be in. If no language is given the joke will be in Norwegian.

.PARAMETER Language
The language of the joke. Use Get-RandomJokeLanguages to show a list of available languages.

.EXAMPLE
Get-RandomJoke

Print a random joke in Norwegian

.EXAMPLE
Get-RandomJoke -Language English

Print a random joke in English

.NOTES
General notes
#>
function Get-RandomJoke{
    [CmdletBinding()]
    param (
        [Parameter()]
        [Language]$Language = "Norwegian"
    )
    $jokes = Get-Jokes -Language $Language

    if ($jokes.length -gt 0){
        ($jokes | Get-Random).toString()
    }
    else {
        "No jokes in $Language"
    }
}

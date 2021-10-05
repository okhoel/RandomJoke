function Get-RandomJokeLanguages{
    [Language].GetEnumNames()
}
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

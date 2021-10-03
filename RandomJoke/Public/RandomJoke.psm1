function Get-RandomJoke{
    [CmdletBinding()]
    param (
        [Parameter()]
        [Language]$Language = "Norwegian"
    )
    $jokes = Get-Jokes -Language $Language
    if ($jokes.length -gt 0){
        (Get-Random $jokes).toString()
    }
    else {
        "No jokes in $Language"
    }
}
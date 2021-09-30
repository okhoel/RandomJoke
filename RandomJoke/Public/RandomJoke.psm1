function Get-RandomJoke{
    $jokes = Get-Jokes
    invoke-command -ScriptBlock (Get-Random $jokes)
}
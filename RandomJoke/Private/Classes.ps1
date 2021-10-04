class Joke {
    [Language]$Language
    [ScriptBlock]$Content

    Joke(
        [Language]$l,
        [ScriptBlock]$c    
    ){
        $this.Language = $l
        $this.Content = $c
    }

    [string]toString() {
        return (Invoke-Command -ScriptBlock $this.Content)
    }
}
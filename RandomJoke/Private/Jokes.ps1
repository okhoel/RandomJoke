#Encoding should be UTF-8 with BOM

Add-Type @'
public enum Language{
    Norwegian,
    English
}
'@

. $PSScriptRoot\Classes.ps1

[Joke[]]$jokes = @()
$jokes += [Joke]::new("Norwegian", {"Katten med slips!"})
$jokes += [Joke]::new("Norwegian", {[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("SMO4cnQgb20gc3ZlbnNrZW4gc29tIGdpa2sgdGlsIHBvbGl0aWV0IGZvcmRpIHBhcmFwbHllbiBoYW5zIHZhciBzbMOldHQgbmVkPw=="))})
$jokes += [Joke]::new("Norwegian", {
    $dict = "andre", "at", "av", "beroligende", "blir", "deg", "dem", "den", "det", "død", "en", "er", "et", "faller", "finner", "forsikre", "fram", "først", "gjøre", "han", "hjelpe", "hva", "høres", "i", "jeg", "jegere", "jegeren", "kan", "min", "mobiltelefonen", "må", "nødsentralen", "nå", "når", "og", "OK", "om", "operatøren", "oss", "plutselig", "ringer", "skal", "skogen", "skudd", "slapp", "stille", "svarer", "så", "til", "to", "ute", "vennen", "vi"
    $words = 49, 25, 11, 50, 23, 42, 33, 10, 2, 6, 39, 13, 36, 7, 0, 26, 14, 16, 29, 34, 40, 48, 31, 51, 28, 11, 9, 21, 27, 24, 18, 37, 46, 3, 44, 2, 24, 41, 20, 5, 17, 30, 52, 15, 38, 36, 1, 19, 11, 9, 8, 4, 45, 34, 47, 22, 12, 43, 35,21, 32
    $chars = '.', '!', '?', ':', ',', '»', '«'
    $map = (12, 22, 39, 49, 57), 26, (30, 60), 33, (35, 52, 58), (30, 49, 60), (23, 34, 58)
    $story = @()
    foreach ($i in $words) {$story += $dict[$i]}
    foreach ($i in 0, 13, 23, 27, 31, 34, 40, 50) {$story[$i] = $story[$i].Substring(0,1).ToUpper()+$story[$i].Substring(1)}
    foreach ($i in 0..($chars.length-2)) {foreach ($j in $map[$i]) {$story[$j] += $chars[$i]}}
    foreach ($i in $map[$chars.length-1]) {$story[$i] = $chars[$chars.length-1] + $story[$i]}
    $story -join ' '
})
$jokes += [Joke]::new("Norwegian", {
    $res = [String]::Empty
    foreach ($c in "Zva xbar fn ng wrt zåggr irytr zryybz uraar bt sbgonyyra.`nQrg ine qn xwvcg! Wn, wrt fniare uraar yvgg.".ToCharArray()) {
        $a = [byte]$c
        if ($a -ge 65 -and $a -le 90) {$a = (($a-52)%26)+65}
        elseif ($a -ge 97 -and $a -le 122) {$a = (($a-84)%26)+97}
        $res += [char]$a
    }
    $res
})
$jokes += [Joke]::new("Norwegian", {
    $KebabString = "ProsjektledeREnPersonSomTrorAtNiDamerKanFåEnBabyPåEnMåned"
    $res = ""
    $lastCharUpper = $False

    $res = for ([int]$i = 0; $i -lt $KebabString.Length; $i++) {
        $char = $KebabString[$i]
        if ($char -cmatch '[A-ZÆØÅ]') {
            # uppercase
            if ($i -eq 0) {
                $char
            } elseif ($lastCharUpper) {
                "`n$Char"
            } elseif ($KebabString[$i+1] -cmatch '[A-ZÆØÅ]') {
                "$(([String]$Char).ToLower())"
            } else {
                " $(([String]$Char).ToLower())"
            }
            $lastCharUpper = $True
        } else {
            # Lowercase
            $char
            $lastCharUpper = $False
        }
    }

    "$($res -join '')."
})
$jokes += [Joke]::new("Norwegian", {
    $emoji = @{
        '1' = '😋';
        '2' = '😎';
        '3' = '😃';
        '4' = '😄';
        '5' = '😁';
        '6' = '😂';
        '7' = '🤣';
        '8' = '🤢';
        '9' = '🤮';
    }

    $plansje = for ($i=1;$i -lt 10;$i++) {
        [pscustomobject]@{
            konsum = "$('🍺' * $i)"
            effekt = "$($emoji.[string]$i)"
        }
    }

    $plansje | Format-Table -AutoSize | Out-String
})
$jokes += [Joke]::new("English", {
    # TCP Jokes can be long, so it is stored in a ZIP-compressed byte string.
    [String]$compressedTCPJoke = "31,139,8,0,0,0,0,0,0,10,173,84,193,82,194,48,20,124,103,190,162,55,46,140,35,95,224,56,94,112,60,200,129,11,199,88,58,16,169,45,147,4,164,127,239,238,75,44,69,64,45,58,153,242,146,102,223,190,183,155,148,137,88,25,73,38,143,50,148,5,98,137,245,90,10,204,130,212,248,93,97,110,196,97,102,240,204,228,65,166,136,175,216,35,234,70,6,50,65,44,49,106,229,121,71,220,98,69,174,70,231,125,57,239,192,57,71,244,127,236,235,89,158,90,6,246,199,204,216,233,161,179,203,185,235,148,75,69,54,101,253,92,243,30,187,69,135,159,43,131,254,155,43,181,19,245,118,5,207,87,13,145,197,200,139,246,21,90,22,15,108,165,254,6,101,60,199,68,134,112,228,67,9,38,175,239,198,114,155,88,114,224,201,20,59,183,186,187,82,28,185,121,43,50,96,248,198,225,201,245,44,220,17,122,1,12,149,103,224,169,219,252,157,118,101,82,149,128,97,177,191,236,228,69,5,62,117,72,29,17,191,129,210,74,107,242,238,84,23,93,57,245,118,169,149,62,79,209,157,113,37,250,101,122,251,242,91,71,190,247,162,82,213,123,40,164,178,60,249,112,234,15,145,60,219,126,14,241,123,161,47,30,149,29,70,163,92,7,47,162,34,162,217,179,213,85,87,153,69,118,161,117,227,93,227,13,250,255,255,136,15,108,240,6,252,184,4,0,0"
    [byte[]]$compressedBytes = $compressedTCPJoke -split ','
    $in = New-Object System.IO.MemoryStream(,$compressedBytes)
    $out = New-Object System.IO.MemoryStream
    $gzipStream = New-Object System.IO.Compression.GzipStream $in, ([IO.Compression.CompressionMode]::Decompress)
    $gzipStream.CopyTo( $out )
    $gzipStream.Close()
    $in.Close()
    [byte[]]$TCPJokeUncompressedBytes = $out.ToArray()
    [System.Text.Encoding]::ASCII.GetString($TCPJokeUncompressedBytes)
})
$jokes += [Joke]::new("English", {
    $d = 25
    "Christmas is the same as Halloween:`n$([Convert]::ToString($d,10)) DEC = $([Convert]::ToString($d,8)) OCT"
})
$jokes += [Joke]::new("English", {
    $BinaryJoke = '01010100011010000110010101110010011001010010000001100001011100100110010100100000001100010011000000100000011010110110100101101110011001000111001100100000011011110110011000100000011100000110010101101111011100000110110001100101001000000110100101101110001000000111010001101000011001010010000001110111011011110111001001101100011001000011101000100000010101000110100001101111011100110110010100100000011101110110100001101111001000000111010101101110011001000110010101110010011100110111010001100001011011100110010000100000011000100110100101101110011000010111001001111001001000000110000101101110011001000010000001110100011010000110111101110011011001010010000001110111011010000110111100100000011001000110111101101110001001110111010000101110'

	$sb = [System.Text.StringBuilder]::new($BinaryJoke.Length)

	for ($i = 0; $i -lt $BinaryJoke.Length; $i += 8) {
		$Byte = -join $BinaryJoke[$i..($i + 7)]
		$Char = [Char][Convert]::ToUInt16($Byte, 2)
		$null = $sb.Append($Char)
	}

	$sb.ToString()
})
$jokes += [Joke]::new("Norwegian", {
    $r = ""
    $d = " ,.?FNaefiklmorå"
    $e = "BG4Qj+CP4I/jBXkQj+CP4JqnCP4QjeCP4I/gtsI="
    $bs = [convert]::FromBase64String($e)
    foreach ($b in $bs) {
        $r += $d[$b -shr 4]
        $r += $d[$b -band 15]
    }
    $r
})

$jokes += [Joke]::new("English", {
    (-split"I made a UDP joke but I don't care if you get it" | Sort-Object { Get-Random })-join ' '
})

$jokes += [Joke]::new("English", {
    $stack = New-Object System.Collections.Generic.Stack[String]
    $ekoj =  ".now 'i' ?elbairav pool rof eman tseb eht rof etabed eht now ohW"
    $joke = ""

    for ($i = 0; $i -lt $ekoj.Length; $i++) {
        $stack.Push([String]$ekoj[$i])
    }

    for ($i = 0; $i -lt $ekoj.Length; $i++) {
        $joke += $stack.Pop()
    }

    $joke
})

$jokes += [Joke]::new("English", {
    $num = 2
    $errors = "caching", "naming", "off-by-one"
    "There are $num hard problems in computer science: $(0..$num|ForEach-Object {"$($errors[$_])$(if($_ -lt $num){', '}else{' '})"})errors"
})

function Get-Jokes {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Language]$Language
    )
    
    return $jokes | Where-Object {$_.Language -eq $Language}
}

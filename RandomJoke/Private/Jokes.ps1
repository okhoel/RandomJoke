#Encoding should be UTF-8 with BOM
$jokes = @()
$jokes += {"Katten med slips!"}
$jokes += {[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("SMO4cnQgb20gc3ZlbnNrZW4gc29tIGdpa2sgdGlsIHBvbGl0aWV0IGZvcmRpIHBhcmFwbHllbiBoYW5zIHZhciBzbMOldHQgbmVkPw=="))}
$jokes += {
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
}
$jokes += {
    $res = [String]::Empty
    foreach ($c in "Zva xbar fn ng wrt zåggr irytr zryybz uraar bt sbgonyyra.`nQrg ine qn xwvcg! Wn, wrt fniare uraar yvgg.".ToCharArray()) {
        $a = [byte]$c
        if ($a -ge 65 -and $a -le 90) {$a = (($a-52)%26)+65}
        elseif ($a -ge 97 -and $a -le 122) {$a = (($a-84)%26)+97}
        $res += [char]$a
    }
    $res
}
function Get-Jokes {
    return $jokes
}
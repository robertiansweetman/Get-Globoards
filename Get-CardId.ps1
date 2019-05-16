function Get-CardId {

    param(
        $boardId,
        $actionMessage
    )

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $uri = "https://$url/boards/"+ $boardId + "/cards"

    $cards = Invoke-RestMethod -Uri $uri -Method GET -ContentType 'application/json' -Token $newToken -Authentication Bearer

    $listCards = @()
    
    foreach ($item in $cards) {
        $listCards += $item
        Write-Host ($listCards).name
    }

    for ($i = 0; $i -lt $listCards.length; $i++) {
        Write-Host "To update"($listCards[$i]).name"select:" ($1++ + 1)
    }

    Do { $cardChoice = Read-Host -Prompt "$actionMessage"} 
    while ((1..$listCards.length) -notcontains $cardChoice)
    
    $cardId = ($listCards[$cardChoice - 1]).id    
    
    return $cardId

}
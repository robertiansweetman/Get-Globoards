function Remove-Card {

# /boards/{board_id}/cards/{card_id}

    $boardId = Get-BoardId
    
    $cardId = Get-CardId -boardId $boardId -actionMessage "select which card to DELETE"

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force
    
    $link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId

Invoke-RestMethod -Method Delete -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}


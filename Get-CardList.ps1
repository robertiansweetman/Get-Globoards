function Get-CardList {

    $boardId = Get-BoardId -Message "List items for Board number [?]"

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $uri = "https://$url/boards/"+ $boardId + "/cards?fields=description,name,column_id,board_id"

    $cards = Invoke-RestMethod -Uri $uri -Method GET -ContentType 'application/json' -Token $newToken -Authentication Bearer
    
    foreach ($item in $cards) {
        Write-Host ($item).name -ForegroundColor Green
        Write-Host "Description:"($item).description.text -ForegroundColor Yellow
    }

    # TODO: Can you assign values to these and then edit them from here?

}
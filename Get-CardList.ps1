function Get-CardList {

    $boardId = Get-BoardId

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $uri = "https://$url/boards/"+ $boardId + "/cards"

    $cards = Invoke-RestMethod -Uri $uri -Method GET -ContentType 'application/json' -Token $newToken -Authentication Bearer

    $listCards = @()
    
    foreach ($item in $cards) {
        $listCards += $item
        Write-Host ($listCards).name
    }

}
function edit-CardDescription {

    param(
        [Parameter(Mandatory=$true)]
        [string]$description
    )
    
    # need to replace this with something smarter
    . ($PSScriptRoot + "./secrets.ps1")
    
    $boardId = Get-Board
    
    $cardId = Get-CardId -boardId $boardId
        
$bodyJson=@"
{
"position": 0,
"description": {
    "text": "$description"
    }
}
"@
    
    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force
    
    $link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId

<#
TODO: what fields can be edited?
/boards/{board_id}/cards/{card_id}
Edits a card
#>

Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}
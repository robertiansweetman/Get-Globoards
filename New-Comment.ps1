function New-Comment {

param(
    [Parameter(Mandatory=$true)]
    [string]
    $comment
)

    $boardId = Get-BoardId

    $cardId = Get-CardId -boardId $boardId -actionMessage "select which card to add comment to"
    
$bodyJson=@"
{
"text": "$comment"
}
"@

$newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

$link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId + "/comments"

# TODO: Consider better error handling at this step also...
Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}
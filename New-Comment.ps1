function New-Comment {

param(
    [Parameter(Mandatory=$true)]
    [string]
    $Comment
)

    $boardId = Get-BoardId -Message "Which board contains the card you want to add the comment to?"

    $cardId = Get-CardId -boardId $boardId -actionMessage "select which card to add comment to"
    
$bodyJson=@"
{
"text": "$Comment"
}
"@

$newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

$link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId + "/comments"

# TODO: Consider better error handling at this step also...
Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}
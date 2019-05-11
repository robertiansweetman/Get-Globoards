function New-Column {

    param(
        $name
    )

    $boardId = Get-BoardId

$bodyJson=@"
{
"name": "$name",
"position": 0
}
"@

    $link = "https://$url/boards/$boardId/columns?$token"

    Write-Verbose $link

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json'

}
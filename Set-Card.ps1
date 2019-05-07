function Set-Card {

    param(
        $name,
        $description
    )

    # need to replace this with something smarter
    . ($PSScriptRoot + "./secrets.ps1")

    $boardId = Get-Board

    $columnId = Get-ColumnId -boardId $boardId

$bodyJson=@"
{
    "name": "$name",
    "description": {
        "text": "$description"
    },
    "position": 0,
    "column_id": "$columnId"
}
"@

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $link = "https://$url/boards/"+ $boardId + "/cards"

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

    # TODO: Parse returned JSON into something more human readable.

}
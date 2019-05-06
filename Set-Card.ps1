function Set-Card {

    param(
        $name,
        $description
        # $column_Id
        # $boardId
        # TODO: check other params to add
    )

    # need to replace this with something smarter
    . ($PSScriptRoot + "./secrets.ps1")

    $boardId = Get-Board

    Write-Host "$boardId :boardId returned here"

    $columnId = Get-ColumnId -boardId $boardId

    Write-Host "description text: $description"

    # FIXME: this blob isn't going to work 'cause $description is "text": "string"
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

    Write-Host $bodyJson

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $link = "https://$url/boards/"+ $boardId + "/cards"

    Write-Verbose $link

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}
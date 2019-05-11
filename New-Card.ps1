function New-Card {

    param(
        $name,
        $description
    )

    $boardId = Get-BoardId

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

    # TODO: Once a card has been set can you add comment Y/N at this point or is it a case of going back to the beginning? What's the testing process for this stuff?

    # FIXME: Look at Pester in relation to mocking endpoints/calls

}
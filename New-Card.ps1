function New-Card {

    param(
        [Parameter(Mandatory = $true)]
        [String]
        $Name,
        [Parameter(Mandatory = $true)]
        [String]
        $Description
    )

    $boardId = Get-BoardId -Message "Which board do you want to add a new card to?"

    $columnId = Get-ColumnId -boardId $boardId

$bodyJson=@"
{
    "name": "$Name",
    "description": {
        "text": "$Description"
    },
    "position": 0,
    "column_id": "$columnId"
}
"@

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $link = "https://$url/boards/"+ $boardId + "/cards"

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

    Do { $addMoreCards = Read-Host -Prompt "Add Another Card? [y/n]" 

        if ($addMoreCards -eq 'y') {

            $Name = Read-Host -Prompt "New Card Name?"
            $Description = Read-Host -Prompt "New Card Description?"

            $bodyJson=@"
{
    "name": "$Name",
    "description": {
        "text": "$Description"
    },
    "position": 0,
    "column_id": "$columnId"
}
"@

Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

        }

    }
    Until ($addMoreCards -eq 'n')

    #>
    
    # TODO: Parse returned JSON into something more human readable.

    # TODO: Once a card has been set can you add comment Y/N at this point or is it a case of going back to the beginning? What's the testing process for this stuff?

    # FIXME: Look at Pester in relation to mocking endpoints/calls

}
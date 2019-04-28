function Set-Card {

    param(
        $name,
        $description
        # $column_Id
        # $boardId
        # TODO: check other params to add
    )

    $boardId = Get-Board

    # FIXME: this blob isn't going to work 'cause $description is "text": "string"
$bodyJson=@{
name=$name;
description=$description;
position=0
} | ConvertTo-Json

    $link = "https://$url/boards/$boardId/cards?$token"

    Write-Verbose $link

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' #-ErrorVariable err
    
    #Write-Verbose $err

}
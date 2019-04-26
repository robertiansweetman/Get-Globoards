function new-Column {

    param(
        $name,
        $boardId
    )

$bodyJson=@{
name=$name;
position=0
} | ConvertTo-Json

    $link = "https://$url/boards/$boardId/columns?$token"

    Write-Verbose $link

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' #-ErrorVariable err
    
    #Write-Verbose $err

}
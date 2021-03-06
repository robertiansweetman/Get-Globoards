function New-Board {

    param(
        [Parameter(Mandatory = $true)]
        [String]
        $Name
    )

$bodyJson=@"
{
"name": "$Name"
}
"@

    Write-Verbose "$bodyJson"

    $link = "https://$url/boards?access_token=$token"

    Write-Verbose $link

    # TODO: Consider better error handling at this step also...
    Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json'

    # NOTE: there is a limit of 10 new boards per day for boards created via API

}
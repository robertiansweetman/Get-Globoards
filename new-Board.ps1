function new-Board {

    param(
        #[Parameter(Mandatory = $true)]
        #[String[]]
        $Name#,
        #$url,
        #$token
    )

$bodyJson=@{
name=$Name
} | ConvertTo-Json

    Write-Host "$bodyJson"

    $link = "https://$url/boards?$token"

    Write-Host $link

Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -ErrorVariable err
Write-Host $err

    # NOTE: there is a limit of 10 new boards per day for boards created via API

}
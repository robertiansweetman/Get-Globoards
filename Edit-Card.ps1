function Edit-Card {

    [CmdletBinding(DefaultParameterSetName='Description')]
    param(
        [Parameter(ParameterSetName = 'Description')]
        [string]$description,
        
        [Parameter(ParameterSetName = 'Name')]
        [string]
        $name
    )
    
    $boardId = Get-BoardId
    
    $cardId = Get-CardId -boardId $boardId

if ($PSBoundParameters.ContainsKey('Description')) {
    Write-Host 'DESCRIPTION SET'
    $bodyJson=@"
{
"position": 0,
"description": {
    "text": "$description"
    }
}
"@
}

if ($PSBoundParameters.ContainsKey('Name')) {
    Write-Host 'NAME SET'
    $bodyJson=@"
{
"name": "$name"
}
"@
}

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force
    
    $link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId

Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}
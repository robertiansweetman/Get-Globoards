function Get-ColumnId {

    param(
        $boardId
    )

    . ($PSScriptRoot + "./secrets.ps1")

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

    $uri = "https://$url/boards/"+ $boardId + "?fields=columns"

    $Columns = Invoke-RestMethod -Uri $uri -Method GET -ContentType 'application/json' -Token $newToken -Authentication Bearer

    $listColumns = @()
    
    foreach ($item in $Columns) {
        $listColumns += $item
        Write-Host ($listColumns).columns.name
    }

    for ($i = 0; $i -lt $listColumns.length; $i++) {
        Write-Host "To update"($listColumns[$i]).columns.name"select:" ($1++ + 1)
    }

    Do { $columnChoice = Read-Host -Prompt "Select which column to add card to"} 
    while ((1..$listColumns.length) -notcontains $columnChoice)
    
    $columnId = ($listColumns[$columnChoice - 1]).columns.id    
    
    return $columnId

}
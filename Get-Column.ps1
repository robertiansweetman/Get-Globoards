function Get-Column {

    $boardId = Get-Board

    Write-Host $boardId

    . ($PSScriptRoot + "./secrets.ps1")

    Write-Host $token

    Write-Host "This bit blows up"

    $Columns = Invoke-RestMethod -Uri "https://$url/boards/$boardId/$token?fields=columns" -Method Get -ContentType "application/json"
    
    $listColumns = @()
    
    foreach ($item in $Columns) {
        $listColumns += $item
        Write-Host $listColumns
    }

    #for ($i = 0; $i -lt $listColumns.length; $i++) {
    #    Write-Host "To update"($listColumns[$i]).name"select:" ($1++ + 1)
    #}

    # NOTE: I miss-read the second API call when it's $url/boards/{board_id} <<=   
    

<#

    
    
    Do { $columnChoice = Read-Host -Prompt "Select which column to add card to"} 
    while ((1..$listColumns.length) -notcontains $columnChoice)
    
    $columnId = ($listColumns[$columnChoice - 1]).id #| Out-Host
    
    # $boardName = ($listboards[$boardChoice - 1]).name #| Out-Host
    
    # TODO: check whether return is still needed if boardId is the last item in the function
    return $columnId

#>

}
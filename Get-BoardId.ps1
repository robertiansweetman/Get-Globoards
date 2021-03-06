function Get-BoardId {

    param(
        [string]
        $Message
    )

    $Boards = Invoke-RestMethod -Uri "https://$url/boards?access_token=$token" -Method Get -ContentType "application/json"
    
    $listBoards = @()
    
    foreach ($item in $Boards) {
        $listBoards += $item
    }
    
    for ($i = 0; $i -lt $listBoards.length; $i++) {
        Write-Host "To update"($listBoards[$i]).name"select:" ($1++ + 1)
    }
    
    Do { $boardChoice = Read-Host -Prompt $message} 
    while ((1..$listBoards.length) -notcontains $boardChoice)
    
    $boardId = ($listBoards[$boardChoice - 1]).id
    
    return $boardId
}
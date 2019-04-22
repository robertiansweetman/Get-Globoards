function list-Boards {

    $Boards = Invoke-RestMethod -Uri "https://$url/boards?$token" -Method Get -ContentType "application/json"
    
    $listBoards = @()
    
    foreach ($item in $Boards) {
        $listBoards += $item
    }
    
    return $listBoards
    
}
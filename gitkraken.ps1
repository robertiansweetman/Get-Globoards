. ($PSScriptRoot + "./secrets.ps1")
# TODO: turn all these calls into functions
# TODO: put all this code on github

$response = Invoke-RestMethod -Uri "https://$url/boards?$token" -Method Get -ContentType "application/json"

$listOfBoards = @()

$boardsId = foreach ($item in $response) {
    $listOfBoards += $item
}

# TODO: Make this print the name and possibly the Id but in a much nicer format
for ($i = 0; $i -lt $listOfBoards.length; $i++) {
    Write-Host "Choose"($listOfBoards[$i]).name":" ($1++ + 1)
}

$boardChoice = Read-Host -Prompt "Pick Which board to Update"

$boardId = ($listOfBoards[$boardChoice - 1]).id | Out-Host

$boardName = ($listOfBoards[$boardChoice - 1]).name | Out-Host

function Reset {
    $boardId = $null;
    $boardName = $null
}

Reset

Write-Host $boardId $boardName "empty string"
. ($PSScriptRoot + "./secrets.ps1")
. ($PSScriptRoot + "./list-Boards.ps1")
. ($PSScriptRoot + "./reset-Boards.ps1")

# TODO: function names SHOULD match the API calls they're making really...

# TODO: is there a neater way to get this list and pipe it into the other functions?
$listBoards = list-Boards

# TODO: Make this print the name and possibly the Id but in a much nicer format
for ($i = 0; $i -lt $listBoards.length; $i++) {
    Write-Host "To update"($listBoards[$i]).name"select:" ($1++ + 1)
}

$boardChoice = Read-Host -Prompt "Select which board to update"

$boardId = ($listBoards[$boardChoice - 1]).id | Out-Host

$boardName = ($listboards[$boardChoice - 1]).name | Out-Host

# TODO: can you mock this stuff using Pester? No idea. Leave this for now...
# TODO: remove this later. It's only for testing the workflow at the moment
reset-Boards
Write-Host $boardId $boardName "empty string"
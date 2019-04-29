. ($PSScriptRoot + "./secrets.ps1")
. ($PSScriptRoot + "./Get-Board.ps1")
. ($PSScriptRoot + "./reset-Boards.ps1")
. ($PSScriptRoot + "./new-Board.ps1")
. ($PSScriptRoot + "./Set-Column.ps1")
. ($PSScriptRoot + "./Set-Card.ps1")
. ($PSScriptRoot + "./Get-Column.ps1")

# FIXME: Begin turning this into a module now before anyone else gets hurt!
# NOTE: Update board needs to INCLUDE the 'get list' funtion for it to work <-- pay attention to this!
# NOTE: Is there an 'include' for powershell or are we .Sourcing everything? <-- redo 'creating modules' course...

# TODO: function names SHOULD match the API calls they're making really...

# TODO: is there a neater way to get this list and pipe it into the other functions?
# $listBoards = list-Boards

# TODO: Make this print the name and possibly the Id but in a much nicer format

# TODO: can you mock this stuff using Pester? No idea. Leave this for now...
# TODO: remove this later. It's only for testing the workflow at the moment
# reset-Boards
# Write-Verbose "$boardId $boardName empty string"

Set-Variable -Name token -Value $token -Scope Global

# New-Board -Name slimshady -Verbose

# FIXME: Need to select Board or get a boards from list BEFORE running this to create a new column
# TODO: figure out why -ErrorVariable and Write-Verbose in Invoke-RestMethod keeps breaking everything

# Set-Card -Name "new-card" -description "some text goes here"

Get-Column
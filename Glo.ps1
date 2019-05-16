. ($PSScriptRoot + "./secrets.ps1")
. ($PSScriptRoot + "./Get-BoardId.ps1")
. ($PSScriptRoot + "./Reset-Boards.ps1")
. ($PSScriptRoot + "./New-Board.ps1")
. ($PSScriptRoot + "./New-Column.ps1")
. ($PSScriptRoot + "./New-Card.ps1")
. ($PSScriptRoot + "./Get-ColumnId.ps1")
. ($PSScriptRoot + "./Get-CardId.ps1")
. ($PSScriptRoot + "./Edit-Card.ps1")
. ($PSScriptRoot + "./New-Comment.ps1")
. ($PSScriptRoot + "./Remove-Card.ps1")
<#
1. Turn it into a module
2. Add delete function - OR how to set a task as DONE
3. Pester tests
4. Start using it to discover what's missing
#>

# check secrets.ps1 file is referenced and contains values
if (Test-Path -Path secrets.ps1 -IsValid) {
    if (($Global:token -eq $null) -or ($Global:url -eq $null)) {
        Write-Host "secrets.ps1 file is missing PAT Token or Url for Gitkraken" -ForegroundColor 'red'
        exit 1
    } 
} else {
    Write-Host "secrets.ps1 file missing - please read the documentation" -ForegroundColor 'red'
    exit 1
}

# FIXME: change Edit-CardDescription to Edit -variable choice here (Description, name, etc.)
# FIXME: Do I need to call 'Reset-Boards' at the end of an Edit/New action to null the input variables?
# FIXME: Begin turning this into a module now before anyone else gets hurt!

# NOTE: Update board needs to INCLUDE the 'get list' funtion for it to work <-- pay attention to this!
# NOTE: Is there an 'include' for powershell or are we .Sourcing everything? <-- redo 'creating modules' course...
# NOTE: Can't returns from the API be managed as objects in a 'GUI LIKE' way so you don't have to keep stepping through the query flow to add a comment to a document? [see note below about pipes]

# TODO: Add delete functions << next
# TODO: function names SHOULD match the API calls they're making really... <<==

# FIXME: actually use PIPES to send results from one function to the next!!

# TODO: can you mock this stuff using Pester? No idea. Leave this for now...

# TODO: Add pathing to the readme
# TODO: Add a way of updating the same column over and over till you're done with path
# TODO: Rename Reset-Boards function to something more descriptive...

# Edit-Card -Name "Woohoow!" -Description "what happens now?"

# New-Card -Name 'some new card' -Description 'testing global variables for loading'

Remove-Card
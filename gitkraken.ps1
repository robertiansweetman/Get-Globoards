. ($PSScriptRoot + "./secrets.ps1")
. ($PSScriptRoot + "./Get-Board.ps1")
. ($PSScriptRoot + "./Reset-Boards.ps1")
. ($PSScriptRoot + "./New-Board.ps1")
. ($PSScriptRoot + "./Set-Column.ps1")
. ($PSScriptRoot + "./Set-Card.ps1")
. ($PSScriptRoot + "./Get-ColumnId.ps1")

# FIXME: Begin turning this into a module now before anyone else gets hurt!
# NOTE: Update board needs to INCLUDE the 'get list' funtion for it to work <-- pay attention to this!
# NOTE: Is there an 'include' for powershell or are we .Sourcing everything? <-- redo 'creating modules' course...

# TODO: function names SHOULD match the API calls they're making really...

# FIXME: actually use PIPES to send results from one function to the next!!

# TODO: use {0} {1} etc. and -f notation <== for strings! look this up

# TODO: can you mock this stuff using Pester? No idea. Leave this for now...

# Set-Variable -Name token -Value $token -Scope Global

# TODO: figure out why -ErrorVariable and Write-Verbose in Invoke-RestMethod keeps breaking everything

Set-Card -Name testing -Description 'try to do this thing'
# TODO: Add 'list items' (cards?) function?
# TODO: Format Write-Host items with color to make them easier to read
# TODO: Bulk add to the same board/column?
# TODO: Add explanations of functions to the README.md AND the module in the form of HELP

# FIXME: Add Pester tests

# TODO: use a function of the module to check that there is a Secrets file available
# TODO: OR put this global value in the psd1 file?

# FIXME: put this code in the module loading checks OR host the variables in the module
# TODO: This check can be done in the PSD1 file or the values can be stored there possibly...?
# check secrets.ps1 file is referenced and contains values

# Set-Variable -Name PAT -Value <PAT GOES HERE> -Scope Global

<#
if (Test-Path -Path secrets.ps1 -IsValid) {
    if (($Global:token -eq $null) -or ($Global:url -eq $null)) {
        Write-Host "secrets.ps1 file is missing PAT Token or Url for Gitkraken" -ForegroundColor 'red'
        exit 1
    } 
} else {
    Write-Host "secrets.ps1 file missing - please read the documentation" -ForegroundColor 'red'
    exit 1
}
#>

# FIXME: Do I need to call 'Reset-Glo' at the end of an Edit/New action to null the input variables?

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

# New-Card -Name 'some new card' -Description 'testing global variables for loading'

# NOTE: script needs to be run in an elevated shell to copy updates to the PSModule

# Uninstall-Module -Name Glo

$destination = $env:PSModulePath.split(';')[2] + "\Glo"

Copy-Item -Path '.\Edit*','.\Get*','.\Glo.psd1','.\Glo.psm1','.\New*','.\Remove*','.\secrets.ps1','.\README.md' -Destination $destination -Force 

Import-Module -Name Glo -Force
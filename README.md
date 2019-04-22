# Get-Globoards

Uses the Gitkraken Globoards API to allow the creation of ToDo items in the PowerShell command line

1. Create a Personal Access Token https://support.gitkraken.com/developers/pats/
    * NOTE: OAuth is not used
1. PAT needs to be added manually to the 'secrets.ps1' file which is referenced in the module
    * This is your own access token
    * The secrets.ps1 file also contains any global variables used in the code so that, if the API changes, hopefully we can change the version reference in one place :)
1. Refer to the REST API docs here https://gloapi.gitkraken.com/v1/docs/


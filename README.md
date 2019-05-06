# Get-Globoards

Uses the Gitkraken Globoards API to allow the creation of ToDo items in the PowerShell command line

1. Create a Personal Access Token https://support.gitkraken.com/developers/pats/
    * NOTE: OAuth is not used
1. You need to create your own 'secrets.ps1' file in the same folder as the root of the module
    * This is needs to contain you own access token in the $token variable (see below)
    * The secrets.ps1 file also contains any global variables used in the code so that, if the API changes, hopefully we can change the version reference in one place :)
    ```
    $token = '<YOUR PAT HERE>'
    $url = 'gloapi.gitkraken.com/v1/glo'
    ```

1. Refer to the REST API docs here https://gloapi.gitkraken.com/v1/docs/
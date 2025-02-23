
## Set the subscription and keyvault to use for the current session
$subscription="developer-automation"
$keyvault="keymanagement2025" 
az account set -s $subscription

Clear-Host


Write-Host "Loading Azure $subscription subscription and $keyvault secrets" -ForegroundColor Green 

. "$ProfileHOME\azure\secrets.ps1"
. "$ProfileHOME\azure\vm-connect.ps1"
. "$ProfileHOME\azure\redis.ps1"
. "$ProfileHOME\azure\devops.ps1"
. "$ProfileHOME\azure\send-data-to-azure.ps1"
. "$ProfileHOME\azure\resource-group.ps1"


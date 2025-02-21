<#
    Setup your env:

    env-set azure-env            ''
    env-set azure-subscription   ''
    env-set azure-keyvault       '' 
    env-set AZURE_DEVOPS_EXT_PAT ''

    env-list azure*
#>

env-set azure-env            'dev'
env-set azure-subscription   'developer-automation'
env-set azure-keyvault       'https://secret2025.vault.azure.net/' 



$cloud = env-get azure-env

if ($cloud) {
      
    $subscription=env-get azure-subscription
    $keyvault=env-get azure-keyvault
    
    # az login --help
    az account set -s $subscription
    
    Clear-Host
    Write-Host "Loading Azure $subscription subscription and $keyvault secrets"
}

. "$ProfileHOME\azure\secrets.ps1"
. "$ProfileHOME\azure\vm-connect.ps1"
. "$ProfileHOME\azure\redis.ps1"
. "$ProfileHOME\azure\devops.ps1"
. "$ProfileHOME\azure\send-data-to-azure.ps1"
. "$ProfileHOME\azure\resource-group.ps1"


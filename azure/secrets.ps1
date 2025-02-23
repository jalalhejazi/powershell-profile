function get-azure-secret{
    param(
        $secretName
    )
    $myPassword=(az keyvault secret show --vault-name $keyvault --name $secretName --query "value" --output tsv)
    return $myPassword
}


function new-azure-secret{
    param(
        $secretName,
        $secretValue
    )
    az keyvault secret set --vault-name $keyvault   --name $secretName --value $secretValue
}

function list-azure-secret {
    az keyvault secret list  --vault-name $keyvault --query "[].id"
}

function set-azure-devops-secret {
    #az extension add --name azure-devops
    az devops login --organization https://dev.azure.com/MCT-SuperUsers
}

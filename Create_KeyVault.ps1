# The name of the Azure subscription to install the Key Vault into
$subscriptionName = '23949b93-8072-4516-bbc2-955255d022fd'

# The resource group that will contain the Key Vault to create to contain the Key Vault
$resourceGroupName = 'MyKeyVaultRG'

# The name of the Key Vault to install
$keyVaultName = 'MyKeyVault'

# The Azure data center to install the Key Vault to
$location = 'southcentralus'

# These are the Azure AD users that will have admin permissions to the Key Vault
$keyVaultAdminUsers = @('Joe Boggs','Jenny Biggs')

# Login to Azure
Login-AzureRMAccount

# Select the appropriate subscription
Select-AzureRmSubscription -SubscriptionName $subscriptionName

# Make the Key Vault provider is available
Register-AzureRmResourceProvider -ProviderNamespace Microsoft.KeyVault

# Create the Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

# Create the Key Vault (enabling it for Disk Encryption, Deployment and Template Deployment)
New-AzureRmKeyVault -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -Location $location `
    -EnabledForDiskEncryption -EnabledForDeployment -EnabledForTemplateDeployment

# Add the Administrator policies to the Key Vault
foreach ($keyVaultAdminUser in $keyVaultAdminUsers) {
    $UserObjectId = (Get-AzureRmADUser -SearchString $keyVaultAdminUser).Id
    Set-AzureRmKeyVaultAccessPolicy -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -ObjectId $UserObjectId `
        -PermissionsToKeys all -PermissionsToSecrets all -PermissionsToCertificates all
}
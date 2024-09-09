# Terraform Azure Static Site

Hosting static site content in Azure Storage and usign Terraform as IaC tool to deploy it.

- Azure cli commands to create the **remote backend** for terraform statefile.

```
RESOURCE_GROUP_NAME= write yours
STORAGE_ACCOUNT_NAME= write yours
CONTAINER_NAME= write yours

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
```

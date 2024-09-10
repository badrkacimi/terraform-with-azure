# Terraform(IaC) Azure Infra for Static Site + Github actions for CICD 

Hosting static site content in Azure Storage and usign Terraform as IaC tool to deploy it.

- Azure cli commands to create the **remote backend** for terraform statefile.

```
export RESOURCE_GROUP_NAME= <your_rsg_name>
export STORAGE_ACCOUNT_NAME=<your_storage_name>
export CONTAINER_NAME=<your_container_name>

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
```

- Setup Azure for Terraform Deployment
To deploy Terraform infrastructure on Azure, you'll need to set up the following:

A. Create Azure Service Principal and Credentials
Run the following command in the Azure CLI to create a service principal with contributor access to your subscription:
```
az ad sp create-for-rbac --name "my-terraform-pipeline" --role Contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID --sdk-auth
```
This command will output a JSON object with the necessary credentials: clientId, clientSecret, subscriptionId, tenantId, etc.
Add Credentials to GitHub Secrets:

Go to your GitHub repository settings -> Secrets -> Actions.
Add the credentials as secrets:
```
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
```
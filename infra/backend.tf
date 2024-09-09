terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rsg"
    storage_account_name = "tfstatebadr"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
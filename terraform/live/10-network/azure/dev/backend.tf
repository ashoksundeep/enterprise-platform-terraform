terraform {
  backend "azurerm" {
    resource_group_name  = "rg-enterprise-bootstrap"
    storage_account_name = "stentaks1783603900"
    container_name       = "tfstate"
    key                  = "network-dev.tfstate"
  }
}

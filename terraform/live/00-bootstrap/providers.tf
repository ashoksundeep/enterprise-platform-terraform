terraform {
  required_version = ">= 1.15.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"      ###Pesimistic version constraint means >= 4.0 AND < 5.0
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "e19e5e58-6b9f-4286-b391-d7b7e4b888ab"
}

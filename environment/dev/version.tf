terraform {
  required_version = ">= 1.14.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-ayush"
    storage_account_name = "ayushstorage12"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

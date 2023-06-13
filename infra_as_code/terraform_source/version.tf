terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name   = "tfstate-auseast-rg"
  #   storage_account_name  = "terraformbackend23521"
  #   container_name        = "tfstatefiles"
  #   key                   = "dev.tfstate"
  # }

  backend "azurerm" {
    
  }

}

provider "azurerm" {
  # Configuration options
  features {}
}

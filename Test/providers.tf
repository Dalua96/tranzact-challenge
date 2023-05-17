terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.56.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "challenge-test-rg"
    storage_account_name = "challengetestsa"
    container_name       = "challenge-test-container"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}



terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.56.0"
    }
  }
  #backend "azurerm" {
  #   resource_group_name  = "challenge-test-rg"
  #   storage_account_name = "challengetestsa"
  #   container_name       = "challenge-test-container"
  #   key                  = "terraform.tfstate"
  #}

}



provider "azurerm" {
  features {

  }
  tenant_id                  = "a618cda7-d591-41f5-8ff9-6ddea7e31dc2"
  subscription_id            = "602d5212-3cb9-4118-b810-0710e20d98a3"
  skip_provider_registration = true
}



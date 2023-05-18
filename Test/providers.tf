terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.56.0"
    }
  }
  #backend "azurerm" {
  #  resource_group_name  = "challenge-tst-alv-rg"
  #  storage_account_name = "challengetstalvsa"
  #  container_name       = "challenge-tst-container"
  #  key                  = "terraform.tfstate"
  #}

}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}



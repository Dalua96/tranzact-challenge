terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.56.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "my-rg"
    storage_account_name = "my-sa"
    container_name = "value"
    key = "terraform.tfstate"
    access_key = "value"
  }
}



provider "azurerm" {
  features {

  }
  #client_id                  = "e21c23c1-b1fe-41e8-aa58-57f84baf5fb8"
  #client_secret              = "-x~8Q~Yy5332F9pSHwtJ3BDpUa8rnq4cD0cLAcmC"
  tenant_id                  = "a618cda7-d591-41f5-8ff9-6ddea7e31dc2"
  subscription_id            = "602d5212-3cb9-4118-b810-0710e20d98a3"
  skip_provider_registration = true
}



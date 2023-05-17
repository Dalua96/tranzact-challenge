locals {
  project_name = "challenge"
  environment  = "test"
  location     = "eastus"
  owner        = "Antonio_Alvarado"
}


resource "azurerm_storage_account" "azsa" {
  name                     = "${local.project_name}${local.environment}sa"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Owner = local.owner
  }

}

resource "azurerm_storage_account" "azsa2" {
  name                     = "${local.project_name}${local.environment}sa02"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Owner = local.owner
  }

}

resource "azurerm_storage_account" "azsa3" {
  name                     = "${local.project_name}${local.environment}sa03"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Owner = local.owner
  }

}



resource "azurerm_storage_account_network_rules" "sarule" {
  storage_account_id         = azurerm_storage_account.azsa.id
  default_action             = "Deny"
  virtual_network_subnet_ids = [var.snet_address]
  ip_rules                   = [var.own_ip_pub]


}

resource "azurerm_storage_container" "azsacontainer" {
  name                  = "${local.project_name}-${local.environment}-container"
  storage_account_name  = azurerm_storage_account.azsa.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.azsa]
}

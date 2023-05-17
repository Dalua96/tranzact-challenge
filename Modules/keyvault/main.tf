locals {
  project_name = "challenge"
  environment  = "test"
  location     = "eastus"
  owner        = "Antonio_Alvarado"
}


resource "azurerm_key_vault" "azkv01" {
  name                = "${local.project_name}-${local.environment}-kv"
  resource_group_name = var.rg_name
  location            = var.location
  tenant_id           = var.tenainId
  sku_name            = "standard"
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [var.snet_address]
    ip_rules                   = [var.own_ip_pub]

  }
}
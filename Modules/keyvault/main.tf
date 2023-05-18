locals {
  project_name = "challenge"
  environment  = "tst"
  owner        = "Antonio_Alvarado"
  kv_name      = "${local.project_name}-${local.environment}-${var.kv_name}-kv"
}


resource "azurerm_key_vault" "azkv01" {
  name                = local.kv_name
  resource_group_name = var.rg_name
  location            = var.location
  tenant_id           = var.tenantId
  sku_name            = "standard"
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [var.snet_address]
    ip_rules                   = [var.own_ip_pub]

  }

  access_policy {
    tenant_id = var.tenantId
    object_id = var.objectId
    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]

  }
}

resource "azurerm_key_vault_secret" "kvsecret" {
  name         = "tfbackendkey"
  value        = var.secret_1
  key_vault_id = azurerm_key_vault.azkv01.id
}
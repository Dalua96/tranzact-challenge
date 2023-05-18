
locals {
  project_name = "challenge"
  environment  = "tst"
  location     = "eastus"
  owner        = "Antonio_Alvarado"
}

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}


resource "azurerm_resource_group" "rg1" {
  name     = "${local.project_name}-${local.environment}-alv-rg"
  location = local.location
  tags = {
    Owner = var.owner
  }
}

module "vnet" {
  source       = "../Modules/vnet"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  vnet_name    = "alv"
  vnet_address = "10.0.0.0/16"
  snet_address = "10.0.1.0/24"

}

module "sa" {
  source       = "../Modules/storageaccount"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  sa_name      = "alv"
  snet_address = module.vnet.snet
  own_ip_pub   = data.http.ip.response_body

}


module "kv" {
  source       = "../Modules/keyvault"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  kv_name      = "alv"
  tenantId     = data.azurerm_client_config.current.tenant_id
  objectId     = data.azurerm_client_config.current.object_id
  said         = module.sa.said
  secret_1     = module.sa.secret_1
  snet_address = module.vnet.snet
  own_ip_pub   = data.http.ip.response_body


}



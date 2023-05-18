# comentario resource name

locals {
  project_name = "challenge"
  environment  = "test"
  location     = "eastus"
  owner        = "Antonio_Alvarado"
}

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me/ip"
}


resource "azurerm_resource_group" "rg1" {
  name     = "${local.project_name}-${local.environment}-rg"
  location = local.location
  tags = {
    Owner = var.owner
  }
}

module "vnet" {
  source       = "../Modules/vnet"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  vnet_address = "10.0.0.0/16"
  snet_address = "10.0.1.0/24"

}

module "sa" {
  source       = "../Modules/storageaccount"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  snet_address = module.vnet.snet
  own_ip_pub   = data.http.ip.response_body

}


module "kv" {
  source       = "../Modules/keyvault"
  rg_name      = azurerm_resource_group.rg1.name
  location     = local.location
  tenainId     = data.azurerm_client_config.current.tenant_id
  snet_address = module.vnet.snet
  own_ip_pub   = data.http.ip.response_body


}


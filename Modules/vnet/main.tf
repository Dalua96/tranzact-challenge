# comentario resource name

locals {
  project_name = "challenge"
  environment  = "tst"
  owner        = "Antonio_Alvarado"
  vnet_name    = "${local.project_name}-${local.environment}-${var.vnet_name}-vnet"
}

resource "azurerm_virtual_network" "azvn01" {
  name                = local.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = [var.vnet_address]
  tags = {
    Owner = local.owner
  }
}

resource "azurerm_subnet" "azsnet01" {
  name                 = "${local.project_name}-${local.environment}-snet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.azvn01.name
  address_prefixes     = [var.snet_address]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]

}

resource "azurerm_subnet_network_security_group_association" "snetassc" {
  subnet_id                 = azurerm_subnet.azsnet01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}


resource "azurerm_network_security_group" "nsg01" {
  name                = "${local.project_name}-${local.environment}-nsg"
  resource_group_name = var.rg_name
  location            = var.location
  
  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
   }
      tags = {
    Owner = var.owner
  
  }
#agregar reglas

  
}
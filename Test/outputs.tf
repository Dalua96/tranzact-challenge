output "rgname" {
  value = azurerm_resource_group.rg1.name
}

output "saname" {
  value = module.sa.saname
}

output "container_name" {
  value = module.sa.container_name
}

output "kv_name" {
  value = module.kv.kv_name
}
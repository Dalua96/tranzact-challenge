output "saname" {
  value = azurerm_storage_account.azsa.name
}

output "said" {
  value = azurerm_storage_account.azsa.id
}

output "container_name" {
  value = azurerm_storage_container.azsacontainer.name
}

output "secret_1" {
  value = azurerm_storage_account.azsa.primary_access_key
}
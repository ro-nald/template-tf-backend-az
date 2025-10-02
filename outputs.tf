output "resource_group_name" {
  description = "The name of the Resource Group created."
  value       = azurerm_resource_group.rg_tf_backend.name
}

output "storage_account_name" {
  description = "The name of the Storage Account for the remote state."
  value       = azurerm_storage_account.tfstate.name
}

output "storage_container_name" {
  description = "The name of the Storage Container for the remote state."
  value       = azurerm_storage_container.tfstate_container.name
}
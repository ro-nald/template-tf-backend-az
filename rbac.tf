resource "azuread_group" "azuread_grp_tf_backend_users" {
  display_name     = "tf-backend-users"
  security_enabled = true
}

resource "azurerm_role_assignment" "tfstate_access" {
  scope                = azurerm_storage_container.tfstate_container.resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.azuread_grp_tf_backend_users.object_id
}
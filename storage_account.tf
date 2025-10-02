resource "azurerm_storage_account" "tfstate" {
  name                       = "st${local.project_name}${random_string.random_id_storage_account.result}"
  resource_group_name        = azurerm_resource_group.rg_tf_backend.name
  location                   = azurerm_resource_group.rg_tf_backend.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  tags = {
    environment = var.environment
    project     = local.project_name
  }
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

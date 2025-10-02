resource "azurerm_resource_group" "rg_tf_backend" {
  name     = "rg-tf-backend-${var.environment}"
  location = var.location
}
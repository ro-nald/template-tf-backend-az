provider "azurerm" {
  features {}
  # You should be authenticated via Azure CLI (az login) for this bootstrap project.
}

provider "azuread" {
  # Authentication handled by the azurerm provider or environment
  # No explicit credentials needed if using OIDC or Azure CLI
}
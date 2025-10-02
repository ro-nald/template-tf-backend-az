# Terraform Backend Template (Azure Storage)

This is a template project for creating a Terraform backend in Azure.

## Prerequisites

- You are logged-in to the Azure CLI to the specific subscription and have permission to provision a Storage Account and assign roles in Azure AD.
- A User Group is configured in Azure Entra ID (formerly Azure AD) with the name 'tf-backend-users'

## Usage

Running ```terraform apply``` will create the Terraform backend, printing out the resource group and name of the storage account, and the container created.

Once Terraform has provisioned the project resources, search for the user group 'tf-backend-users' in Azure Entra ID and add the appropriate User/Identity to that group.

### Usage in production

The project default uses a free-tier storage account configuration, which is not advisable as the terraform state is at risk of becoming lost without the appropriate level of redundancy in the storage account.

#### Storage redundancy

By default, the free tier for the storage account is used. It is recommended to update this with a redundancy appropriate for your application:

``` terraform
resource "azurerm_storage_account" "tfstate" {
...
  account_tier               = "Standard"
  account_replication_type   = "GZRS"
...
}
```

#### RBAC with Principle of Least Priviledge (PoLP)

Creating a custom permission is advised, though this is not available in the free tier subscription.

## Troubleshooting

A common issue is that the Azure Entra ID user group (or Azure AD user group) has not yet been created, which must be done manually rather than via Terraform.
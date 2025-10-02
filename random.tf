resource "random_string" "random_id_storage_account" {
  length  = 6
  special = false
  upper   = false
}
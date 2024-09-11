resource "azurerm_storage_account" "example" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "example" {
  name                  = var.blob_storage_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_container" "statefile" {
  name                  = var.blob_storage_name_2
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.storage_container_access_type
  
}


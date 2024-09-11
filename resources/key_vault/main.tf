# data "azurerm_client_config" "current" {}

# resource "random_string" "azurerm_key_vault_name" {
#   length  = 7
#   lower   = true
#   numeric = false
#   special = false
#   upper   = false
# }

# resource "azurerm_key_vault" "example" {
#   name                        = coalesce(var.vault_name, "vault-${random_string.azurerm_key_vault_name.result}")
#   location                    = var.location
#   resource_group_name         = var.resource_group_name
#   enabled_for_disk_encryption = var.vault_disk_encryption
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = var.vault_soft_delete_retention_days
#   sku_name = var.vault_sku_name

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = "4d1623fc-cafc-44d1-889f-db53b190df8b" //4d1623fc-cafc-44d1-889f-db53b190df8b

#     key_permissions    = var.key_permissions
#     secret_permissions = var.secret_permissions
#   }
# }

# resource "azurerm_key_vault_access_policy" "example" {
#   key_vault_id = azurerm_key_vault.example.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = data.azurerm_client_config.current.object_id

#   secret_permissions = var.secret_permissions
# }

# resource "azurerm_key_vault_secret" "sql_db_username" {
#   name         = var.db_username_key
#   value        = var.db_username_value
#   key_vault_id = azurerm_key_vault.example.id
# }

# resource "azurerm_key_vault_secret" "sql_db_password" {
#   name         = var.db_password_key
#   value        = var.db_password_value
#   key_vault_id = azurerm_key_vault.example.id
# }

# resource "azurerm_key_vault_secret" "sql_db_connection_string" {
#   name = var.db_connection_string_key
#   value = var.sql_db_connection_string_value
#   key_vault_id = azurerm_key_vault.example.id
# }
# variable "location" {
#   type        = string
#   description = "Location for all resources."
# }

# variable "resource_group_name" {
#   type        = string
#   description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
# }

# variable "vault_name" {
#   type        = string
#   description = "The name of the key vault to be created. The value will be randomly generated if blank."
# }

# variable "vault_disk_encryption" {
#   type = bool
# }

# variable "vault_soft_delete_retention_days" {
#   type = number
# }


# variable "vault_sku_name" {
#   type        = string
#   description = "The SKU of the vault to be created."
#   default     = "standard"
# }

# variable "key_permissions" {
#   type        = list(string)
#   description = "List of key permissions."
#   default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update"]
# }

# variable "secret_permissions" {
#   type        = list(string)
#   description = "List of secret permissions."
#   default     = ["Set"]
# }

# variable "db_username_key" {
#   type = string
# }

# variable "db_username_value" {
#   type = string
# }

# variable "db_password_key" {
#   type = string
# }

# variable "db_password_value" {
#   type = string
  
# }

# # variable "db_connection_string_key" {
# #   type = string
# # }

# # variable "sql_db_connection_string_value" {
# #   type = string
# # }

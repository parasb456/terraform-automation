# variable "resource_group_name" {
#   type        = string
#   description = "Name of the resource group"
# }

variable "principal_id" {
  type = string
}

variable "location" {
  type        = string
  description = "Azure location"
}

# variable "acr_name" {
#   type        = string
#   description = "Name of the Azure Container Registry"
# }

# variable "app_service_plan_name" {
#   type        = string
#   description = "Name of the App Service Plan"
# }

# variable "web_app_name" {
#   type        = string
#   description = "Name of the Web App"
# }

variable "docker_image" {
  type        = string
  description = "sample docker image"
}

variable "app_service_identity" {
  type = string
}

# variable "static_web_app_name" {
#   type        = string
#   description = "Name of the Static Web App"
# }

# variable "sql_server_name" {
#   type        = string
#   description = "Name of the SQL Server"
# }

variable "sql_admin_login" {
  type        = string
  description = "Admin login for the SQL Server"
}

variable "sql_admin_password" {
  type        = string
  description = "Admin password for the SQL Server"
}

# variable "storage_account_name" {
#   type        = string
#   description = "Name of the Storage Account"
# }

variable "blob_storage_name" {
  type        = string
  description = "Name of the Storage Container"
}
variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account where resources will be provisioned."
}

variable "asp_os_type" {
  type        = string
  description = "The operating system type for the App Service Plan. Example: Linux or Windows."
}

variable "asp_sku_name" {
  type        = string
  description = "The pricing tier for the App Service Plan. Example: B1 for Basic, P1v2 for Premium."
}

variable "acr_sku" {
  type        = string
  description = "The pricing tier for the Azure Container Registry (ACR). Example: Basic, Standard, Premium."
}

variable "database_sku_name" {
  type        = string
  description = "The pricing tier for the Azure SQL Database. Example: Basic, Standard, Premium."
}

variable "storage_account_tier" {
  type        = string
  description = "The performance tier for the Azure Storage Account. Example: Standard or Premium."
}

variable "storage_account_replication_type" {
  type        = string
  description = "The replication type for the Azure Storage Account. Example: LRS (Locally Redundant Storage), GRS (Geo-Redundant Storage)."
}

variable "mssql_server_version" {
  type        = string
  description = "The version of the SQL Server to be used for the Azure SQL Database. Example: 12.0."
}

variable "sql_minimum_tls_version" {
  type        = number
  description = "The minimum TLS version required for connections to the Azure SQL Server. Example: 1.2."
}

variable "mssql_database_name" {
  type        = string
  description = "The name of the database to be created in the Azure SQL Server."
}

variable "mssql_database_collation" {
  type        = string
  description = "The collation setting for the Azure SQL Database. Example: SQL_Latin1_General_CP1_CI_AS."
}

variable "mssql_database_license_type" {
  type        = string
  description = "The licensing model for the Azure SQL Database. Example: LicenseIncluded or BringYourOwnLicense."
}

variable "static_web_app_location" {
  type        = string
  description = "The Azure region where the Static Web App will be deployed. Example: Central US."
}

variable "static_web_app_sku_tier" {
  type        = string
  description = "The pricing tier for the Static Web App. Example: Free, Standard."
}

variable "static_web_app_sku_size" {
  type        = string
  description = "The size of the SKU for the Static Web App. Example: Free or Standard."
}

variable "VITE_API_RETRY" {
  type = string
}

variable "VITE_BACKEND_URL" {
  type = string
}

variable "storage_container_access_type" {
  type        = string
  description = "The access level for the storage container. Example: private, blob, container."
}

# variable "vault_name" {
#   type        = string
#   description = "The name of the Key Vault. This is optional, and a random value will be generated if left blank."
# }

# variable "vault_disk_encryption" {
#   type        = bool
#   description = "Boolean flag to enable disk encryption for the Key Vault."
# }

# variable "vault_soft_delete_retention_days" {
#   type        = number
#   description = "The number of days that items in the Key Vault are retained for soft delete."
# }

# variable "vault_sku_name" {
#   type        = string
#   description = "The SKU of the Key Vault to be created."
# }

# variable "key_name" {
#   type        = string
#   description = "The name of the key to be created. The value will be randomly generated if blank."
#   default     = ""
# }

# variable "key_permissions" {
#   type        = list(string)
#   description = "List of key permissions."
# }

# variable "secret_permissions" {
#   type        = list(string)
#   description = "List of secret permissions."
# }

# variable "db_username_key" {
#   type        = string
#   description = "The name of the Azure Key Vault secret that stores the database username."
# }

# variable "db_password_key" {
#   type        = string
#   description = "The name of the Azure Key Vault secret that stores the database password."
# }

# variable "static_web_app_cname_record" {
#   type        = string
#   description = "The CNAME record for the custom domain associated with the Azure Static Web App."
# }

# variable "static_web_app_zone_name" {
#   type        = string
#   description = "The DNS zone name where the custom domain for the Azure Static Web App is registered."
# }

# variable "static_web_app_record_ttl" {
#   type        = number
#   description = "The Time-To-Live (TTL) value in seconds for the DNS record of the Azure Static Web App custom domain."
# }

# variable "static_web_app_custom_domain_validation_type" {
#   type        = string
#   description = "The validation type for the custom domain in Azure Static Web App, typically 'cname-delegation'."
# }

# variable "db_connection_string_key" {
#   type = string
# }

variable "blob_storage_name_2" {
  type = string
}

variable "firewall_rules" {
  description = "A map of firewall rules to be created"
  type = map(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}


# The environment in which resources are deployed (e.g., dev, uat, prod).

variable "environment" {
  description = "The environment in which resources are deployed (e.g., dev, uat, prod)."
  type        = string
}

variable "app_insights_instrumentation_key" {
  type = string
}
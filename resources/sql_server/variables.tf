variable "environment" {
  description = "The name of the SQL Server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the SQL Server will be created."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL Server."
  type        = string
}

variable "database_sku_name" {
  type = string
}

variable "mssql_server_version" {
  type = string
}

variable "minimum_tls_version" {
  type = number
}

variable "mssql_database_name" {
  type = string
}

variable "mssql_database_collation" {
  type = string
}

variable "mssql_database_license_type" {
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




terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "resource_group" {
  source = "../resources/resource_group"

  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source = "../resources/acr"

  name                = var.acr_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  acr_sku             = var.acr_sku
}

# Retrieve the ACR details using a data source
data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = module.resource_group.name

  depends_on = [module.acr]
}


module "app_service_plan" {
  source = "../resources/app_service_plan"

  name                = var.app_service_plan_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  asp_os_type         = var.asp_os_type
  asp_sku_name        = var.asp_sku_name
}

module "app_service" {
  source = "../resources/app_service"

  name                            = var.web_app_name
  resource_group_name             = module.resource_group.name
  location                        = module.resource_group.location
  service_plan_id                 = module.app_service_plan.id
  acr_id                          = module.acr.id
  docker_image                    = var.docker_image
  app_service_identity            = var.app_service_identity
  DOCKER_REGISTRY_SERVER_URL      = data.azurerm_container_registry.acr.login_server
  DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_container_registry.acr.admin_username
  DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_container_registry.acr.admin_password


  depends_on = [module.acr]

}

module "static_web_app" {
  source = "../resources/static_web_app"

  name                                         = var.static_web_app_name
  resource_group_name                          = module.resource_group.name
  static_web_app_location                      = var.static_web_app_location
  static_web_app_sku_size                      = var.static_web_app_sku_size
  static_web_app_sku_tier                      = var.static_web_app_sku_tier
  static_web_app_cname_record                  = var.static_web_app_cname_record
  static_web_app_record_ttl                    = var.static_web_app_record_ttl
  static_web_app_custom_domain_validation_type = var.static_web_app_custom_domain_validation_type
  static_web_app_zone_name                     = var.static_web_app_zone_name
}

module "sql_server" {
  source = "../resources/sql_server"

  name                         = var.sql_server_name
  resource_group_name          = module.resource_group.name
  location                     = module.resource_group.location
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
  database_sku_name            = var.database_sku_name
  mssql_server_version         = var.mssql_server_version
  minimum_tls_version          = var.sql_minimum_tls_version
  mssql_database_name          = var.mssql_database_name
  mssql_database_collation     = var.mssql_database_collation
  mssql_database_license_type  = var.mssql_database_license_type
  firewall_rules               = var.firewall_rules
}

module "storage_account" {
  source = "../resources/storage_account"

  name                             = var.storage_account_name
  resource_group_name              = module.resource_group.name
  location                         = module.resource_group.location
  blob_storage_name                = var.blob_storage_name
  blob_storage_name_2              = var.blob_storage_name_2
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  storage_container_access_type    = var.storage_container_access_type
}


# module "key_vault" {
#   source = "../resources/key_vault"

#   location                         = var.location
#   resource_group_name              = module.resource_group.name
#   vault_name                       = var.vault_name
#   vault_disk_encryption            = var.vault_disk_encryption
#   vault_soft_delete_retention_days = var.vault_soft_delete_retention_days
#   vault_sku_name                   = var.vault_sku_name
#   key_permissions                  = var.key_permissions
#   secret_permissions               = var.secret_permissions
#   db_username_key                  = var.db_username_key
#   db_username_value                = var.sql_admin_login
#   db_password_key                  = var.db_password_key
#   db_password_value                = var.sql_admin_password
# }

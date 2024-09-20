# Environment Variable
environment = "preprod"

# Azure Resource Group and Location

# resource_group_name = "moakcasey-rg-${var.environment}"
location     = "Central US"
principal_id = "4d1623fc-cafc-44d1-889f-db53b190df8b"

# Azure Container Registry (ACR)

# acr_name = "moakcaseyacr${var.environment}"
acr_sku = "Basic"

# Azure App Service (Backend)

# app_service_plan_name = "moakcasey-asp-${var.environment}"
# web_app_name          = "moakcasey-backend-${var.environment}"
docker_image         = "DOCKER|hello-world:latest"
app_service_identity = "SystemAssigned"
asp_os_type          = "Linux"
asp_sku_name         = "B1"


# Azure Static Web App (Frontend)

# static_web_app_name                          = "moakcasey-frontend-${var.environment}"
# static_web_app_cname_record                  = "${var.environment}"
# static_web_app_zone_name                     = "moakcasey.techdomeaks.com"
# static_web_app_record_ttl                    = 300
# static_web_app_custom_domain_validation_type = "cname-delegation"
static_web_app_location = "Central US"
static_web_app_sku_size = "Free"
static_web_app_sku_tier = "Free"
VITE_API_RETRY          = "3"
VITE_BACKEND_URL        = "http://localhost:8000/api"


# Azure SQL Database

# sql_server_name             = "moakcasey-sql-server-${var.environment}"
mssql_server_version        = "12.0"
sql_minimum_tls_version     = "1.2"
mssql_database_name         = "moakcasey-db"
mssql_database_collation    = "SQL_Latin1_General_CP1_CI_AS"
mssql_database_license_type = "LicenseIncluded"
database_sku_name           = "Basic"
firewall_rules = {
  rule1 = {
    name             = "Techdome"
    start_ip_address = "110.227.200.253"
    end_ip_address   = "110.227.200.253"
  }
}




# Azure Storage Account

# storage_account_name             = "moakcasey${var.environment}"
blob_storage_name                = "moakcasey-documents"
subscription_id                  = "999b83ca-672c-408d-86f7-fef298206376"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
storage_container_access_type    = "private"


# # Azure Key Vault

# vault_name                       = "moakcasey-vault-dev"
# vault_disk_encryption            = true
# vault_soft_delete_retention_days = 7
# vault_sku_name                   = "standard"
# key_permissions                  = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update"]
# secret_permissions               = ["Set", "Get", "List"]
# db_username_key                  = "sql-server-username"
# db_password_key                  = "sql-server-password"
blob_storage_name_2 = "terraform-state"

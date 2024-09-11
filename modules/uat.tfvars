# Azure Resource Group and Location

resource_group_name = ""
location            = ""

# Azure Container Registry (ACR)

acr_name = ""
acr_sku  = ""

# Azure App Service (Backend)

app_service_plan_name = ""
web_app_name          = ""
docker_image          = "DOCKER|hello-world:latest"
app_service_identity  = ""
asp_os_type           = ""
asp_sku_name          = ""


# Azure Static Web App (Frontend)

static_web_app_name = ""
# static_web_app_cname_record                  = ""
# static_web_app_zone_name                     = ""
# static_web_app_record_ttl                    = 300
# static_web_app_custom_domain_validation_type = "cname-delegation"
static_web_app_location = ""
static_web_app_sku_size = ""
static_web_app_sku_tier = ""



# Azure SQL Database

sql_server_name             = ""
sql_admin_login             = ""
sql_admin_password          = ""
mssql_server_version        = ""
sql_minimum_tls_version     = ""
mssql_database_name         = ""
mssql_database_collation    = ""
mssql_database_license_type = ""
database_sku_name           = ""



# Azure Storage Account

storage_account_name             = ""
blob_storage_name                = ""
subscription_id                  = ""
storage_account_tier             = ""
storage_account_replication_type = ""
storage_container_access_type    = ""


# Azure Key Vault

vault_name                       = ""
vault_disk_encryption            = true
vault_soft_delete_retention_days = 7
vault_sku_name                   = ""
key_permissions                  = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update"]
secret_permissions               = ["Set", "Get", "List"]
db_username_key                  = "sql-server-username"
db_password_key                  = "sql-server-password"
blob_storage_name_2              = "terraform-state"

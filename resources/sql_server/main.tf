resource "azurerm_mssql_server" "example" {
  name                         = "moakcasey-sql-server-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version
}

resource "azurerm_mssql_database" "example" {
  name         = var.mssql_database_name
  server_id    = azurerm_mssql_server.example.id
  collation    = var.mssql_database_collation
  license_type = var.mssql_database_license_type
  sku_name     = var.database_sku_name
}


# Firewall ------------------

resource "azurerm_mssql_firewall_rule" "example" {
  for_each = var.firewall_rules

  name             = each.value.name
  server_id        = azurerm_mssql_server.example.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

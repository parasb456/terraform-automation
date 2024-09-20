resource "azurerm_static_web_app" "example" {
  name                = "moakcasey-frontend-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.static_web_app_location
  sku_tier            = var.static_web_app_sku_tier
  sku_size            = var.static_web_app_sku_size

  app_settings = {
    "VITE_API_RETRY"   = var.VITE_API_RETRY
    "VITE_BACKEND_URL" = var.VITE_BACKEND_URL
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = "InstrumentationKey=${var.app_insights_instrumentation_key}"
  }
}

# resource "azurerm_dns_cname_record" "example" {
#   count               = var.static_web_app_zone_name != "" ? 1 : 0
#   name                = var.static_web_app_cname_record
#   zone_name           = var.static_web_app_zone_name
#   resource_group_name = var.resource_group_name
#   ttl                 = var.static_web_app_record_ttl
#   record              = azurerm_static_web_app.example.default_host_name
# }

# resource "azurerm_static_web_app_custom_domain" "example" {
#   count              = var.static_web_app_zone_name != "" ? 1 : 0
#   static_web_app_id  = azurerm_static_web_app.example.id
#   domain_name        = "${azurerm_dns_cname_record.example[count.index].name}.${azurerm_dns_cname_record.example[count.index].zone_name}"
#   validation_type    = var.static_web_app_custom_domain_validation_type

#   depends_on = [azurerm_dns_cname_record.example]
# }

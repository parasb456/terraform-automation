output "default_host_name" {
  value = azurerm_static_web_app.example.default_host_name
}

# output "cname_record" {
#   value = azurerm_dns_cname_record.example[0].fqdn
# }
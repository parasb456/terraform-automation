output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.resource_group.name
}

output "acr_login_server" {
  description = "The login server of the Azure Container Registry."
  value       = module.acr.login_server
}

output "app_service_url" {
  description = "The URL of the App Service."
  value       = module.app_service.default_hostname
}

output "static_web_app_url" {
  description = "The URL of the Static Web App."
  value       = module.static_web_app.default_host_name
}

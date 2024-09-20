variable "environment" {
  description = "The name of the Static Web App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "static_web_app_location" {
  description = "The Azure region where the Static Web App will be created."
  type        = string
}

variable "static_web_app_sku_tier" {
  type = string
}

variable "static_web_app_sku_size" {
  type = string
}

variable "VITE_API_RETRY" {
  type = string
}

variable "VITE_BACKEND_URL" {
  type = string
}

variable "app_insights_instrumentation_key" {
  type = string
}

# variable "static_web_app_cname_record" {
#   type    = string
#   default = ""
# }

# variable "static_web_app_zone_name" {
#   type    = string
#   default = ""
# }

# variable "static_web_app_record_ttl" {
#   type    = number
# }

# variable "static_web_app_custom_domain_validation_type" {
#   type    = string
# }




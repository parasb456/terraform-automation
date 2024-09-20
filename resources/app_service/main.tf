resource "azurerm_app_service" "example" {
  name                = "moakcasey-backend-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = var.service_plan_id

  site_config {
    always_on = "true"
    # define the images to used for you application
    linux_fx_version = var.docker_image
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = var.DOCKER_REGISTRY_SERVER_URL
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.DOCKER_REGISTRY_SERVER_USERNAME
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.DOCKER_REGISTRY_SERVER_PASSWORD
    "DB_HOST"                         = ""
    "DB_LOG"                          = ""
    "DB_NAME"                         = ""
    "DB_PASSWORD"                     = ""
    "DB_PORT"                         = ""
    "DB_SYNC"                         = ""
    "DB_USERNAME"                     = ""
    "FRONTEND_URL"                    = ""
    "JWT_EXPIRES_IN"                  = ""
    "JWT_SECRET"                      = ""
    "MODE"                            = ""
    "PORT"                            = ""
    "REJECT_UNAUTHORIZED"             = ""
    "RUN_MIGRATIONS"                  = ""
  }

  identity {
    type = var.app_service_identity
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_app_service.example.identity.0.principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}



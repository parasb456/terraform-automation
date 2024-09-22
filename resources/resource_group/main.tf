resource "azurerm_resource_group" "example" {
  name     = "moakcasey-rg-${var.environment}"
  location = var.location
}

resource "azurerm_role_assignment" "contributor_assignment" {
  scope                = azurerm_resource_group.example.id
  role_definition_name = "User Access Administrator"
  principal_id         = var.principal_id 
}
terraform {
  backend "azurerm" {
    resource_group_name  = "moakcasey-dev"
    storage_account_name = "moakcaseydev986"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

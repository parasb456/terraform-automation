# terraform {
#   backend "azurerm" {
#     resource_group_name  = "moakcasey-rg-dev"
#     storage_account_name = "moakcaseydev"
#     container_name       = "dev/terraform-state"
#     key                  = "terraform.tfstate"
#   }
# }


# terraform init -backend-config=backend-dev.tf

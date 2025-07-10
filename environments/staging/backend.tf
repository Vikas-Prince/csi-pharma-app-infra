terraform {
  backend "azurerm" {
    resource_group_name  = "rg-csi-global"
    storage_account_name = "csiterraformstate"
    container_name       = "tfstate"
    key                  = "staging-infra.terraform.tfstate"
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-csi-global"
    storage_account_name = "csiterraformstate"
    container_name       = "csi-tfstate"
    key                  = "global-infra.terraform.tfstate"
  }
}

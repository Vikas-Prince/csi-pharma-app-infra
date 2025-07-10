resource "azurerm_key_vault" "csi_kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  enable_rbac_authorization   = var.enable_rbac
  purge_protection_enabled    = var.enable_purge_protection

  tags = var.tags
}

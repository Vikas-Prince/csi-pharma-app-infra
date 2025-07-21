resource "azurerm_log_analytics_workspace" "csi_workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.log_analytics_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_sku
  tags                = var.log_analytics_tags
}

resource "azurerm_application_insights" "csi_aks" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  workspace_id        = azurerm_log_analytics_workspace.csi_workspace.id
  
  tags = var.tags
}

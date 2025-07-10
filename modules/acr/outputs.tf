output "acr_id" {
  description = "Resource ID of the ACR"
  value       = azurerm_container_registry.csi_acr.id
}

output "acr_login_server" {
  description = "Login server URL of the ACR"
  value       = azurerm_container_registry.csi_acr.login_server
}

output "acr_name" {
  description = "Name of the ACR"
  value       = azurerm_container_registry.csi_acr.name
}

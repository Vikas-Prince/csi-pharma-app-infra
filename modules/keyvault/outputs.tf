output "keyvault_id" {
  description = "Resource ID of the Key Vault"
  value       = azurerm_key_vault.csi_kv.id
}

output "keyvault_name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.csi_kv.name
}

output "keyvault_uri" {
  description = "DNS URI of the Key Vault"
  value       = azurerm_key_vault.csi_kv.vault_uri
}

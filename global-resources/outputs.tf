output "acr_login_server" {
  value       = module.acr.acr_login_server
  description = "ACR login server"
}

output "keyvault_id" {
  value       = module.keyvault.keyvault_id
  description = "CSI Key Vault ID"
}

output "app_insights_connection_string" {
  value       = module.app_insights.connection_string
  description = "Connection string for telemetry agents"
  sensitive = true
}

output "sonarqube_vm_id" {
  value = module.vm_sonarqube.vm_id
}

output "nexus_vm_id" {
  value = module.vm_nexus.vm_id
}

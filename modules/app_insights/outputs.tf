output "instrumentation_key" {
  description = "Instrumentation Key for Application Insights"
  value       = azurerm_application_insights.csi_aks.instrumentation_key
}

output "connection_string" {
  description = "Connection string for Application Insights SDKs"
  value       = azurerm_application_insights.csi_aks.connection_string
}

output "app_insights_id" {
  description = "Resource ID of the App Insights instance"
  value       = azurerm_application_insights.csi_aks.id
}

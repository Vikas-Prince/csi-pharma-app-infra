variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
  default     = "csi-log-analytics"
}

variable "log_analytics_sku" {
  description = "SKU for the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"  # You can adjust the SKU as needed
}

variable "log_analytics_location" {
  description = "Location for the Log Analytics Workspace"
  type        = string
  default     = "Central India"  # Can be the same location or another
}

variable "log_analytics_tags" {
  description = "Tags to associate with Log Analytics Workspace"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "csi-aks-observability"
  }
}

variable "app_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "csi-appinsights"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Azure resource group where this will be created"
  type        = string
  default     = "csi-observability-rg"
}

variable "application_type" {
  description = "Type of application (e.g. web, java, node.js)"
  type        = string
  default     = "java"
}

variable "tags" {
  description = "Tags to associate with Application Insights"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "csi-aks-observability"
  }
}

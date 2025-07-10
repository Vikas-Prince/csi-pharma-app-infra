variable "acr_name" {
  description = "Name of the Azure Container Registry (must be globally unique)"
  type        = string
  default     = "csiacregistry"
}

variable "resource_group_name" {
  description = "Name of the resource group in which ACR is created"
  type        = string
  default     = "default-resource-group"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "sku" {
  description = "SKU of the container registry (Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Whether admin user is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the registry"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-acr"
  }
}

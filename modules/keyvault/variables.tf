variable "keyvault_name" {
  description = "Name of the Key Vault"
  type        = string
  default     = "csi-keyvault-dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "default-rg"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "sku_name" {
  description = "SKU of the Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

variable "enable_rbac" {
  description = "Enable RBAC instead of Access Policies"
  type        = bool
  default     = true
}

variable "enable_purge_protection" {
  description = "Enable purge protection (recommended for production)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to Key Vault"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-keyvault"
  }
}

variable "resource_group_name" {
  description = "Azure resource group for global resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "List of address spaces for the VNet"
  type        = list(string)
}

# Now only one subnet for all VMs
variable "subnet_name" {
  description = "Name of the single subnet used for VMs"
  type        = string
  default     = "vm-subnet"
}

variable "subnet_address_prefix" {
  description = "CIDR block for the single subnet"
  type        = list(string)
  default     = ["10.10.0.0/24"]
}

# This will be populated from VNet module output, so you won't need to input it manually
variable "vm_subnet_id" {
  description = "Subnet ID where VMs will be deployed"
  type        = string
  default     = ""
}

variable "vm_admin_username" {
  description = "Admin username for VM access"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key file"
  type        = string
}

variable "vm_sonar_size" {
  description = "VM size for SonarQube instance"
  type        = string
  default     = "Standard_B2ms"
}

variable "vm_nexus_size" {
  description = "VM size for Nexus instance"
  type        = string
  default     = "Standard_B2ms"
}

variable "tags" {
  description = "Tags to apply to all global resources"
  type        = map(string)
  default     = {}
}

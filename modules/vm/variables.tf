variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "default-vm"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "default-resource-group"
}

variable "subnet_id" {
  description = "Subnet ID for VM NIC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "enable_public_ip" {
  description = "Whether to attach a public IP"
  type        = bool
  default     = true
}

variable "vm_size" {
  description = "Size of the VM (e.g. Standard_B2s)"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to your public SSH key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-vm-deployment"
  }
}

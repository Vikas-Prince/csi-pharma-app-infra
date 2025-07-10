variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "default-vnet"
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

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "A map of subnet names and their CIDR blocks"
  type = map(list(string))
  
  default = {
    subnet1 = ["10.0.1.0/24"]
    subnet2 = ["10.0.2.0/24"]
  }

  validation {
    condition = alltrue([for subnet in var.subnets : alltrue([for cidr in subnet : can(ipcidr(cidr))])])
    error_message = "Each subnet address prefix must be a valid CIDR block."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-networking"
  }
}

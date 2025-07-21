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
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-networking"
  }
}

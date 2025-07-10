variable "env" {
  description = "Environment name (dev, qa, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for environment"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "CIDR range for the VNet"
  type        = list(string)
}

variable "subnet_configs" {
  description = "Map of subnet names to CIDR blocks"
  type        = map(list(string))
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_node_subnet_name" {
  description = "The name of the subnet to use for AKS node pool"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}


variable "vm_size" {
  description = "Map of labels to assign to AKS nodes"
  type        = string
}


variable "node_labels" {
  description = "Map of labels to assign to AKS nodes"
  type        = map(string)
}

variable "node_count" {
  description = "The initial number of nodes for the AKS node pool"
  type        = number
}

variable "min_count" {
  description = "Minimum number of nodes in the AKS node pool"
  type        = number
}

variable "max_count" {
  description = "Maximum number of nodes in the AKS node pool"
  type        = number
}

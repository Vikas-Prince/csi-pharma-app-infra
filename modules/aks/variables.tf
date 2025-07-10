variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "dev-aks-cluster"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "default-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
  default     = "aksdns"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster"
  type        = string
  default     = "1.29.2"
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy AKS nodes into (required for Azure CNI)"
  type        = string
  default     = "10.2.0.0/24"
}

variable "node_count" {
  description = "Initial node count for the default pool"
  type        = number
  default     = 2
}

variable "min_count" {
  description = "Minimum number of nodes for auto-scaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes for auto-scaling"
  type        = number
  default     = 4
}

variable "vm_size" {
  description = "The size of the virtual machines for the AKS node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "os_disk_size_gb" {
  description = "OS disk size for AKS nodes"
  type        = number
  default     = 30
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool"
  type        = bool
  default     = true
}

variable "node_labels" {
  description = "Map of node labels to apply"
  type        = map(string)
  default     = {
    role = "system"
  }
}

variable "tags" {
  description = "Tags to apply to the AKS cluster"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "terraform-aks"
  }
}

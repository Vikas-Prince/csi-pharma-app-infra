resource "azurerm_kubernetes_cluster" "csi_aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name                = "system"
    node_count          = var.node_count
    vnet_subnet_id      = var.subnet_id
    vm_size             = var.vm_size
    os_disk_size_gb     = var.os_disk_size_gb
    type                = "VirtualMachineScaleSets"
    node_labels         = var.node_labels
    min_count           = var.min_count
    max_count           = var.max_count    
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = "azure"
    network_policy     = "azure" 
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }

  tags = var.tags
}

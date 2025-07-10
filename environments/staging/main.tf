provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "env_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Create VNet and subnets using your vnet module
module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.env_rg.name
  address_space       = var.address_space
  subnets             = var.subnet_configs
  tags                = var.tags
}

# Create AKS using your aks module
module "aks" {
  source              = "../../modules/aks"
  aks_cluster_name    = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.env_rg.name
  dns_prefix          = "${var.aks_cluster_name}-${var.env}"
  tags                = var.tags
  subnet_id           = module.vnet.subnet_ids[var.aks_node_subnet_name]

  vm_size             = var.vm_size
  node_count          = var.node_count
  min_count           = var.min_count
  max_count           = var.max_count
  node_labels         = var.node_labels
}

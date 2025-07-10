
module "keyvault" {
  source              = "../modules/keyvault"
  keyvault_name       = "kv-csi-global"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  tags                = var.tags
}

module "acr" {
  source              = "../modules/acr"
  acr_name            = "acrglobalcsi"
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_enabled       = true
  tags                = var.tags
}

module "app_insights" {
  source              = "../modules/app_insights"
  app_insights_name   = "appi-csi-global"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "vnet" {
  source              = "../modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  
  subnets = {
    (var.subnet_name) = var.subnet_address_prefix
  }

  tags                = var.tags
}

module "vm_sonarqube" {
  source              = "../modules/vm"
  vm_name             = "vm-csi-sonarqube"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_sonar_size
  admin_username      = var.vm_admin_username
  ssh_public_key_path = var.ssh_public_key_path

  subnet_id           = module.vnet.subnet_ids[var.subnet_name]

  tags                = var.tags
}

module "vm_nexus" {
  source              = "../modules/vm"
  vm_name             = "vm-csi-nexus"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_nexus_size
  admin_username      = var.vm_admin_username
  ssh_public_key_path = var.ssh_public_key_path

  subnet_id           = module.vnet.subnet_ids[var.subnet_name]

  tags                = var.tags
}
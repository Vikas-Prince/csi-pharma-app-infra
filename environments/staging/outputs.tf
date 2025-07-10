output "aks_name" {
  value = module.aks.kube_config_path
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

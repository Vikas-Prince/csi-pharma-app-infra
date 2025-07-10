output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.csi_aks.name
}

output "kube_config" {
  description = "Raw Kubernetes config to access the cluster"
  value       = azurerm_kubernetes_cluster.csi_aks.kube_config_raw
  sensitive   = true
}

output "kube_config_path" {
  description = "Suggested path to write the kubeconfig"
  value       = "kubectl config set-cluster ${azurerm_kubernetes_cluster.csi_aks.name}"
}

# ☸️ Azure Kubernetes Service (AKS) Terraform Module

This Terraform module provisions a **fully functional AKS cluster** with autoscaling, Azure CNI networking, managed identity, and best practices for production-readiness.

---

## 🚀 Features

- Deploys AKS cluster using SystemAssigned Identity
- Configurable node pool (size, count, autoscaling)
- Azure CNI networking via custom subnet
- Kubernetes version selectable
- Auto-scaling enabled by default
- Full tagging support
- Outputs raw kubeconfig for direct `kubectl` usage

---

## 📥 Input Variables

| Variable               | Description                                              | Type           | Default Value                           |
|------------------------|----------------------------------------------------------|----------------|-----------------------------------------|
| `aks_cluster_name`     | Name of the AKS cluster                                  | `string`       | `"dev-aks-cluster"`                     |
| `resource_group_name`  | Resource group name                                      | `string`       | `"default-rg"`                          |
| `location`             | Azure region                                             | `string`       | `"Central India"`                       |
| `dns_prefix`           | DNS prefix for the AKS API server                        | `string`       | `"aksdns"`                              |
| `kubernetes_version`   | AKS Kubernetes version                                   | `string`       | `"1.29.2"`                              |
| `subnet_id`            | Subnet ID for the AKS node pool                          | `string`       | `"/subscriptions/.../subnets/default"` |
| `node_count`           | Initial number of nodes                                  | `number`       | `2`                                     |
| `min_count`            | Minimum nodes for autoscaler                             | `number`       | `1`                                     |
| `max_count`            | Maximum nodes for autoscaler                             | `number`       | `4`                                     |
| `vm_size`              | VM size for AKS node pool                                | `string`       | `"Standard_DS2_v2"`                     |
| `os_disk_size_gb`      | OS disk size in GB                                       | `number`       | `50`                                    |
| `enable_auto_scaling`  | Enable or disable node pool autoscaling                  | `bool`         | `true`                                  |
| `node_labels`          | Labels to apply to node pool                             | `map(string)`  | `{ role = "system" }`                   |
| `tags`                 | Tags to apply to the AKS resources                       | `map(string)`  | `{ environment = "dev", project = "terraform-aks" }` |

---

## 📤 Outputs

| Output           | Description                                       |
|------------------|---------------------------------------------------|
| `aks_cluster_name` | Name of the AKS cluster                        |
| `kube_config`    | Raw Kubernetes configuration for kubectl access  |
| `kube_config_path` | Suggested command to configure local kubeconfig |

---

# 🖥️ Terraform Azure VM Module – Usage Guide

This Terraform module provisions a Linux Virtual Machine on Azure with optional public IP support, secure SSH authentication, configurable resources, and tagging. It is reusable, cloud-region agnostic, and ideal for development, QA, or production workloads.

---

## 🎯 What This Module Does

- Creates a **Public IP** (optional based on `enable_public_ip`)
- Creates a **Network Interface** connected to a given subnet
- Provisions a **Linux Virtual Machine** (Ubuntu 22.04 LTS)
- Supports **SSH key-based login** (no passwords)
- Outputs **VM name**, **VM ID**, and **Public IP**

---

## 📥 Input Variables

| Name                  | Description                            | Type              | Default                                                                 |
|-----------------------|----------------------------------------|-------------------|-------------------------------------------------------------------------|
| `vm_name`             | Name of the VM                         | `string`          | `"default-vm"`                                                          |
| `location`            | Azure region                           | `string`          | `"Central India"`                                                       |
| `resource_group_name` | Azure resource group name              | `string`          | `"default-resource-group"`                                              |
| `subnet_id`           | Subnet ID to attach the NIC            | `string`          | `/subscriptions/.../default-vnet/subnets/default-subnet`               |
| `enable_public_ip`    | Whether to associate a public IP       | `bool`            | `true`                                                                  |
| `vm_size`             | VM SKU (size)                          | `string`          | `"Standard_B2s"`                                                        |
| `admin_username`      | SSH login username                     | `string`          | `"azureuser"`                                                           |
| `ssh_public_key_path` | Path to your SSH public key file       | `string`          | `"~/.ssh/id_rsa.pub"`                                                   |
| `disk_size_gb`        | OS Disk size in GB                     | `number`          | `30`                                                                    |
| `tags`                | Tags to apply to resources             | `map(string)`     | `{ environment = "dev", project = "terraform-vm-deployment" }`         |

---

## 📤 Outputs

| Name         | Description                                 |
|--------------|---------------------------------------------|
| `vm_id`      | ID of the created Azure Virtual Machine     |
| `vm_name`    | Name of the Virtual Machine                 |
| `public_ip`  | Public IP Address (if enabled)              |

---

## 🚀 How to Use This Module

### 1. Add the Module Block

```bash
module "linux_vm" {
  source              = "./modules/azure-vm"
  vm_name             = "demo-vm"
  location            = "East US"
  resource_group_name = "rg-demo"
  subnet_id           = "/subscriptions/xxx/resourceGroups/rg-demo/providers/Microsoft.Network/virtualNetworks/demo-vnet/subnets/demo-subnet"
  enable_public_ip    = true
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  disk_size_gb        = 50
  tags = {
    environment = "dev"
    team        = "devops"
  }
}
```

### 2. Initialize and Apply Terraform

```bash
terraform init
terraform plan
terraform apply
```
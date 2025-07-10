# 📦 Terraform Azure VNet Module – Usage Guide

This module provisions an Azure Virtual Network (`azurerm_virtual_network`) and one or more Subnets (`azurerm_subnet`) using a simple and reusable interface.

## 🎯 Purpose

To provide a reusable and standardized way to provision networking infrastructure (VNet and Subnets) on Azure using Terraform.

---

## 🛠️ What This Module Does

- Creates a **Virtual Network** with a configurable address space.
- Dynamically creates multiple **Subnets** using a map input.
- Applies **tags** for better resource organization and cost tracking.
- Outputs the **VNet ID** and a map of **Subnet IDs** for downstream resources to consume.

---

## 📁 Inputs

| Variable Name         | Description                                      | Type              | Default Value                      |
|-----------------------|--------------------------------------------------|-------------------|------------------------------------|
| `vnet_name`           | Name of the Virtual Network                      | `string`          | `"default-vnet"`                   |
| `location`            | Azure region                                     | `string`          | `"Central India"`                  |
| `resource_group_name` | Name of the resource group                       | `string`          | `"default-resource-group"`         |
| `address_space`       | List of CIDR blocks for the VNet                | `list(string)`    | `["10.0.0.0/16"]`                  |
| `subnets`             | Map of subnet names to their CIDR blocks        | `map(list(string))` | `{ subnet1 = ["10.0.1.0/24"], subnet2 = ["10.0.2.0/24"] }` |
| `tags`                | Tags to assign to all resources                  | `map(string)`     | `{ environment = "dev", project = "terraform-networking" }` |

> ✅ **Validation:** All subnet CIDRs are validated to ensure correct format.

---

## 📤 Outputs

| Output Name   | Description                             |
|---------------|-----------------------------------------|
| `vnet_id`     | ID of the Virtual Network               |
| `subnet_ids`  | Map of subnet names to their IDs        |

---

## 🚀 How to Use This Module

### 1. Add the Module Block

```bash
module "networking" {
  source              = "./path-to-this-module"
  vnet_name           = "my-vnet"
  location            = "East US"
  resource_group_name = "my-resource-group"
  address_space       = ["10.10.0.0/16"]

  subnets = {
    frontend = ["10.10.1.0/24"]
    backend  = ["10.10.2.0/24"]
    db       = ["10.10.3.0/24"]
  }

  tags = {
    environment = "qa"
    team        = "devops"
  }
}

```

## 2. Initialize & Apply

```bash
terraform init
terraform plan
terraform apply
```
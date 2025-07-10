# 🐳 Terraform Azure Container Registry (ACR) Module

This Terraform module provisions an **Azure Container Registry (ACR)** to store and manage Docker container images. It supports configurable SKU, location, tagging, and optional admin access.

---

## 🎯 Features

- Deploys an ACR instance in a specified Azure region and resource group
- Supports `Basic`, `Standard`, and `Premium` SKUs
- Optional admin user access (disabled by default)
- Customizable tagging for cost/resource tracking

---

## 📥 Input Variables

| Variable Name         | Description                                      | Type           | Default Value                  |
|------------------------|--------------------------------------------------|----------------|--------------------------------|
| `acr_name`             | Globally unique name for the ACR                 | `string`       | `"myuniqueregistry1234"`       |
| `resource_group_name`  | Name of the resource group                       | `string`       | `"default-resource-group"`     |
| `location`             | Azure region                                     | `string`       | `"Central India"`              |
| `sku`                  | ACR SKU tier (Basic, Standard, Premium)          | `string`       | `"Standard"`                   |
| `admin_enabled`        | Whether ACR admin access is enabled              | `bool`         | `false`                        |
| `tags`                 | Map of tags to apply to the ACR                  | `map(string)`  | `{ environment = "dev", project = "terraform-acr" }` |

---

## 🚀 Usage Example

```bash
module "acr" {
  source              = "./modules/acr"
  acr_name            = "mydevacr12345"
  resource_group_name = "rg-devops"
  location            = "East US"
  sku                 = "Standard"
  admin_enabled       = true
  tags = {
    environment = "dev"
    project     = "devops-pipeline"
  }
}
```

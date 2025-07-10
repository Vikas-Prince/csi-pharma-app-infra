# Terraform Module: Azure Application Insights

This module provisions an **Azure Application Insights** resource, commonly used for monitoring and observability in AKS or app services. It's pre-configured with `application_type = "java"` but can be modified if needed.

---

## 📌 Default Configuration

| Variable Name           | Default Value              | Description                                               |
|------------------------|----------------------------|-----------------------------------------------------------|
| `app_insights_name`     | `csi-appinsights`           | Name of the Application Insights instance                 |
| `location`              | `Central India`             | Azure region where the resource will be created           |
| `resource_group_name`   | `csi-observability-rg`      | Resource group to deploy into                             |
| `tags`                  | `{ environment = "dev", project = "csi-aks-observability" }` | Tags for resource categorization                          |

---

## 🛠️ How to Use

### Add Module to Your Terraform Project

```bash
module "app_insights" {
  source              = "./modules/app-insights"
  app_insights_name   = "csi-insights-dev"
  location            = "Central India"
  resource_group_name = "my-observability-rg"

  tags = {
    environment = "dev"
    team        = "platform"
  }
}
```
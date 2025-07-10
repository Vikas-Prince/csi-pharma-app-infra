# 📘️ CSI Java Pharma Cloud Infrastructure Repository (Terraform for Azure)

Welcome to the **infrastructure provisioning repository** for the `csi-java-pharma-app` — a secure, production-grade, cloud-native Java application hosted on **Microsoft Azure**, with infrastructure managed using **Terraform**. This repository implements a fully modular and scalable infrastructure approach, designed to support **multi-environment deployments** and seamless **GitOps-based delivery**.

---

## 🔹 Purpose

This repository enables automated, repeatable, and secure provisioning of all core infrastructure components necessary to host the CSI Java Pharma Application. The primary goals of this project are:

* Centralized management of infrastructure using **Infrastructure as Code (IaC)**
* Consistent deployment across **Dev**, **QA**, **Staging**, and **Production** environments
* Secure handling of secrets, observability, image storage, and DevSecOps tooling
* GitOps-ready environments, enabling ArgoCD-based application delivery

---

## 🔧 Infrastructure Design Overview

The infrastructure is segmented into **global shared resources** and **environment-specific resources** to ensure strong isolation, scalability, and clear separation of concerns.

### ✅ Global Shared Components (Provisioned Once)

These resources are provisioned once and shared across all environments:

* **Azure Key Vault**: Centralized secret management
* **Azure Container Registry (ACR)**: Storage and distribution of container images
* **Azure Application Insights**: Application-level observability and tracing
* **Virtual Machines for SonarQube and Nexus**: Used for code analysis and artifact hosting respectively
* **Remote Backend (Blob Storage)**: Terraform state storage with state locking and isolation

### ✅ Environment-Specific Components (Per Environment: dev, qa, staging, prod)

Each environment has its own isolated infrastructure to enable safe experimentation, CI/CD validation, and production-grade stability:

* **Resource Group**: Dedicated per environment for resource scoping
* **Virtual Network (VNet)**: Custom address space with three subnets (system, app, monitoring)
* **AKS Cluster**: Kubernetes cluster with private node pools
* **Custom Backends**: Separate tfstate file for each environment

---

## 🌍 Multi-Environment Strategy

This project follows an **explicit environment folder structure** instead of relying on Terraform workspaces, which are not scalable in enterprise setups.

### ❌ Why Not Workspaces?

While Terraform workspaces provide simple environment separation, they come with severe limitations:

* Risk of misapplying changes to the wrong environment
* Poor visibility and traceability in CI/CD pipelines
* No support for per-environment customization like CIDRs, tags, and naming
* Lacks GitOps readiness

### ✅ Our Approach

* Each environment (`dev`, `qa`, `staging`, `prod`) is represented by a dedicated folder under `environments/`
* Each has its own state backend, variable files, and resource configurations
* Ensures complete isolation and auditability

---

## 📅 Infrastructure Modules

To promote reusability and separation of concerns, the infrastructure is built using **custom Terraform modules**:

| Module         | Purpose                                     |
| -------------- | ------------------------------------------- |
| `vnet`         | Virtual Network with multiple subnets       |
| `aks`          | Azure Kubernetes Service setup              |
| `acr`          | Azure Container Registry                    |
| `keyvault`     | Key Vault for secret management             |
| `mysql`        | Azure Database for MySQL (optional per env) |
| `app_insights` | Application Insights instance               |
| `vm`           | Base VM module used for SonarQube and Nexus |

Each module is written using industry conventions, parameterized for flexibility, and can be reused across multiple environments.

---

## 🛡️ Security & Governance

* All sensitive values (secrets, keys) are stored in Azure Key Vault
* Naming conventions and tagging policies are enforced for traceability
* Each environment is deployed in an isolated resource group and VNet
* Kubernetes Network Policies are applied per namespace
* Bastion access is considered for administration

---

## 🔒 Remote State Management

State management is handled using **Azure Blob Storage** with a dedicated key per environment:

| Environment | Backend Key                |
| ----------- | -------------------------- |
| dev         | `dev-infra.tfstate`        |
| qa          | `qa-infra.tfstate`         |
| staging     | `staging-infra.tfstate`    |
| prod        | `prod-infra.tfstate`       |
| global      | `global-resources.tfstate` |

This ensures complete **state isolation** and prevents accidental corruption during parallel execution.

---

## 🚀 GitOps Alignment

This Terraform infrastructure is designed to be fully compatible with GitOps practices:

* ArgoCD bootstraps from the `dev` cluster (hub) and manages all other environments (spokes)
* Infra provisioning is done manually or through CI pipelines before application GitOps sync
* Secrets from Key Vault are consumed via CSI driver or External Secrets Operator (future scope)
* Infrastructure lifecycle follows pull-request based change management

---

## 🌐 Networking Model

Each environment provisions its own VNet with the following subnets:

* `system`: For AKS system node pools, ingress, etc.
* `app`: Application workloads and service mesh
* `monitoring`: Logging, monitoring agents, and observability stack

This enables strong network segmentation and allows NSG (Network Security Group) enforcement per subnet.

---

## 🏆 Naming Conventions

| Resource Type   | Pattern                  |
| --------------- | ------------------------ |
| Resource Group  | `rg-csi-<env>`           |
| VNet            | `vnet-csi-<env>`         |
| AKS Cluster     | `aks-csi-<env>`          |
| App Insights    | `appi-csi-global`        |
| ACR             | `acrglobalcsi`           |
| Key Vault       | `kv-csi-global`          |
| Sonar/Nexus VMs | `vm-csi-sonarqube`, etc. |

---

## 🔄 Deployment Workflow

```bash
# Example: Provision Dev Environment
cd environments/dev
terraform init
terraform plan
terraform apply
```

Repeat the above for each environment: `qa`, `staging`, `prod`.

> Note: The shared `global-resources/` must be provisioned before environment-specific resources.

---

## **Conclusion**

This repository provides a robust, scalable, and secure infrastructure setup for hosting the CSI Java Pharma Application on Microsoft Azure. With a focus on **Infrastructure as Code (IaC)** and **GitOps-based delivery**, it ensures consistent, repeatable, and secure deployments across multiple environments.

By leveraging **Terraform modules**, **Azure services**, and **best practices in security and governance**, this infrastructure is designed to support both current and future growth of the application. The use of isolated environments and a clear multi-environment strategy ensures seamless management, from development to production.


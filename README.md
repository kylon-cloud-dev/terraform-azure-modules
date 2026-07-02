# Terraform Azure Module Library with HCP Terraform and Vault OIDC

## Project Overview

This project demonstrates a reusable Terraform module library for Azure infrastructure. It includes versioned AzureRM modules for Virtual Network, Azure Container Registry, and Azure Kubernetes Service, published to the HCP Terraform private registry.

The project also demonstrates a secure DevSecOps credential pattern using HashiCorp Vault, GitHub Actions OIDC, and Azure dynamic credentials. Instead of storing long-lived Azure credentials directly in GitHub repository secrets, GitHub Actions authenticates to Vault using OIDC and Vault issues short-lived Azure credentials at runtime.

---

## Business Problem

When every team writes Terraform from scratch, cloud infrastructure becomes inconsistent. One team may build a VNet with different address spaces, another team may configure container registries differently, and another team may deploy Kubernetes clusters without the same security defaults.

A Terraform module library solves this by giving teams reusable, tested, and versioned building blocks.

This project addresses that problem by:

- Creating reusable Azure Terraform modules.
- Publishing modules to a private registry.
- Validating modules through GitHub Actions.
- Demonstrating secure runtime credential retrieval through Vault.
- Reducing dependency on long-lived cloud credentials in CI/CD.

---

## Tools and Technologies

| Category | Tools |
|---|---|
| Cloud Provider | Microsoft Azure |
| Infrastructure as Code | Terraform |
| Module Registry | HCP Terraform Private Registry |
| Secrets Management | HashiCorp Vault Dedicated |
| CI/CD | GitHub Actions |
| Identity | GitHub Actions OIDC, Microsoft Entra ID |
| Azure Services | Virtual Network, Azure Container Registry, Azure Kubernetes Service |
| CLI Tools | Azure CLI, Terraform CLI, curl, jq |

---

## Architecture

```text
Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions Validation
   |
   v
Reusable Terraform Modules
   |
   +--> VNet Module
   +--> ACR Module
   +--> AKS Module
   |
   v
HCP Terraform Private Registry
```

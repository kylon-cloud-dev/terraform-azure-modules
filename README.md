# Terraform Azure Module Library

This project is a reusable Terraform module library for Azure infrastructure. It demonstrates how platform and cloud engineering teams can standardize common infrastructure patterns using versioned Terraform modules, CI validation, and secure runtime credential handling.

## Project Goals

- Build reusable AzureRM Terraform modules
- Validate modules with GitHub Actions
- Demonstrate a complete example using multiple modules together
- Prepare modules for publishing to a private Terraform Cloud registry
- Integrate HashiCorp Vault with GitHub Actions OIDC for dynamic Azure credentials

## Business Problem

When every team writes Terraform from scratch, infrastructure becomes inconsistent. Network address spaces, container registry settings, Kubernetes cluster defaults, and security controls can drift across teams.

A Terraform module library solves this by giving teams approved building blocks. Instead of copying and modifying Terraform code, teams consume tested modules with clear inputs, outputs, and versioning.

## Repository Structure

```text
terraform-azure-modules/
├── modules/
│   ├── vnet/
│   ├── acr/
│   └── aks/
├── examples/
│   └── complete/
├── .github/
│   └── workflows/
│       ├── validate.yml
│       └── publish.yml
├── README.md
└── troubleshooting.md


## HCP Terraform Private Registry

The VNet, ACR, and AKS modules were published to the HCP Terraform private registry using tag-based publishing.

| Module | Provider | Version | Source Directory |
|---|---|---|---|
| vnet | azurerm | 1.0.0 | modules/vnet |
| acr | azurerm | 1.0.0 | modules/acr |
| aks | azurerm | 1.0.0 | modules/aks |

### Registry Screenshots

#### GitHub Actions Validation

![GitHub Actions validation success](screenshots/github-actions-validation-success.png)

#### VNet Module Published

![HCP Terraform VNet module published](screenshots/hcp-terraform-vnet-module-published.png)

#### ACR Module Published

![HCP Terraform ACR module published](screenshots/hcp-terraform-acr-module-published.png)

#### AKS Module Published

![HCP Terraform AKS module published](screenshots/hcp-terraform-aks-module-published.png)

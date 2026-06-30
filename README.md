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

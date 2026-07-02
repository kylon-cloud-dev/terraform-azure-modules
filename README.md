# Terraform Azure Module Library

This project is a reusable Terraform module library for Azure infrastructure. It demonstrates how platform and cloud engineering teams can standardize common infrastructure patterns using versioned Terraform modules, CI validation, HCP Terraform private registry publishing, HashiCorp Vault, GitHub Actions OIDC, and dynamic Azure credentials.

## Project Goals

- Build reusable AzureRM Terraform modules.
- Validate modules with GitHub Actions.
- Demonstrate a complete example using multiple modules together.
- Publish modules to the HCP Terraform private registry.
- Integrate HashiCorp Vault with GitHub Actions OIDC.
- Demonstrate short-lived Azure credential generation through Vault.

## Business Problem

When every team writes Terraform from scratch, infrastructure becomes inconsistent. Network address spaces, container registry settings, Kubernetes defaults, and security controls can drift across teams.

A Terraform module library solves this by giving teams approved building blocks. Instead of copying and modifying Terraform code, teams consume tested modules with clear inputs, outputs, versioning, and validation.

## Repository Structure

```text
terraform-azure-modules/
├── modules/
│   ├── vnet/
│   ├── acr/
│   └── aks/
├── examples/
│   └── complete/
├── vault-infra/
├── screenshots/
├── .github/
│   └── workflows/
│       ├── validate.yml
│       ├── publish.yml
│       └── vault-oidc-test.yml
├── README.md
└── troubleshooting.md

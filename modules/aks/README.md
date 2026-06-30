# Azure Kubernetes Service Terraform Module

This module deploys an Azure Kubernetes Service cluster with secure defaults and optional Azure Container Registry integration.

## What this module creates

- Azure Kubernetes Service cluster
- System-assigned managed identity
- Azure CNI networking
- Azure network policy
- Microsoft Entra ID RBAC integration
- Optional AcrPull role assignment for Azure Container Registry

## Security Notes

This module uses a system-assigned managed identity and supports Azure RBAC integration. If an ACR resource ID is provided, the module grants the AKS kubelet identity AcrPull access to the registry.

## Example Usage

```hcl
module "aks" {
  source = "../../modules/aks"

  name                = "aks-example"
  resource_group_name = "rg-example"
  location            = "East US"
  subnet_id           = module.vnet.subnet_ids["snet-aks"]
  acr_id              = module.acr.acr_id

  enable_auto_scaling = true
  min_count           = 1
  max_count           = 3

  tags = {
    environment = "dev"
    project     = "terraform-module-library"
  }
}

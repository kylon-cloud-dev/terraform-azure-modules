# Azure Container Registry Terraform Module

This module deploys an Azure Container Registry with secure defaults.

## What this module creates

- Azure Container Registry
- Optional geo-replication for Premium SKU
- Admin user disabled by default
- Optional tags

## Security Notes

The ACR admin user is disabled by default. For production-style deployments, use Microsoft Entra ID identities, managed identities, or service principals instead of static admin credentials.

## Example Usage

```hcl
module "acr" {
  source = "../../modules/acr"

  name                = "acrexample001"
  resource_group_name = "rg-example"
  location            = "East US"
  sku                 = "Standard"
  admin_enabled       = false

  tags = {
    environment = "dev"
    project     = "terraform-module-library"
  }
}

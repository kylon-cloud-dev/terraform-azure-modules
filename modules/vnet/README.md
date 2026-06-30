# Azure Virtual Network Terraform Module

This module deploys an Azure Virtual Network and an optional set of subnets.

## What this module creates

- Azure Virtual Network
- One or more Azure subnets
- Optional tags

## Example Usage

```hcl
module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-example"
  resource_group_name = "rg-example"
  location            = "East US"
  address_space       = ["10.0.0.0/16"]

  subnets = {
    "snet-aks"  = "10.0.1.0/24"
    "snet-misc" = "10.0.2.0/24"
  }

  tags = {
    environment = "dev"
    project     = "terraform-module-library"
  }
}

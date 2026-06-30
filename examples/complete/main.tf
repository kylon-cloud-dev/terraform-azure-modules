terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "acr_suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  common_tags = {
    environment = var.environment
    project     = "terraform-module-library"
    owner       = "kylon"
    managed_by  = "terraform"
  }

  acr_name = "acr${var.name_prefix}${random_string.acr_suffix.result}"
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = ["10.0.0.0/16"]

  subnets = {
    "snet-aks"   = "10.0.1.0/24"
    "snet-tools" = "10.0.2.0/24"
  }

  tags = local.common_tags
}

module "acr" {
  source = "../../modules/acr"

  name                = local.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = var.acr_sku
  admin_enabled       = false

  tags = local.common_tags
}

module "aks" {
  source = "../../modules/aks"

  name                = "aks-${var.name_prefix}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  subnet_id           = module.vnet.subnet_ids["snet-aks"]
  acr_id              = module.acr.acr_id

  node_vm_size        = var.node_vm_size
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 3

  tags = local.common_tags
}

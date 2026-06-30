variable "resource_group_name" {
  description = "Name of the resource group for the complete example."
  type        = string
  default     = "rg-terraform-modules-example"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "East US"
}

variable "name_prefix" {
  description = "Short lowercase name prefix used for resources."
  type        = string
  default     = "kylonmods"

  validation {
    condition     = can(regex("^[a-z0-9]{3,15}$", var.name_prefix))
    error_message = "name_prefix must be 3-15 characters and contain only lowercase letters and numbers."
  }
}

variable "environment" {
  description = "Environment tag value."
  type        = string
  default     = "dev"
}

variable "acr_sku" {
  description = "Azure Container Registry SKU."
  type        = string
  default     = "Standard"
}

variable "node_vm_size" {
  description = "VM size for the AKS default node pool."
  type        = string
  default     = "Standard_D2s_v3"
}

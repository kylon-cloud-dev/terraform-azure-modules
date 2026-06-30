variable "name" {
  description = "Name of the Azure Container Registry. Must be globally unique and use only lowercase letters and numbers."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{5,50}$", var.name))
    error_message = "ACR name must be 5-50 characters and contain only lowercase letters and numbers."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy the container registry into."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "sku" {
  description = "SKU tier. Basic for labs, Standard for most workloads, Premium for geo-replication."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "SKU must be Basic, Standard, or Premium."
  }
}

variable "admin_enabled" {
  description = "Enable the ACR admin user. Disabled by default because managed identity or service principals are preferred."
  type        = bool
  default     = false
}

variable "georeplications" {
  description = "List of Azure regions to geo-replicate to. Requires Premium SKU."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the container registry."
  type        = map(string)
  default     = {}
}

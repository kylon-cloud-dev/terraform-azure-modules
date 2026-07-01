variable "vault_address" {
  description = "Vault server URL."
  type        = string
}

variable "github_org" {
  description = "GitHub organization or username."
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name."
  type        = string
  default     = "terraform-azure-modules"
}

variable "azure_subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure tenant ID."
  type        = string
  sensitive   = true
}

variable "vault_sp_client_id" {
  description = "Client ID of the Azure service principal Vault uses to create dynamic credentials."
  type        = string
  sensitive   = true
}

variable "vault_sp_client_secret" {
  description = "Client secret of the Azure service principal Vault uses to create dynamic credentials."
  type        = string
  sensitive   = true
}

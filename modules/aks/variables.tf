variable "name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy the AKS cluster into."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version. Pin to a supported version for production stability."
  type        = string
  default     = null
}

variable "node_count" {
  description = "Initial number of nodes in the default node pool when autoscaling is disabled."
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for the default node pool."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "subnet_id" {
  description = "Subnet ID for the AKS node pool."
  type        = string
}

variable "acr_id" {
  description = "ACR resource ID to grant AcrPull access to the AKS kubelet identity."
  type        = string
  default     = null
}

variable "enable_auto_scaling" {
  description = "Whether to enable autoscaling on the default node pool."
  type        = bool
  default     = true
}

variable "min_count" {
  description = "Minimum node count when autoscaling is enabled."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum node count when autoscaling is enabled."
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to the AKS cluster."
  type        = map(string)
  default     = {}
}

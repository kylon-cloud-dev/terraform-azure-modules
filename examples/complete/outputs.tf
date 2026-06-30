output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = azurerm_resource_group.this.name
}

output "vnet_name" {
  description = "Name of the deployed virtual network."
  value       = module.vnet.vnet_name
}

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs."
  value       = module.vnet.subnet_ids
}

output "acr_name" {
  description = "Name of the deployed Azure Container Registry."
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "Login server for the Azure Container Registry."
  value       = module.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the deployed AKS cluster."
  value       = module.aks.cluster_name
}

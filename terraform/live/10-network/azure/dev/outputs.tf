output "resource_group_name" {
  value = module.azure_network.resource_group_name
}

output "vnet_name" {
  value = module.azure_network.vnet_name
}

output "vnet_id" {
  value = module.azure_network.vnet_id
}

output "aks_subnet_id" {
  value = module.azure_network.aks_subnet_id
}

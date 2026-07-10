##################################################
# Resource Group
##################################################

output "resource_group_name" {
    value = azurerm_resource_group.this.name
}

###################################################
# virtual Network
###################################################

output "vnet_id" {
    value = azurerm_virtual_network.this.id
}

output "vnet_name" {
    value = azurerm_virtual_network.this.name
}

###################################################
# Subnets
###################################################

output "aks_subnet_id" {
    value = azurerm_subnet.aks.id
}

output "shared_subnet_id" {
    value = azurerm_subnet.shared.id
}

output "bastion_subnet_id {
    value = azurerm_subnet.bastion.id
}


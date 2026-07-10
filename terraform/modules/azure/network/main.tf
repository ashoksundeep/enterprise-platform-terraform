#######################################################
# Resource Group
#######################################################

resource "azurerm_resource_group" "this" {

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags

}

#########################################################
# Virtual Network
#########################################################

resource "azurerm_virtual_network" "this" {

  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  address_space = var.address_space

  tags = var.tags

}

#########################################################
# AKS Subnet
#########################################################

resource "azurerm_subnet" aks {

    name                 = var.aks_subnet_name
    resource_group_name  = azurerm_resource_group.this.name
    virtual_network_name = azurerm_virtual_network.this.name

    address_prefixes = [
        var.aks_subnet_prefix
    ]
        
}

###########################################################
# Shared services subnet
###########################################################

resource "azurerm_subnet" "shared" {

    name                 = var.shared_subnet_name
    resource_group_name  = azurerm_resource_group.this.name
    virtual_network_name = azurerm_virtual_network.this.name

    address_prefixes = [
        var.shared_subnet_prefix
    ]

}

############################################################
# Bastion subnet
############################################################

resource "azurerm_subnet" "bastion" {
    
    name                 = "AzureBastionSubnet"
    resource_group_name  = azurerm_resource_group.this.name
    virtual_network_name = azurerm_virtual_network.this.name

    address_prefixes = [
        var.bastion_subnet_prefix
    ] 
    
}
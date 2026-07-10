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

resource "azurerm_subnet" "aks" {

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

############################################################################################
# AKS Network Security Group [local.tf is where the local.resource.prefix comes from]
############################################################################################

resource "azurerm_network_security_group" "aks" {

    name                = "${local.resource_prefix}-aks-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.this.name
    tags                = var.tags

}

############################################################################
# Shared services nsg
###########################################################################

resource "azurerm_network_security_group" "shared" {

    name                = "${local.resource_prefix}-shared-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.this.name
    tags                = var.tags

}

############################################################################
# Bastion nsg
############################################################################

resource "azurerm_network_security_group" "bastion" {
    
    name                = "${local.resource_prefix}-bastion-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.this.name
    tags                = var.tags

}

############################################################################
# AKS NSG association
############################################################################

resource "azurerm_subnet_network_security_group_association" "aks" {
    subnet_id                 = azurerm_subnet.aks.id
    network_security_group_id = azurerm_network_security_group.aks.id
}

############################################################################
# Shared NSG association
############################################################################

resource "azurerm_subnet_network_security_group_association" "shared" {
    subnet_id                 = azurerm_subnet.shared.id
    network_security_group_id = azurerm_network_security_group.shared.id
}

#############################################################################
# Bastion NSG association
#############################################################################

resource "azurerm_subnet_network_security_grup_association" "bastion" {
    subnet_id                 = azurerm_subnet.bastion.id
    network_security_group_id = azurerm_network_security_group.bastion.id
}

#############################################################################
# Route table
#############################################################################

resource "azure_route_table" "this" {
    name                = "${local.resource_prefix}-rt
    location            = var.location
    resource_group_name = azurerm_resource_group.this.name
    tags                = var.tags
}

##############################################################################
# Associate AKS route table
##############################################################################

resource "azurerm_subnet_route_table_association" "aks" {
    subnet_id      = azurerm_subnet.aks.id
    route_table_id = azurerm_route_table.this.id
}

#################################################################################
# Associate route table to shared services
#################################################################################

resource "azurerm_subnet_route_table_association" "shared" {
    subnet_id      = azurerm_subnet.shared.id
    route_table_id = azurerm_route_table.this.id
}

#################################################################################
# Associate route table to bastion
#################################################################################

resource "azurerm_subnet_route_table_association" "bastion" {
    subnet_id      = azurerm_subnet.bastion.id
    route_table_id = azurerm_route_table.this.id
}

 


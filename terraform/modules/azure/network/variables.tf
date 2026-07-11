variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Vnet CIDR"
  type        = list(string)
}

variable "environment" {
  description = "Development Environment"
  type        = string
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
}

#############################################
# AKS Subnet
#############################################

variable "aks_subnet_name" {
  description = "AKS Subnet Name"
  type        = string
}

variable "aks_subnet_prefix" {
  description = "AKS Subnet Address Prefix"
  type        = string
}

#############################################
# Shared Services Subnet
#############################################

variable "shared_subnet_name" {
  description = "Shared Services Subnet Name"
  type        = string
}

variable "shared_subnet_prefix" {
  description = "Shared Services Subnet Address Prefix"
  type        = string
}

#############################################
# Azure Bastion
#############################################

#variable "bastion_subnet_prefix" {
#  description = "Azure Bastion Subnet Address Prefix"
#  type        = string
#}

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
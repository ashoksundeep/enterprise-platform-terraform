variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry Name"
  type        = string
}

variable "sku" {
  description = "ACR SKU"
  type        = string
  default     = "Standard"

  ## Notice the validation block—this prevents invalid SKUs before Azure ever sees the request.
  validation {
    condition = contains(
      ["Basic", "Standard", "Premium"],
      var.sku
    )
    error_message = "Allowed values: Basic, Standard or Premium."
  }
}

variable "admin_enabled" {
  description = "Enable admin account"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "data_endpoint_enabled" {
  type    = bool
  default = false
}

variable "zone_redundancy_enabled" {
  type    = bool
  default = false
}

locals {

  premium_sku = var.sku == "Premium"

  enable_zone_redundancy = (
    local.premium_sku ? var.zone_redundancy_enabled : false
  )

  enable_data_endpoint = (
    local.premium_sku ? var.data_endpoint_enabled : false
  )

  common_tags = merge(
    {
      ManagedBy   = "Terraform"
      Repository  = "enterprise-platform-terraform"
      Module      = "azure-acr"
      CreatedBy   = "Platform Engineering"
      Environment = var.environment
    },
    var.tags
  )
}

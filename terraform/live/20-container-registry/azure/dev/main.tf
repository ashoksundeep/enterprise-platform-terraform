module "acr" {
  source = "../../../../modules/azure/acr"

  resource_group_name = var.resource_group_name
  location            = var.location

  acr_name      = var.acr_name
  sku           = var.sku
  admin_enabled = var.admin_enabled

  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled

  environment = var.environment

  tags = var.tags
}

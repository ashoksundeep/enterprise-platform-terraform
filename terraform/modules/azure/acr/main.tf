resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled         = local.enable_data_endpoint
  zone_redundancy_enabled       = local.enable_zone_redundancy
  tags                          = local.common_tags

  lifecycle {
    prevent_destroy = true
  }
}

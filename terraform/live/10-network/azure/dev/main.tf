module "azure_network" {
  source              = "../../../../modules/azure/network"
  resource_group_name = "rg-enterprise-dev"
  location            = "centralindia"
  vnet_name           = "vnet-enterprise-dev"
  address_space = [
    "10.10.0.0/16"
  ]

  environment          = "dev"
  aks_subnet_name      = "snet-aks"
  aks_subnet_prefix    = "10.10.1.0/24"
  shared_subnet_name   = "snet-shared"
  shared_subnet_prefix = "10.10.2.0/24"

  tags = {
    Project     = "Enterprise Platform"
    Environment = "Development"
    ManagedBy   = "Terraform"
    Owner       = "Sundeep Kumar"
    Repository  = "enterprise-platform-terraform"
  }
}

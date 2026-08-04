module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  config= var.resource_group
  }

module "virtual_network" {
    source = "../../child_module/azurerm_virtual_network"
  config= var.virtual_network
  depends_on = [module.resource_group]
  }

  module "subnets" {
  source = "../../child_module/azurerm_resource_subnet"
  config= var.subnets
  depends_on = [module.virtual_network]
  }
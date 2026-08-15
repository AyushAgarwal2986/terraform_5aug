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

  module "NSG" {
  source = "../../child_module/azurerm_network_security_group"
  config= var.nsg
  depends_on = [module.resource_group]
  }

  module "NSG_association" {
  source = "../../child_module/azurerm_subnet_network_security_group_association"
  config = {
    for key, association in var.NSG_association : key => {
      subnet_id = module.azurerm_subnet.subnet_ids[association.subnet_key]

      network_security_group_id = module.network_security_group.network_security_group_ids[association.nsg_key]
    }
  }
  depends_on = [module.subnets, module.NSG]
  }
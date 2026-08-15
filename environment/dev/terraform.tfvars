resource_group = {
    rg1 = {
        name = "rg1"
        location = "eastus"
    }
    }

 virtual_network = {
        vnet1 = {
        name = "vnet1"
        location = "eastus"
        resource_group_name = "rg1"
        address_space = ["10.0.0.0/16"]
    }
    }

    subnets = {
        subnet1 = {
        name = "subnet1"
        resource_group_name = "rg1"
        virtual_network_name = "vnet1"
        address_prefixes = ["10.0.1.0/24"]
        }
        subnet2 = {
        name = "subnet2"
        resource_group_name = "rg1"
        virtual_network_name = "vnet1"
        address_prefixes = ["10.0.2.0/24"]
        }}

        nsg = {
            nsg1 = { 
        name = "devnsg"
        location = "eastus"
        resource_group_name = "rg1" 
               }
        }

        NSG_association = {
           sa1 = {
    subnet_key = "subnet1"
    nsg_key    = "nsg1"
  }

  sa2 = {
    subnet_key = "subnet2"
    nsg_key    = "nsg1"
  }}
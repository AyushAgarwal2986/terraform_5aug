variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    
  }))
}


variable "NSG_association" {
  type = map(object({
    subnet_id                 = string
    network_security_group_id = string    
  }))
}
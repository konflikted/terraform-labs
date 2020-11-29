variable "loc" {
  description = "Default Azure region"
  default     = "East US"
}

variable "tags" {
  default     = {
    source    = "citadel"
    env       = "training"
  }
}

variable "lab3" {
  description = "Map of Lab 3: Adding Multiple Subnets to Virtual Network Azure_RM"
  type        = map
  default     = {
    "GatewaySubnet" = {
      address_prefixes = ["10.0.0.0/24"]
    },
    "dev" = {
      address_prefixes = ["10.0.1.0/24"]
    },
    "training" = {
      address_prefixes = ["10.0.2.0/24"]
    }
  }
}

variable "subnets" {
  description = "Name of each subnet in Lab 3 of Citadel Terraform Labs"
  type        = list(string)
  default     = ["", "dev", "training"]
}

variable "subnetip" {
  description = "CIDR Block for each subnet in above listed lab"
  type        = map(string)
  default     = {
    "GatewaySubnet" : "[10.0.0.0/24]", 
    "dev"           : "[10.0.1.0/24]", 
    "training"      : "[10.0.2.0/24]"
  }
}

/*
resource "azurerm_resource_group" "core" {
  name      = "core"
  location  = var.loc
  tags      = var.tags
}

resource "azurerm_public_ip" "pubip" {
  name                = "pubip"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  allocation_method   = "Dynamic"
  tags                = azurerm_resource_group.core.tags
}

resource "azurerm_virtual_network" "virtnet" {
  name                = "virtnet"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  address_space       = ["10.0.0.0/16"]
  dns_servers          = ["1.1.1.1", "1.0.0.1"]
  tags                = azurerm_resource_group.core.tags
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets)
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.virtnet.name
}


resource "azurerm_virtual_network_gateway" "vpnGateway" {
  name                = "vpnGateway"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  tags                = azurerm_resource_group.core.tags

  type                = "Vpn"
  vpn_type            = "RouteBased"
  
  sku                 = "Basic"
  enable_bgp          = true

  ip_configuration {
    name                          = "vpnGwConfig"
    public_ip_address_id          = azurerm_public_ip.pubip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnets.GatewaySubnet.id
  }
}
*/
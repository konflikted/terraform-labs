resource "azurerm_resource_group" "core" {
  name      = "Core"
  location  = var.loc
  tags      = var.tags
}

resource "azurerm_public_ip" "vpnGatewayPublicIp" {
  name                = "vpnGatewayPublicIP"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  tags                = azurerm_resource_group.core.tags

  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network" "core" {
  name                = "Core"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  tags                = azurerm_resource_group.core.tags

  address_space       = ["10.0.0.0/16"]
  dns_servers          = ["1.1.1.1", "1.0.0.1"]
}

resource "azurerm_subnet" "gatewaysubnet" {
  name                  = "GatewaySubnet"
  resource_group_name   = azurerm_resource_group.core.name
  virtual_network_name  = azurerm_virtual_network.core.name

  address_prefixes      = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "trainingsubnet" {
  name                  = "TrainingSubnet"
  resource_group_name   = azurerm_resource_group.core.name
  virtual_network_name  = azurerm_virtual_network.core.name

  address_prefixes      = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "devsubnet" {
  name                  = "DevSubnet"
  resource_group_name   = azurerm_resource_group.core.name
  virtual_network_name  = azurerm_virtual_network.core.name

  address_prefixes      = ["10.0.2.0/24"]
}

#resource "azurerm_vpn_gateway" "vpnGateway" {
#  name                = "vpnGateway"
#  location            = azurerm_resource_group.core.location
# resource_group_name = azurerm_resource_group.core.name
#  tags                = azurerm_resource_group.core.tags
#  
#  type                = "Vpn"
#  vpn_type            = "RouteBased"
#
#  sku                 = "Basic"
# enable_bgp          = true
#
#  ip_configuration {
#    namne                         = "vpnGwConfig"
#    public_ip_address_id          = azurerm_public_ip.vpnGatewayPublicIp.id
#    private_ip_address_allocation = "Dynamic"
#    subnet_id                     = azurerm_subnet.GatewaySubnet.id
#  }
#}
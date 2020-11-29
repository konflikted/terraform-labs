variable "loc" {
  description = "Default Azure region"
  default     = "eastus"
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

variable "webapplocs" {
  description = "List of locations for web apps"
  type        = list(string)
  default     = []
}
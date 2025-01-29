# Input varibales for bastion service 


variable "bastionservice_subnet_name"{
    description = "bastion subnet name "
    type = string
    default = "AzureBastionSubnet"
}

variable "bastion_address_prefix"{
    description = "address prefix for bastion service"
    type = list(string)
    default = ["10.0.10.0/24"]
}
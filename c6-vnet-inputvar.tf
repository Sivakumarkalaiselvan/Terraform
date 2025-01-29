# Input Variables for V-Net
variable "virtual_network_name"{
    description ="Virtual network name"
    type = string
    default = "myvnet-1"
}

#Input variables for vnet address 
variable "vnet_address_space"{
    description = "virtual network address space"
    type = list(string)
    default = ["10.0.0.0/16"]
}

#Input variable for app subnet
variable "app_subnet_name"{
    description =" vnet app subnet name"
    type = string
    default = "myappsubnet"
}

#Input variable for subnet address space
variable "appsubnet_address_space" {
    description = "app subnet address"
    type = list(string)
    default = ["10.0.1.0/24"]  
}


#Input variable for web subnet
variable "web_subnet_name"{
    description =" vnet web subnet name"
    type = string
    default = "mywebsubnet"
}

#Input variable for subnet address space
variable "websubnet_address_space" {
    description = "web subnet address"
    type = list(string)
    default = ["10.0.2.0/24"]  
}

#Input variable for web subnet
variable "db_subnet_name"{
    description =" vnet db subnet name"
    type = string
    default = "mydbsubnet"
}

#Input variable for subnet address space
variable "dbsubnet_address_space" {
    description = "db subnet address"
    type = list(string)
    default = ["10.0.3.0/24"]  
}

#Input variable for web subnet
/* variable "bastion_subnet_name"{
    description =" vnet bastion subnet name"
    type = string
    default = "mybastionsubnet"
} 

#Input variable for subnet address space
variable "bastionsubnet_address_space" {
    description = "my bastion address"
    type = string
    default = ["10.0.1.0/24"]  
}  */

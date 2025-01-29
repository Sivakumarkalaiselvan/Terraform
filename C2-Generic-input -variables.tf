# Generic Input Variables

#Business Division
variable "business_division" {
    description = "Large org this infra belongs to"
    type = string
    default = "sap"
  
}
#Environment Variable
variable "Environment" {
  description = "environment variable usef as a prefix"
  default = "dev"
}

#Resource Group : Comes under generic input variables 
variable "resource_group_name" {
    description = "Resource Group Name"
    default = "rg-default"
}

#Resource Group Location
variable "resource_group_location" {
  description = "Region in which azure resources to be created"
  default = "east US"
}
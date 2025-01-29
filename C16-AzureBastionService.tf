# Azure bastion service - Resources

#Resource-1 : Azure Bastion service subnet
resource "azurerm_subnet" "bastion_service_subnet" {
    name = var.bastionservice_subnet_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = azurerm_resource_group.myrg.name
    address_prefixes = var.bastion_address_prefix
}


#Resource-2 : Azure Bastion service pub ip
resource "azurerm_public_ip" "bastion_public_ip"{
    name = "${local.resource_group_prefix}-bastion-pub-ip"
   resource_group_name = azurerm_resource_group.myrg.name
   location = azurerm_resource_group.myrg.location
   allocation_method = "Static"
   sku = "Standard"
}


#Resource-3 : Azure bastion service host
resource "azurerm_bastion_host" "bastion_host"{
    name = "${local.resource_group_prefix}-host-service"
    resource_group_name = azurerm_resource_group.myrg.name
   location = azurerm_resource_group.myrg.location
   ip_configuration {
     name = "configuration"
     subnet_id= azurerm_subnet.bastion_service_subnet.id
     public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
   }
}


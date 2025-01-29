# Resource 1 : Public Ip for linux Vm
/*resource "azurerm_public_ip" "pubip_for_weblinuxvm"{
    name = "${local.resource_group_prefix}-pubip-weblinux-vm"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    allocation_method = "Static"
}*/


# Resource 2 : Nic for Web Linux VM
resource "azurerm_network_interface" "nic_for_linuxvm"{
    name = "${local.resource_group_prefix}-nic"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location 
    ip_configuration {
      name = "weblinuxpubip"
      subnet_id = azurerm_subnet.websub.id
      private_ip_address_allocation = "Dynamic"
     # public_ip_address_id = azurerm_public_ip.pubip_for_weblinuxvm.id
    }
}


#Resource 3 : NIC & NSG Association 
resource "azurerm_network_interface_security_group_association" "nic_nsg_ass" {
    network_interface_id = azurerm_network_interface.nic_for_linuxvm.id
    network_security_group_id = azurerm_network_security_group.webnsg.id
}
# Resource :  Web Subnet
resource "azurerm_subnet" "websub" {
name ="${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
resource_group_name = azurerm_resource_group.myrg.name
address_prefixes = var.websubnet_address_space
virtual_network_name = azurerm_virtual_network.vnet.name 
}

#Resource : Web Network Security Group
resource "azurerm_network_security_group" "webnsg" {
    name = "${azurerm_subnet.websub.name}-nsg"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}


#Resource : Sub & NSG association
resource "azurerm_subnet_network_security_group_association" "webnsgass" {
    depends_on = [azurerm_network_security_rule.webnsgrule] //It will go ahead and create the nsg rule and associate it with nsg . Once it is done association will start
    subnet_id = azurerm_subnet.websub.id
    network_security_group_id = azurerm_network_security_group.webnsg.id
}


# Resource : Create NSG Rules
# Create Locals block for NSG Rules  :
locals {
    web_nsg_inbound_port_rules = {
       "100" : "443",     // if the key starts with a number, you must use the (:) colon syntax
       "120" : "80",     //  Locals block with map of information 
       "130" : "22"
    }
}



#NSG rule for web tier subnet 
resource "azurerm_network_security_rule" "webnsgrule" {
  for_each = local.web_nsg_inbound_port_rules                         // for_each with map 
  name                        = "Rule_port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = each.value
  resource_group_name         = azurerm_resource_group.myrg.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
}


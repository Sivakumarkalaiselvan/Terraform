# Resource : Vnet
resource "azurerm_virtual_network" "vnet" {
    name = "${local.resource_group_prefix}-${var.virtual_network_name}"
    address_space= var.vnet_address_space
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location 
    tags = local.common_tags


}
# output values for virtual network

output "virtual_network_name"{
    description = "Virtual network name"
    value = azurerm_virtual_network.vnet.name  // Here we are getting output for argument reference
}

# output values for vn id
output "virtual_network_id"{
    description ="virtual network id"
    value = azurerm_virtual_network.vnet.id
}
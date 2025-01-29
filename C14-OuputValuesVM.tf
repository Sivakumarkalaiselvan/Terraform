# Pub ip
output "network-interface-pvtip"{
    description = "priavte ip addreess of network interface"
    value=azurerm_network_interface.nic_for_linuxvm.private_ip_address
}

# ip addresss list 
output "list_pvt_ip"{
    description = "list pf private address"
    value= [azurerm_network_interface.nic_for_linuxvm.private_ip_addresses]
}

# Load Balncer id
output "load_balancer_id"{
    description = "load balancer id "
    value =  azurerm_lb.web_lb.id
}
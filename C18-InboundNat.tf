# Resource 1 : inbound NAT Rules for LB
resource "azurerm_lb_nat_rule" "nat_rule_lb"{
    name ="demo-rule"
    protocol="Tcp"
    frontend_port=1022
    backend_port=22
    frontend_ip_configuration_name= azurerm_lb.web_lb.frontend_ip_configuration[0].name
    resource_group_name = azurerm_resource_group.myrg.name
    loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource 2 : Associate Nic with nat rule
resource "azurerm_network_interface_nat_rule_association" "demoassv" {
    network_interface_id = azurerm_network_interface.nic_for_linuxvm.id
    ip_configuration_name = azurerm_network_interface.nic_for_linuxvm.ip_configuration[0].name
    nat_rule_id = azurerm_lb_nat_rule.nat_rule_lb.id
}
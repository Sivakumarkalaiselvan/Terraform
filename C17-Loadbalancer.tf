# Resource : 1 Pub ip for LB
resource "azurerm_public_ip" "lbip"{
    name = "web-lb-ip"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    allocation_method = "Static"
    sku="Standard"
    tags=local.common_tags
}

#Resource : 2 Create Load Balancer
resource "azurerm_lb" "web_lb" {
    name = "web-lb"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    sku = "Standard"
    frontend_ip_configuration{
        name = "web-frontip"
        public_ip_address_id = azurerm_public_ip.lbip.id
    }
    }



#Resource : 3 Create LB back-end Pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
    name ="backendpool-1"
    loadbalancer_id = azurerm_lb.web_lb.id
      }

#Resource : 4 Create the LB Probe
resource "azurerm_lb_probe" "web_lb_probe"{
    name = "Tcp-probe"
    protocol = "Tcp"
    port = 80
    loadbalancer_id = azurerm_lb.web_lb.id
}

#Resource : 5 Create the LB Rule
resource "azurerm_lb_rule" "web_lb_rule"{
    name = "web-lb-rule"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
    loadbalancer_id = azurerm_lb.web_lb.id
    probe_id = azurerm_lb_probe.web_lb_probe.id
}

#Resource : 6 Associate the Nic of Vm's to Standard load balancer backend address pool
resource "azurerm_network_interface_backend_address_pool_association" "Nic_lb_ass"{
    network_interface_id = azurerm_network_interface.nic_for_linuxvm.id
    ip_configuration_name = azurerm_network_interface.nic_for_linuxvm.ip_configuration[0].name
    backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
    }
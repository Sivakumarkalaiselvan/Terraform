# Resource Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "weblinuxvm" {
    name = "${local.resource_group_prefix}-weblinuxvm"
    computer_name="web-vm"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    size = "Standard_DS1_V2"
    network_interface_ids = [azurerm_network_interface.nic_for_linuxvm.id]
    admin_username = "azureuser"
    admin_ssh_key {
      username = "azureuser"
      public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    }
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = "RedHat"
      offer = "RHEL"
      sku="83-gen2"
      version = "latest"
    }
}
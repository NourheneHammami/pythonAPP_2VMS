
#azure Virtual Machine1 #Linux #VNet1

resource "azurerm_network_interface" "nic_vm_app" {
  name                = "nic_vm_app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.rg-python-app.name

  ip_configuration {
    name                          = "vm_app_public_ip"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "VM1" {
  name                = "VM1"
  resource_group_name = azurerm_resource_group.rg-python-app.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

#terraform import azurerm_windows_virtual_machine.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Compute/virtualMachines/machine1

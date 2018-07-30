#create azure virtual machine
resource "azurerm_virtual_machine" "uk-dev101" {
  name = "uk-dev101"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  network_interface_ids = ["${azurerm_network_interface.NIC-1.id}"]
  availability_set_id = "${azurerm_availability_set.avset.id}"
  vm_size = "Standard_B2ms"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-datacenter"
    version = "2016.127.20180613"
  }

  storage_os_disk {
    name = "disk1"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "uk-dev101"
    admin_username = "sysadmin"
    admin_password = "Toyota20172018"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent = true
  }
}

#create vm2
resource "azurerm_virtual_machine" "uk-dev102" {
  name = "uk-dev102"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  network_interface_ids = ["${azurerm_network_interface.NIC-2.id}"]
  availability_set_id = "${azurerm_availability_set.avset.id}"
  vm_size = "Standard_B2ms"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-datacenter"
    version = "2016.127.20180613"
  }

  storage_os_disk {
    name = "disk2"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "uk-dev102"
    admin_username = "sysadmin"
    admin_password = "Toyota20172018"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent = true
  }
}

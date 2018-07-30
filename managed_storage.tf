#create managed disk by azure for vm1
resource "azurerm_managed_disk" "VM1_disk" {
  name = "VM1_disk"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  location = "${azurerm_resource_group.Dev.location}"
  storage_account_type = "standard_LRS"
  create_option = "empty"
  disk_size_gb = "1023"
}

#create managed disk for vm2
resource "azurerm_managed_disk" "VM2_disk" {
  name = "VM2_disk"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  location = "${azurerm_resource_group.Dev.location}"
  storage_account_type = "standard_LRS"
  create_option = "empty"
  disk_size_gb = "1023"
}


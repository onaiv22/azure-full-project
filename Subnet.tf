#create subnets for Dev, UAT and prd
resource "azurerm_subnet" "APP-1" {
  name = "APP-1"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  virtual_network_name = "${azurerm_virtual_network.DevNet.name}"
  address_prefix = "10.0.1.0/24"
}

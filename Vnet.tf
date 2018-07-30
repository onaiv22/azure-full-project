#create virtual network group
resource "azurerm_virtual_network" "DevNet" {
  name = "DevNet"
  address_space = ["10.0.0.0/16"]
  location = "North Europe"
  resource_group_name = "${azurerm_resource_group.Dev.name}"

  tags {
     environment = "Development"
  }
}

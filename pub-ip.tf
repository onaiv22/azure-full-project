#create public IP
resource "azurerm_public_ip" "pub-ip" {
  name = "pub-ip"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  public_ip_address_allocation = "static"
}

#create public ip for vm2
resource "azurerm_public_ip" "pub-ip1" {
    name = "pub-ip1"
    location = "${azurerm_resource_group.Dev.location}"
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    public_ip_address_allocation = "static"
}

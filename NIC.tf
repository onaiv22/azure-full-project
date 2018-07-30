#create Network Interface Card for vm1 in thesame subnet APP-1
resource "azurerm_network_interface" "NIC-1" {
  name = "NIC-1"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-dev.id}"

  ip_configuration {
  name = "vm1-ip"
  subnet_id = "${azurerm_subnet.APP-1.id}"
  private_ip_address_allocation = "static"
  private_ip_address = "10.0.1.20"
  public_ip_address_id = "${azurerm_public_ip.pub-ip.id}"
  load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.backendVMs.id}"]
  }
}

#create network interface card for vm2 in thesame subnet APP-1
resource "azurerm_network_interface" "NIC-2" {
  name = "NIC-2"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-dev.id}"

  ip_configuration {
  name = "vm2-ip"
  subnet_id = "${azurerm_subnet.APP-1.id}"
  private_ip_address_allocation = "static"
  private_ip_address = "10.0.1.21"
  public_ip_address_id = "${azurerm_public_ip.pub-ip1.id}"
  load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.backendVMs.id}"]
  }
}

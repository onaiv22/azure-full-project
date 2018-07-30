#create Network Security Group and rule attached to nic for vms in subnet app-1
resource "azurerm_network_security_group" "nsg-dev" {
  name = "nsg-dev"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"

  security_rule {
   name = "RDP"
   priority = "100"
   direction = "Inbound"
   access = "Allow"
   protocol = "tcp"
   source_port_range = "*"
   destination_port_range = "3389"
   source_address_prefix = "185.125.226.2"
   destination_address_prefix = "*"
  }
  security_rule {
   name = "HTTP"
   priority = "110"
   direction = "Inbound"
   access = "Allow"
   protocol = "tcp"
   source_port_range = "*"
   destination_port_range = "80"
   source_address_prefix = "*"
   destination_address_prefix = "*"
  }
  security_rule {
  name = "https"
  priority = "120"
  direction = "inbound"
  access = "allow"
  protocol = "tcp"
  source_port_range = "*"
  destination_port_range ="443"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  }
}

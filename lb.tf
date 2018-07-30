#create public IP
resource "azurerm_public_ip" "lb-pub-ip3" {
  name = "lb-pub-ip3"
  location = "${azurerm_resource_group.Dev.location}"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  public_ip_address_allocation = "static"
}
#create load balancer
resource "azurerm_lb" "lb"{
    name = "lb"
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    location = "${azurerm_resource_group.Dev.location}"

    frontend_ip_configuration {
       name = "client-interface"
       public_ip_address_id = "${azurerm_public_ip.lb-pub-ip3.id}"
    }
}
# create backend address pool
resource "azurerm_lb_backend_address_pool" "backendVMs" {
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    loadbalancer_id = "${azurerm_lb.lb.id}"
    name = "backendVMs"
}

#create lb nat rule
resource "azurerm_lb_nat_rule" "RDP" {
  resource_group_name            = "${azurerm_resource_group.Dev.name}"
  loadbalancer_id                = "${azurerm_lb.lb.id}"
  name                           = "RDP"
  protocol                       = "tcp"
  frontend_port                  = "3389"
  backend_port                   = 3389
  frontend_ip_configuration_name = "client-interface"
  count = 2
}

#create lb probe
resource "azurerm_lb_probe" "probing" {
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    loadbalancer_id = "${azurerm_lb.lb.id}"
    name = "tcp-running-probe"
    port = 80
    number_of_probes = 2
    interval_in_seconds = 5
}

resource "azurerm_lb_rule" "rule1" {
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    loadbalancer_id = "${azurerm_lb.lb.id}"
    name = "lbrule"
    protocol = "TCP"
    frontend_port = 80
    backend_port = 80
    frontend_ip_configuration_name = "client-interface"
    backend_address_pool_id  = "${azurerm_lb_backend_address_pool.backendVMs.id}"
    probe_id = "${azurerm_lb_probe.probing.id}"
}



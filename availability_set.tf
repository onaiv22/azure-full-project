resource "azurerm_availability_set" "avset" {
    name = "avset"
    location = "${azurerm_resource_group.Dev.location}"
    resource_group_name = "${azurerm_resource_group.Dev.name}"
    platform_update_domain_count = 5
    platform_fault_domain_count = 3
    managed = true

    tags {
       environment = "Production"
    }
}

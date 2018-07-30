#create azure storage account
resource "azurerm_storage_account" "dev0disk" {
  name = "dev0disk"
  resource_group_name = "${azurerm_resource_group.Dev.name}"
  location = "${azurerm_resource_group.Dev.location}"
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
}

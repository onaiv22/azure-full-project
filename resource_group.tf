#create multiple azure resource group
resource "azurerm_resource_group" "Dev" {
  name = "Dev"
  location = "North Europe"

  tags {
     environment = "Terraform Demo"
  }
}

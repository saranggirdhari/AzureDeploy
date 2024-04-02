resource "azurerm_databricks_workspace" "azure_databricks" {
  name                = var.azure_databricks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"
}
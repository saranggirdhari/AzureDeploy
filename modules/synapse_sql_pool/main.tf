data "azurerm_synapse_workspace" "synapse" {
  name = var.synapse_workspace_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_synapse_sql_pool" "example" {
  name                 = "${var.synapse_workspace_name}sqlpl"
  synapse_workspace_id = data.azurerm_synapse_workspace.synapse.id
  sku_name             = "DW100c"
  create_mode          = "Default"
  storage_account_type = "GRS"
}
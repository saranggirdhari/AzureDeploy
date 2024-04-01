data "azurerm_synapse_workspace" "synapse" {
  name = var.synapse_workspace_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_synapse_spark_pool" "synapse_spark_pool" {
  name                 = "${var.synapse_workspace_name}spkpl"
  synapse_workspace_id = data.azurerm_synapse_workspace.synapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Small"
  cache_size           = 100

  auto_scale {
    max_node_count = 10
    min_node_count = 3
  }

  auto_pause {
    delay_in_minutes = 15
  }
}
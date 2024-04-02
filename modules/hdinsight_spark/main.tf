module "storage_account" {
  source                         = "../storage_account"
  location                       = var.location
  storage_account_name           = "${var.hdinsight_spark_name}ps"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = false
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id = var.subnet_id
}

resource "azurerm_storage_container" "storage_account_container" {
  name                  = "${var.hdinsight_spark_name}psfscont"
  storage_account_name  = "${var.hdinsight_spark_name}ps"
  container_access_type = "private"
  depends_on = [ module.storage_account ]
}

resource "azurerm_hdinsight_spark_cluster" "hdi_spark" {
  name                = var.hdinsight_spark_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.hdinsight_spark_cluster_version
  tier                = var.hdinsight_spark_cluster_tier

  component_version {
    spark = var.hdinsight_spark_component_version
  }

  gateway {
    username = var.hdinsight_spark_gateway_username
    password = var.hdinsight_spark_gateway_password
  }

  storage_account {
    storage_container_id = azurerm_storage_container.storage_account_container.id
    storage_account_key  = module.storage_account.storage_account_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = var.hdinsight_spark_hn_vm_size
      username = var.hdinsight_spark_ssh_username
      password = var.hdinsight_spark_ssh_password
    }

    worker_node {
      vm_size               = var.hdinsight_spark_wn_vm_size
      username              = var.hdinsight_spark_ssh_username
      password              = var.hdinsight_spark_ssh_password
      target_instance_count = var.hdinsight_spark_wn_vm_count
    }

    zookeeper_node {
      vm_size  = var.hdinsight_spark_zk_vm_size
      username = var.hdinsight_spark_ssh_username
      password = var.hdinsight_spark_ssh_password
    }
  }
}
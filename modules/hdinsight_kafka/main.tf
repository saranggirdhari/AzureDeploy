module "storage_account" {
  source                         = "../storage_account"
  location                       = var.location
  storage_account_name           = "${var.hdinsight_kafka_name}ps"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = false
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id = var.subnet_id
}

resource "azurerm_storage_container" "storage_account_container" {
  name                  = "${var.hdinsight_kafka_name}psfscont"
  storage_account_name  = "${var.hdinsight_kafka_name}ps"
  container_access_type = "private"
  depends_on = [ module.storage_account ]
}

resource "azurerm_hdinsight_kafka_cluster" "hdinsight_kafka" {
  name                = var.hdinsight_kafka_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.hdinsight_kafka_cluster_version
  tier                = var.hdinsight_kafka_cluster_tier

  component_version {
    kafka = var.hdinsight_kafka_component_version
  }

  gateway {
    username = var.hdinsight_kafka_gateway_username
    password = var.hdinsight_kafka_gateway_password
  }

  storage_account {
    storage_container_id = azurerm_storage_container.storage_account_container.id
    storage_account_key  = module.storage_account.storage_account_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = var.hdinsight_kafka_hn_vm_size
      username = var.hdinsight_kafka_ssh_username
      password = var.hdinsight_kafka_ssh_password
    }

    worker_node {
      vm_size               = var.hdinsight_kafka_wn_vm_size
      username              = var.hdinsight_kafka_ssh_username
      password              = var.hdinsight_kafka_ssh_password
      number_of_disks_per_node = var.hdinsight_kafka_wn_disk_count
      target_instance_count    = var.hdinsight_kafka_wn_ti_count
    }

    zookeeper_node {
      vm_size  = var.hdinsight_kafka_zk_vm_size
      username = var.hdinsight_kafka_ssh_username
      password = var.hdinsight_kafka_ssh_password
    }
  }
}
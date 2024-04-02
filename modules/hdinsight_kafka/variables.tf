variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "location" {
  type        = string
  description = "Location of the region"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group in which to create the storage account"
}

variable "storage_account_name" {
  type = string
  description = "Name of the Azure Storage Account"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier"
}

variable "storage_account_replication" {
  type        = string
  description = "Storage account replication"
}

variable "storage_account_is_hns_enabled" {
  type        = bool
  description = "Storage account replication"
}

variable "storage_account_account_kind" {
  type = string
  description = "Storage account type"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID"
}

variable "hdinsight_kafka_name" {
  type = string
  description = "HDInsight kafka name"
}

variable "hdinsight_kafka_cluster_version" {
  type = string
  description = "HDInsight kafka cluster version"
}

variable "hdinsight_kafka_cluster_tier" {
  type = string
  description = "HDInsight kafka cluster tier"
}

variable "hdinsight_kafka_component_version" {
  type = string
  description = "HDInsight kafka component version"
}

variable "hdinsight_kafka_gateway_username" {
  type = string
  description = "HDInsight kafka gateway username"
}

variable "hdinsight_kafka_gateway_password" {
  type = string
  description = "HDInsight kafka gateway password"
}

variable "hdinsight_kafka_hn_vm_size" {
  type = string
  description = "HDInsight kafka head node VM size"
}

variable "hdinsight_kafka_wn_vm_size" {
  type = string
  description = "HDInsight kafka worker node VM size"
}

variable "hdinsight_kafka_wn_ti_count" {
  type = number
  description = "HDInsight kafka worker node target instance count"
}

variable "hdinsight_kafka_wn_disk_count" {
  type = number
  description = "HDInsight kafka number of disks per worker node"
}

variable "hdinsight_kafka_zk_vm_size" {
  type = string
  description = "HDInsight kafka head node VM size"
}

variable "hdinsight_kafka_ssh_username" {
  type = string
  description = "HDInsight kafka ssh username"
}

variable "hdinsight_kafka_ssh_password" {
  type = string
  description = "HDInsight kafka ssh password"
}
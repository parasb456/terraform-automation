variable "environment" {
  description = "The name of the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the Storage Account will be created."
  type        = string
}

variable "blob_storage_name" {
  description = "The name of the Storage Container."
  type        = string
}

variable "blob_storage_name_2" {
  type = string
}

variable "storage_account_tier" {
  type = string
}

variable "storage_account_replication_type" {
  type = string
}

variable "storage_container_access_type" {
  type = string
}

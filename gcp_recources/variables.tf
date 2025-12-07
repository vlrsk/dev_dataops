variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-central2-a"
}

variable "gcs_bucket_name" {
  description = "Name of the demo GCS bucket (resource, not backend state)"
  type        = string
  default     = "dev_dataops_test_backet_name_1"
}

variable "bq_dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
  default     = "big_query_test_dataset"
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "test-vm"
}
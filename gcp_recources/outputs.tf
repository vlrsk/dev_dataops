output "gcs_bucket_name" {
  value = google_storage_bucket.example_bucket.name
}

output "bigquery_dataset_id" {
  value = google_bigquery_dataset.example_bq_dataset.dataset_id
}

output "vm_external_ip" {
  value = google_compute_instance.example_vm.network_interface[0].access_config[0].nat_ip
}
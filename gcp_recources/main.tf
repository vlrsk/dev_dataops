terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "dev-dataops-tf-state-bucket-1"
    prefix = ""
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_storage_bucket" "example_bucket" {
  name                        = var.gcs_bucket_name
  location                    = var.region
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_bigquery_dataset" "example_bq_dataset" {
  dataset_id                  = var.bq_dataset_id
  location                    = "EU"
  delete_contents_on_destroy  = true
}

resource "google_compute_instance" "example_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  tags = ["web", "demo"]
}
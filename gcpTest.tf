provider "google" {
  credentials = var.gcp_creds
  project = "Sales"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Harness parameterized set variables
variable "gcp_creds" {
  type = string
}

variable "hostname" {
  type = string
}

resource "google_compute_instance" "vm_instance" {
  name         = var.hostname
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

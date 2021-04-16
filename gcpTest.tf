provider "google" {
  version = "3.5.0"

  credentials = var.creds
  project = "sales"
  region  = "us-east-2"
  zone    = "us-east-4c"
}

variable "hostname" {
  default = "robin-tf-001"
}
variable "creds" {
}

#terraform {
#  backend "gcs" {
#    bucket      = "gcp-global-bucket"
#    prefix      = "terraform"
#    credentials = file("carvana-harness-test-7c0871fbf281.json")
#  }
#}

#resource "google_compute_attached_disk" "default" {
#  disk     = google_compute_disk.default.id
#  instance = google_compute_instance.default.id
#}

resource "google_compute_instance" "vm_instance" {
  name         = var.hostname
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = "centos-7-v20210401"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}


#output "ip" {
#  value = google_compute_instance.google_compute_address.address
#}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("qourra-ad3a3b846861.json")

  project = "qourra"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "default" {
  name         = "younes-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west6-c"
  boot_disk {
    initialize_params {
      image = "centos-stream-9-v20231115"

    }
  }
  scratch_disk {
    interface = "NVME"
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata = {
    ssh-keys = "younes:${file("~/.ssh/id_rsa.pub")}"
  }
}


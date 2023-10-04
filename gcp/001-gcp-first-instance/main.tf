#creating the GCP instance

provider "google" {
  credentials = file("${path.module}/credentials.json")
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "webserver" {
  name         = var.instance_name
  zone         = var.zone
  machine_type = var.machine_type


  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  # Network tags
  # http-server = 80 - default
  # https-server = 443 - default
  # allow-icmp - default
  tags = ["http-server", "https-server", "allow-icmp"]

  metadata_startup_script = "echo hi > /test.txt"
}
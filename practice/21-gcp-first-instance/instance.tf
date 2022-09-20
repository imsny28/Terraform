# Creating GCP instance
resource "google_compute_instance" "web" {
  name = "fateh-terraform-test"

  # NOTE: Switch test to use n1 as it has a local ssd attached which e2 doesn't support
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  # Network tags
  # http-server = 80 - default
  # https-server = 443 - default
  # allow-icmp - default
  tags = ["http-server", "https-server", "allow-icmp"]

  # Network interfaces
  network_interface {
    network = "default"

    # Dynamic public IP
    access_config {
      // Ephemeral public IP
    }
  }

  # Boot disk
  scratch_disk {
    interface = "SCSI"
  }

  metadata_startup_script = file("${path.module}/script.sh")

  provisioner "local-exec" {
    command = "echo ${self.network_interface[0].access_config[0].nat_ip}>external_ip.txt"
  }
}

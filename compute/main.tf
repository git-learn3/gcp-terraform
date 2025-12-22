resource "google_compute_instance" "public_vm" {
  name         = "public-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.public_subnet_id
    access_config {}
  }

  metadata = {
    ssh-keys = "gcpuser:${var.ssh_public_key}"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl start nginx
    systemctl enable nginx
  EOF
}

resource "google_compute_instance" "private_vm" {
  name         = "private-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.private_subnet_id
  }

  metadata = {
    ssh-keys = "gcpuser:${var.ssh_public_key}"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "bull_board_vm" {
  name         = "bull-board-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["http-server"]

  metadata_startup_script = file("startup.sh")

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }

  connection {
    type        = "ssh"
    user        = "debian"
    private_key = file(var.ssh_private_key_path)
    host        = self.network_interface[0].access_config[0].nat_ip
  }

  service_account {
    email  = google_service_account.bullboard_sa.email
    scopes = ["cloud-platform"]
  }
}

resource "google_service_account" "bullboard_sa" {
  account_id   = "bullboard-sa"
  display_name = "Bull Board Service Account"
}

resource "google_compute_firewall" "allow_http_3000" {
  name    = "allow-http-3000"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  target_tags = ["http-server"]
  direction   = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

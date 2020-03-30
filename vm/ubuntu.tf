
// Create a GCE instance
resource "google_compute_instance" "mvp-demo" {
  name         = "ubuntu-bastion"
  machine_type = "n1-standard-1"  // gcloud compute machine-types list

  zone         = "asia-northeast3-a"  // gcloud compute zones list    

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"  // gcloud compute images list
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = google_compute_network.mvp_vpc_network.self_link
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > ~/test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}

resource "google_compute_network" "mvp_vpc_network" {
  name                    = "mvp-network"
  auto_create_subnetworks = "true"
}

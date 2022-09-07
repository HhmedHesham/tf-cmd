
// required to know which provider to download and use for this project from the terraform registry
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

//  used to configure the named provider, in this case google u can use mutlipe progiders like aws as well 
provider "google" {
  version = "3.5.0"
  project = "<PROJECT_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}


resource "google_compute_instance" "vm_instance" {
    // name of the instance
  name         = "terraform-instance"
    // machine type of the instance
  machine_type = "f1-micro"
    // the zone in which the instance will be created
    zone         = "us-central1-c"

    tags         = ["web", "dev"]

    // add provisioners local exec to run commands on the instance
    provisioner "local-exec" {
          command = "echo ${google_compute_instance.vm_instance.name}: ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
    }
    // local exec used to run locally on the machine where terraform is installed e.g on the machine where the terraform code is run


    // the disk image to use for the instance
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" // or "cos-cloud/cos-stable"
    }
  }
    // the network to which the instance will be connected
  network_interface {
    network = google_compute_network.vpc_network.name // the name of the network to which the instance will be connected
    access_config {
        nat_ip = google_compute_address.ip_address.address // the static ip address to be assigned to the instance
    }
  }
}

 // to create a static ip address 
resource "google_compute_address" "ip_address" {
  name = "terraform-static-ip"
}

# ------------------------------------------------------------------- #

# New resource for the storage bucket our application will use.
resource "google_storage_bucket" "example_bucket" {
  name     = "<UNIQUE-BUCKET-NAME>"
  location = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
# Create a new instance that uses the bucket
resource "google_compute_instance" "another_instance" {
  # Tells Terraform that this VM instance must be created only after the
  # storage bucket has been created.
  depends_on = [google_storage_bucket.example_bucket] // this is used to create the instance only after the bucket has been created
  name         = "terraform-instance-2"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link 
    access_config {
    }
  }
}
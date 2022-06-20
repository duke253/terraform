terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.YC_REGION
}

resource "yandex_compute_instance" "vm-1" {
  name = "te-vm-1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8m0ouka9qmnuauc350"
    }
  }

  network_interface {
    subnet_id = "b0cld3n80ag233h57vnf"
    nat       = true
  }

  metadata = {
    ssh-keys = "duke:${var.SSH_KEY_OPEN}"
  }
}

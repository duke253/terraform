data "yandex_compute_image" "image" {
  family = "astralinux-alce"
}

data "yandex_vpc_subnet" "dmz_subnet" {
  subnet_id = yandex_vpc_subnet.dmz_subnet.id
}

data "yandex_vpc_subnet" "infra_subnet" {
  subnet_id = yandex_vpc_subnet.infra_subnet.id
}

resource "yandex_compute_instance" "vm-1" {
  allow_stopping_for_update = true
  name                      = var.YC_VM1_NAME
  hostname                  = var.YC_VM1_HOSTNAME
  description               = var.YC_VM1_DESCRIPTION
  platform_id               = var.YC_VM1_PLATFORM_ID

  resources {
    cores         = var.YC_VM1_CORES
    core_fraction = var.YC_VM1_CORE_FRACTION
    memory        = var.YC_VM1_MEM
  }

  boot_disk {
    initialize_params {
      image_id   = data.yandex_compute_image.image.id
      block_size = var.YC_VM1_BOOT_DISK_BLOCK_SIZE
      size       = var.YC_VM1_BOOT_DISK_SIZE
      type       = var.YC_VM1_BOOT_DISK_TYPE
    }
  }

  network_interface {
    subnet_id  = data.yandex_vpc_subnet.infra_subnet.id
    ip_address = var.YC_VM1_IPV4_ADDRESS
    nat        = var.YC_VM1_NETWORK_IF_NAT
  }

  scheduling_policy {
    preemptible = var.YC_VM1_PREEMPTIBLE
  }

  metadata = {
    ssh-keys = "astra:${var.SSH_KEY_OPEN}"
  }

}

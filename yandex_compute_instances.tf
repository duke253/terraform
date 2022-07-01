# Receive network and subnets

data "yandex_compute_image" "image" {
  family = "astralinux-alce"
}

data "yandex_vpc_subnet" "dmz_subnet" {
  subnet_id = yandex_vpc_subnet.dmz_subnet.id
}

data "yandex_vpc_subnet" "infra_subnet" {
  subnet_id = yandex_vpc_subnet.infra_subnet.id
}

###################################################
# External static IP address
# For ald-dc-1
resource "yandex_vpc_address" "ext-vpc-address-1" {
  name = "ext-vpc-address-1"
  external_ipv4_address {
    zone_id = var.YC_REGION
  }
}

###################################################
# DNS
resource "yandex_dns_zone" "astradc" {
  name             = "astradc"
  description      = "ald sandbox"
  zone             = "astradc.test."
  public           = false
  private_networks = [yandex_vpc_network.cloud_dc_network.id]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.astradc.id
  name    = "ald-dc-1.astradc.test."
  type    = "A"
  ttl     = 200
  data    = ["10.0.10.10"]
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.astradc.id
  name    = "ald-client-1.astradc.test."
  type    = "A"
  ttl     = 200
  data    = ["10.0.10.100"]
}

###################################################
# VM1 ald-dc-1

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
    subnet_id      = data.yandex_vpc_subnet.infra_subnet.id
    ip_address     = var.YC_VM1_IPV4_ADDRESS
    nat            = var.YC_VM1_NETWORK_IF_NAT
    nat_ip_address = yandex_vpc_address.ext-vpc-address-1.external_ipv4_address[0].address
  }

  scheduling_policy {
    preemptible = var.YC_VM1_PREEMPTIBLE
  }

  metadata = {
    ssh-keys = "astra:${var.SSH_KEY_OPEN}"
  }

}

# VM2 ald-client-1

resource "yandex_compute_instance" "vm-2" {
  allow_stopping_for_update = true
  name                      = var.YC_VM2_NAME
  hostname                  = var.YC_VM2_HOSTNAME
  description               = var.YC_VM2_DESCRIPTION
  platform_id               = var.YC_VM2_PLATFORM_ID

  resources {
    cores         = var.YC_VM2_CORES
    core_fraction = var.YC_VM2_CORE_FRACTION
    memory        = var.YC_VM2_MEM
  }

  boot_disk {
    initialize_params {
      image_id   = data.yandex_compute_image.image.id
      block_size = var.YC_VM2_BOOT_DISK_BLOCK_SIZE
      size       = var.YC_VM2_BOOT_DISK_SIZE
      type       = var.YC_VM2_BOOT_DISK_TYPE
    }
  }

  network_interface {
    subnet_id  = data.yandex_vpc_subnet.infra_subnet.id
    ip_address = var.YC_VM2_IPV4_ADDRESS
    nat        = var.YC_VM2_NETWORK_IF_NAT
  }

  scheduling_policy {
    preemptible = var.YC_VM2_PREEMPTIBLE
  }

  metadata = {
    ssh-keys = "astra:${var.SSH_KEY_OPEN}"
  }

}

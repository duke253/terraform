resource "yandex_vpc_network" "cloud_dc_network" {
  name = var.YC_NETWORK_NAME
}

resource "yandex_vpc_subnet" "dmz_subnet" {
  name           = var.YC_DMZ_SUBNET_NAME
  zone           = var.YC_REGION
  v4_cidr_blocks = ["10.0.0.0/24"]
  network_id     = yandex_vpc_network.cloud_dc_network.id
}

resource "yandex_vpc_subnet" "infra_subnet" {
  name           = var.YC_INFRA_SUBNET_NAME
  zone           = var.YC_REGION
  v4_cidr_blocks = ["10.0.10.0/24"]
  network_id     = yandex_vpc_network.cloud_dc_network.id
}

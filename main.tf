# VM web develop
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
/*resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}*/

resource "yandex_vpc_subnet" "subnet" {
  for_each       = var.vms_vpc_subnet
  name           = each.value.name
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = each.value.v4_cidr_blocks
  route_table_id = yandex_vpc_route_table.dev-rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id = var.folder_id
  name      = var.nat_gateway.develop-nat-nat_gateway.name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "dev-rt" {
  folder_id  = var.folder_id
  name       = var.route_table.develop-stat-route.name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = var.route_table.develop-stat-route.static_route.destination_prefix[0]
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

/*data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}*/

data "yandex_compute_image" "dist" {
  for_each = var.vms_resources
  family   = each.value.family
}

resource "yandex_compute_instance" "platform" {
  for_each    = var.vms_resources
  name        = each.value.name
  platform_id = each.value.platform_id
  zone        = each.value.zone

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.dist[each.key].image_id
    }
  }
  scheduling_policy {
    preemptible = each.value.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet[each.value.subnet_id].id
    nat       = each.value.nat
  }

  metadata = merge(
    var.vms_resources_metadata.metadata,
    {
      ssh-keys = "${each.value.user}:${data.local_file.ssh_auth_yc.content}"
  })

}
# VM web develop db 
#resource "yandex_vpc_network" "develop_db" {
#  name = var.vpc_name_db
#}
/*
resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
}
data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform_db" {
  name        = local.db
  platform_id = var.vm_db_platform_id
  zone        = var.default_zone_db
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = "1"
    ssh-keys           = "${var.vm_db_user}:${data.local_file.ssh_auth_yc.content}"
  }

}
*/
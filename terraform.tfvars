# Config VM
vms_resources = {
  web = {
    name          = "netology-develop-platform-web"
    hostname      = "hw-02-web"
    family        = "ubuntu-2004-lts"
    platform_id   = "standard-v3"
    zone          = "ru-central1-a"
    cores         = 2
    memory        = 1
    core_fraction = 20
    disk_size     = 10
    disk_type     = "network-hdd"
    preemptible   = true
    subnet_id     = "subnet-ru-central1-a"
    nat           = true
  }

  db = {
    name          = "netology-develop-platform-db"
    hostname      = "hw-02-db"
    family        = "ubuntu-2004-lts"
    platform_id   = "standard-v3"
    zone          = "ru-central1-b"
    cores         = 2
    memory        = 2
    core_fraction = 20
    disk_size     = 10
    disk_type     = "network-hdd"
    preemptible   = true
    subnet_id     = "subnet-ru-central1-b"
    nat           = true
  }
}

vms_resources_metadata = {
  all = {
    serial-port-enable = "1"
    ssh-user = "ubuntu"
  }
}

# Config NAT and route table
nat_gateway = {
  develop-nat_gateway = {
    name = "develop-nat-gt"
  }
}

route_table = {
  develop-stat-route = {
    name = "develop-route-table"
    static_route = {
      destination_prefix = ["0.0.0.0/0"]
    }
  }
}

/*
vms_vpc_subnet = {
  subnet-ru-central1-a = {
    name           = "develop-a"
    zone           = "ru-central1-a"
    v4_cidr_blocks = ["10.0.1.0/24"]

  }
  subnet-ru-central1-b = {
    name           = "develop-b"
    zone           = "ru-central1-b"
    v4_cidr_blocks = ["10.0.2.0/24"]
  }
}

nat_gateway = {
  develop-nat-nat_gateway = {
    name = "develop-nat-gt"
  }
}

route_table = {
  develop-stat-route = {
    name = "develop-route-table"
    static_route = {
      destination_prefix = ["0.0.0.0/0"]
    }
  }
}
*/
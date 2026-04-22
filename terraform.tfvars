vms_resources = {
  web = {
    name          = "netology-develop-platform-web"
    user          = "ubuntu"
    family        = "ubuntu-2004-lts"
    platform_id   = "standard-v3"
    zone          = "ru-central1-a"
    cores         = 2
    memory        = 1
    core_fraction = 20
    preemptible   = true
    subnet_id     = "subnet-ru-central1-a"
    nat           = false
  }

  db = {
    name          = "netology-develop-platform-db"
    user          = "ubuntu"
    family        = "ubuntu-2004-lts"
    platform_id   = "standard-v3"
    zone          = "ru-central1-b"
    cores         = 2
    memory        = 2
    core_fraction = 20
    preemptible   = true
    subnet_id     = "subnet-ru-central1-b"
    nat           = false
  }
}

vms_resources_metadata = {
  metadata = {
    serial-port-enable = "1"
  }
}
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

test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
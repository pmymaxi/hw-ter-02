variable "vms_resources" {
  type = map(object({
    name          = string
    user          = string
    family        = string
    platform_id   = string
    zone          = string
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
    subnet_id     = string
    nat           = bool
  }))

}

variable "vms_vpc_subnet" {
  type = map(object({
    name           = string
    zone           = string
    v4_cidr_blocks = list(string)
  }))
}

variable "vms_resources_metadata" {
  type = map(object({
    serial-port-enable = string
  }))
}

variable "nat_gateway" {
  type = map(object({
    name = string
  }))
}

variable "route_table" {
  type = map(object({
    name = string
    #network_id   = string
    static_route = object({
      destination_prefix = list(string)
    })
  }))

}


/*variable "default_zone_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name VM"
}

   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }



variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "memory"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "core_fraction"
}
variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}
variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "nat"
}
variable "vm_db_user" {
  type        = string
  default     = "ubuntu"
  description = "user name for vm"

}
*/

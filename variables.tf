variable "cloud_id" {
  type        = string
  default     = "b1gluchf2t2rb14u5tqt"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1geb21cvurhs2re4ggk"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vpc_name_web" {
  type        = string
  default     = "develop_web"
  description = "VPC network & subnet name"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_web" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

/* 
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name VM"
}
variable "vm_web_hostname" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "hostname VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "memory"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "core_fraction"
}
variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}
variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "nat"
}
variable "vm_web_user" {
  type        = string
  default     = "ubuntu"
  description = "user name for vm"
}
variable "vm_web_serial-port" {
  type        = number
  default     = 1
  description = "serial-port"

}
*/
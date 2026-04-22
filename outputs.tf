output "out_info" {
  value = {
    for name, val in yandex_compute_instance.platform :
    name => {
      name = val.name
      fqdn = val.fqdn
      zone = val.zone
      exIp = val.network_interface[0].nat_ip_address
    }
  }
}

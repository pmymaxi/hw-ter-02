locals {
  vms_ssh_public_root_key = data.local_file.ssh_auth_yc
}

locals {
  vminst = {
    vmweb = yandex_compute_instance.platform["web"]
    vmdb  = yandex_compute_instance.platform["db"]
  }
}

/*locals {
  vminst = {
    for k, valv in var.vms_resources : 
    k => yandex_compute_instance.platform[k]
  }
}*/

/*locals {
  db  = "${var.vm_db_name}_${var.vpc_name_db}"
  web = "${var.vm_web_name}_${var.vpc_name}"
}*/

locals {
  db  = "${var.vms_resources["db"].name}_${var.vms_resources["db"].zone}"
  web = "${var.vms_resources["web"].name}_${var.vms_resources["web"].zone}"
}
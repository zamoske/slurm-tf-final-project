locals {
  prefix = "slurm-"
}

resource "yandex_iam_service_account" "this" {
  name        = "${local.prefix}sa"
  description = "Service account to manage VMs"
  folder_id = var.yc_folder_id
}

resource "yandex_resourcemanager_folder_iam_binding" "this" {
  folder_id = var.yc_folder_id
  role = "editor"
  members = [ 
    "serviceAccount:${yandex_iam_service_account.this.id}", 
    ]
  depends_on = [
     yandex_iam_service_account.this,
   ]
}

output "external_alb_ip" {
  value = yandex_alb_load_balancer.this.listener[0].endpoint[0].address[0].external_ipv4_address[0].address
}

output "vm_public_ip" {
  value = yandex_compute_instance_group.this.instances.*.network_interface.0.nat_ip_address
}

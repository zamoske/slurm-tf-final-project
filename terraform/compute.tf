data "yandex_compute_image" "this" {
  name = "${var.vm_image}-${var.vm_image_tag}"
}

resource "yandex_compute_instance_group" "this" {
    name = "${local.prefix}ig"
    folder_id = var.yc_folder_id
    service_account_id = yandex_iam_service_account.this.id
    deletion_protection = false
    depends_on = [
    yandex_iam_service_account.this,
    yandex_resourcemanager_folder_iam_binding.this,
    yandex_vpc_subnet.this
    ]
    instance_template {
      platform_id = "standard-v1"
      resources {
        cores = var.vm_resources.cores
        memory = var.vm_resources.memory
      }
      boot_disk {
        mode = "READ_WRITE"
        initialize_params {
            image_id = data.yandex_compute_image.this.id
            size = var.vm_resources.disk
        }
      }
      network_interface {
        network_id = yandex_vpc_network.this.id
        subnet_ids = [ for subnet in yandex_vpc_subnet.this: subnet.id ]
        nat = true
      }
      labels = var.labels
      metadata = {
        ssh-keys = "centos:${file(var.public_ssh_key_path)}"
    }
      network_settings {
        type = "STANDARD"
    }
}
    scale_policy {
      fixed_scale {
        size = var.compute_count
      }
    }
    allocation_policy {
      zones = var.zone
    }
    deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }
  application_load_balancer {
    target_group_name = "${local.prefix}tg"
    target_group_description = "Target group in application load balancer"
    target_group_labels = var.labels
  }
}


variable "image_tag" {
    type = number
    default = "1"
}

variable "yc_folder_id" {
    type = string
    default = env("YC_FOLDER_ID")
}

variable "yc_token" {
    type = string
    default = env("YC_TOKEN")
}

source "yandex" "centos" {
    token = var.yc_token
    folder_id = var.yc_folder_id
    image_name = "nginx-${var.image_tag}"
    image_family = "centos-web-server"
    image_description = "Centos image with nginx"
    source_image_family = "centos-7"
    use_ipv4_nat = true
    disk_type = "network-ssd"
    ssh_username = "centos"
}

build {
    sources = ["source.yandex.centos"]
    provisioner "ansible" {
        user = "centos"
        playbook_file = "playbook.yml"
    }
}
variable "vm_name" {
  type = string
  default = "test"
  description = "Name of VM"
}
variable "zone" {
  type = list(string)
  default = [ 
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c" 
]
  description = "Zone for network interface"
}

variable "cidr_blocks" {
  type = list(list(string))
  description = "List of IPv4 cidr blocks for subnet"
}

variable "labels" {
  type = map(string)
  description = "Labels for resources"
}

variable "compute_count" {
  type = number
  description = "Number of virtual machine to create"
}

variable "vm_image" {
  type = string
  description = "Name of vm image"
  default = "nginx"
}

variable "vm_image_tag" {
  type = number
  description = "VM tag number"
  default = 1
}

variable "yc_folder_id" {
  type = string
  description = "folder id for yc"
}

variable "yc_token" {
  type = string
  description = "token id for yc"
}
variable "vm_resources" {
  type = object({
    disk = number
    cores = number
    memory = number
  })
  description = "resoursec for vm"
}

variable "public_ssh_key_path" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

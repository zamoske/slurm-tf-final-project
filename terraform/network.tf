resource "yandex_vpc_network" "this" {
  name = "${local.prefix}test"
}

resource "yandex_vpc_subnet" "this" {
  for_each = toset (var.zone)
  name = "test-${each.value}"
  zone           = each.value
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.cidr_blocks[index(var.zone, each.value)]

  labels = var.labels
}
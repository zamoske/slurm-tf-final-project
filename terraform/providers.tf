terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
  token     = "y0_AgAAAAANPTr-AATuwQAAAADZYfk2i09LDVJvRsO39UgPLX8Ff6Iz5r8"
  cloud_id  = "b1gncohuennqad075k5v"
}
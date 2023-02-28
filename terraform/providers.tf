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
  token     = $YC_TOKEN_ID
  cloud_id  = $YC_CLOUD_ID
}

terraform {
  required_providers {
    phpipam = {
      source = "lord-kyron/phpipam"
      version = "1.2.8"
    }
  }
}

provider "phpipam" {
  app_id   = var.app_id
  endpoint = var.endpoint
  password = var.password
  username = var.username
  insecure = false
}

resource "phpipam_address" "newip" {
  subnet_id   = data.phpipam_subnet.subnet.subnet_id
  ip_address  = data.phpipam_first_free_address.next_address.ip_address
  hostname    = "tf-phpipam.example.internal"
  description = "Managed by Terraform"

  lifecycle {
    ignore_changes = [
      subnet_id,
      ip_address,
    ]
  }
}
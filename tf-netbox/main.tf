terraform {
  required_providers {
    netbox = {
      source = "e-breuninger/netbox"
      version = "0.2.1"
    }
  }
}

provider "netbox" {
    server_url           = var.netbox_server
    api_token            = var.netbox_api_token
    allow_insecure_https = false
}

resource "netbox_available_ip_address" "test" {
  prefix_id = data.netbox_prefix.test.id
  status = "reserved"
  dns_name = "tf-netbox.example.local"
}
module "vault" {
  source = "./tf-vault"
}

module "phpipam" {
    source = "./tf-phpipam"

    app_id = "test"
    endpoint = "http://localhost/api"
    username = module.vault.vault_phpipam.data["username"]
    password = module.vault.vault_phpipam.data["password"]
}

module "netbox" {
  source = "./tf-netbox"

  netbox_server = "http://localhost:8001"
  netbox_api_token = "0123456789abcdef0123456789abcdef01234567"
}

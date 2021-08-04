data "vault_generic_secret" "netbox" {
  path = "openldap/static-cred/netbox"
}

data "http" "netbox_api_token" {
  url = "http://localhost:8001/api/plugins/token/token"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
    Authorization = "Basic ${base64encode("${data.vault_generic_secret.netbox.data["username"]}:${data.vault_generic_secret.netbox.data["password"]}")}"
    X-Expires = "2021-12-31"
  }
}
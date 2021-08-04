provider "vault" {
  skip_tls_verify = true
  token           = var.vault_token
}

resource "vault_generic_secret" "openldap_secret" {
  path = "openldap/static-role/netbox"

  data_json = <<EOT
    {
      "dn": "cn=netbox,ou=users,dc=example,dc=org",
      "username": "netbox",
      "rotation_period": "24h"
    }
    EOT
}

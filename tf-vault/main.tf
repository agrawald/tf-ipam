provider "vault" {
  skip_tls_verify = true
  token           = var.vault_token
}

resource "vault_generic_secret" "openldap_secret" {
  path = "openldap/role/dynamic-role"

  data_json = jsonencode(
    {
      creation_ldif = "${data.template_file.creation_ldif_tpl.rendered}}",
      deletion_ldif = "${data.template_file.deletion_ldif_tpl.rendered}",
      rollback_ldif = "${data.template_file.rollback_ldif_tpl.rendered}",
      username_template = "netbox_svc_acc_{{random 5}}",
      default_ttl = "1h",
      max_ttl = "24h"
  })
}



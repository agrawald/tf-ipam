# data "vault_generic_secret" "phpipam" {
#   path = "secret/phpipam"
# }

data "template_file" "creation_ldif_tpl" {
  template  = "${file("${path.module}/templates/creation.ldif")}"
}

data "template_file" "deletion_ldif_tpl" {
  template  = "${file("${path.module}/templates/deletion.ldif")}"
}

data "template_file" "rollback_ldif_tpl" {
  template  = "${file("${path.module}/templates/rollback.ldif")}"
}
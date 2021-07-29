output "new_ip" {
  value = data.phpipam_first_free_address.next_address.ip_address
}
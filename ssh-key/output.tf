output "public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
}

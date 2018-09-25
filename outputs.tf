output "private ip openvpn" {
  value = "${digitalocean_droplet.openvpn.*.ipv4_address_private}"
}

output "public ip openvpn" {
  value = "${digitalocean_droplet.openvpn.*.ipv4_address}"
}
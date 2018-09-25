output "private ip openvpn" {
  value = "${digitalocean_droplet.openvpn.*.ipv4_address_private}"
}

output "public ip openvpn" {
  value = "${digitalocean_droplet.openvpn.*.ipv4_address}"
}

output "private ip dns" {
  value = "${digitalocean_droplet.dns.*.ipv4_address_private}"
}

output "public ip dns" {
  value = "${digitalocean_droplet.dns.*.ipv4_address}"
}

output "private ip zabbix" {
  value = "${digitalocean_droplet.zabbix.*.ipv4_address_private}"
}

output "public ip zabbix" {
  value = "${digitalocean_droplet.zabbix.*.ipv4_address}"
}

output "private ip gitlab" {
  value = "${digitalocean_droplet.gitlab.*.ipv4_address_private}"
}

output "public ip gitlab" {
  value = "${digitalocean_droplet.gitlab.*.ipv4_address}"
}
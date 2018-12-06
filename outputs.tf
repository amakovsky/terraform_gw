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

output "private ip gitlab-runner" {
  value = "${digitalocean_droplet.gitlab-runner.*.ipv4_address_private}"
}

output "public ip gitlab-runner" {
  value = "${digitalocean_droplet.gitlab-runner.*.ipv4_address}"
}

output "private ip redis" {
  value = "${digitalocean_droplet.redis.*.ipv4_address_private}"
}

output "public ip redis" {
  value = "${digitalocean_droplet.redis.*.ipv4_address}"
}

output "private ip cassandra" {
  value = "${digitalocean_droplet.cassandra.*.ipv4_address_private}"
}

output "public ip cassandra" {
  value = "${digitalocean_droplet.cassandra.*.ipv4_address}"
}

output "private ip postgresql-master" {
  value = "${digitalocean_droplet.postgresql-master.*.ipv4_address_private}"
}

output "public ip postgresql-master" {
  value = "${digitalocean_droplet.postgresql-master.*.ipv4_address}"
}

output "private ip postgresql-slave" {
  value = "${digitalocean_droplet.postgresql-slave.*.ipv4_address_private}"
}

output "public ip postgresql-slave" {
  value = "${digitalocean_droplet.postgresql-slave.*.ipv4_address}"
}

output "public ip radius" {
  value = "${digitalocean_droplet.radius.*.ipv4_address}"
}

output "private ip radius" {
  value = "${digitalocean_droplet.radius.*.ipv4_address_private}"
}

output "public ip softether" {
  value = "${digitalocean_droplet.softether.*.ipv4_address}"
}

output "private ip softether" {
  value = "${digitalocean_droplet.softether.*.ipv4_address_private}"
}

output "public ip asterisk" {
  value = "${digitalocean_droplet.asterisk.*.ipv4_address}"
}

output "private ip asterisk" {
  value = "${digitalocean_droplet.asterisk.*.ipv4_address_private}"
}

output "public ip web" {
  value = "${digitalocean_droplet.web.*.ipv4_address}"
}

output "private ip web" {
  value = "${digitalocean_droplet.web.*.ipv4_address_private}"
}

output "public ip test" {
  value = "${digitalocean_droplet.test.*.ipv4_address}"
}

output "private ip test" {
  value = "${digitalocean_droplet.test.*.ipv4_address_private}"
}

output "public ip nodejs" {
  value = "${digitalocean_droplet.nodejs.*.ipv4_address}"
}

output "private ip nodejs" {
  value = "${digitalocean_droplet.nodejs.*.ipv4_address_private}"
}

output "public ip web_data" {
  value = "${digitalocean_droplet.web-data.*.ipv4_address}"
}

output "private ip web_data" {
  value = "${digitalocean_droplet.web-data.*.ipv4_address_private}"
}

output "public ip stage" {
  value = "${digitalocean_droplet.stage.*.ipv4_address}"
}

output "private ip stage" {
  value = "${digitalocean_droplet.stage.*.ipv4_address_private}"
}

output "public ip elk" {
  value = "${digitalocean_droplet.elk.*.ipv4_address}"
}

output "private ip elk" {
  value = "${digitalocean_droplet.elk.*.ipv4_address_private}"
}

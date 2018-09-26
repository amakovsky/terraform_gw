resource "digitalocean_firewall" "openvpn" {
  name = "openvpn"
  tags = ["${digitalocean_tag.openvpn.id}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "udp"
      port_range       = "1194"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "gitlab" {
  name = "gitlab"
  tags = ["${digitalocean_tag.gitlab.id}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "private" {
  name = "private"
  tags = ["${digitalocean_tag.private.id}"]
}

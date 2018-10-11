resource "digitalocean_firewall" "all" {
  name = "all"
  tags = ["${digitalocean_tag.all.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "10050"
      source_tags = ["${digitalocean_tag.zabbix.id}"]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "icmp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

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
    {
      protocol    = "tcp"
      port_range  = "10050"
      source_tags = ["${digitalocean_tag.zabbix.id}"]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "icmp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
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
    {
      protocol    = "tcp"
      port_range  = "2222"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.runner.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "443"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.runner.id}"]
    },
    {
      protocol   = "tcp"
      port_range = "10050"

      #      source_addresses = ["${digitalocean_tag.zabbix.id}"]
      source_tags = ["${digitalocean_tag.zabbix.id}"]
    },
  ]
}

resource "digitalocean_firewall" "private" {
  name = "private"
  tags = ["${digitalocean_tag.private.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "22"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

resource "digitalocean_firewall" "dns" {
  name = "dns"
  tags = ["${digitalocean_tag.dns.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "22"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
    {
      protocol         = "tcp"
      port_range       = "53"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "udp"
      port_range       = "53"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "postgresql" {
  name = "postgresql"
  tags = ["${digitalocean_tag.postgresql.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "22"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
    {
      protocol         = "tcp"
      port_range       = "5432"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "icmp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

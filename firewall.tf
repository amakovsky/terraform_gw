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
      port_range  = "53"
      source_tags = ["${digitalocean_tag.all.id}", "${digitalocean_tag.zabbix.id}"]
    },
    {
      protocol    = "udp"
      port_range  = "53"
      source_tags = ["${digitalocean_tag.all.id}", "${digitalocean_tag.zabbix.id}"]
    },
  ]
}

resource "digitalocean_firewall" "postgresql" {
  name = "postgresql"
  tags = ["${digitalocean_tag.postgresql.id}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "5432"
      source_addresses = ["0.0.0.0/0", "::/0"]
      source_tags      = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

resource "digitalocean_firewall" "zabbix" {
  name = "zabbix"
  tags = ["${digitalocean_tag.zabbix.id}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "10051"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.all.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "443"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

resource "digitalocean_firewall" "redis" {
  name = "redis"
  tags = ["${digitalocean_tag.redis.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "6379"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.redis.id}", "${digitalocean_tag.web.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "26379"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.redis.id}", "${digitalocean_tag.web.id}"]
    },
  ]
}

resource "digitalocean_firewall" "cassandra" {
  name = "cassandra"
  tags = ["${digitalocean_tag.cassandra.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "7000"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.cassandra.id}", "${digitalocean_tag.web.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "9042"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.cassandra.id}", "${digitalocean_tag.web.id}"]
    },
  ]
}

resource "digitalocean_firewall" "asterisk" {
  name = "asterisk"
  tags = ["${digitalocean_tag.asterisk.id}"]

  inbound_rule = [
    {
      protocol         = "udp"
      port_range       = "5060"
      source_addresses = ["0.0.0.0/0", "::/0"]
      source_tags      = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

resource "digitalocean_firewall" "radius" {
  name = "radius"
  tags = ["${digitalocean_tag.radius.id}"]

  inbound_rule = [
    {
      protocol         = "udp"
      port_range       = "1-65535"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}
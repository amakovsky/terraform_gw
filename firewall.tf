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
      protocol         = "icmp"
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
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.runner.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      source_tags = ["${digitalocean_tag.all.id}"]
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol    = "tcp"
      port_range  = "443"
      source_tags = ["${digitalocean_tag.all.id}"]
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol    = "tcp"
      port_range  = "5001"
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
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.runner.id}"]
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
      source_tags      = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.postgresql.id}"]
    },
    {
      protocol    = "icmp"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.postgresql.id}", "${digitalocean_tag.zabbix.id}"]
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
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.redis.id}", "${digitalocean_tag.web.id}", "${digitalocean_tag.all.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "26379"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.redis.id}", "${digitalocean_tag.web.id}", "${digitalocean_tag.web-data.id}"]
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
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.cassandra.id}", "${digitalocean_tag.web.id}", "${digitalocean_tag.web-data.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "9042"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.cassandra.id}", "${digitalocean_tag.web.id}", "${digitalocean_tag.web-data.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "7199"
      source_tags = ["${digitalocean_tag.zabbix.id}"]
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

resource "digitalocean_firewall" "softether" {
  name = "softether"
  tags = ["${digitalocean_tag.softether.id}"]

  inbound_rule = [
    {
      protocol         = "udp"
      port_range       = "500"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "udp"
      port_range       = "4500"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "udp"
      port_range       = "1701"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

resource "digitalocean_firewall" "web" {
  name = "web"
  tags = ["${digitalocean_tag.web.id}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol    = "tcp"
      port_range  = "22"
      source_tags = ["${digitalocean_tag.web.id}", "${digitalocean_tag.runner.id}"]
    },
  ]
}

resource "digitalocean_firewall" "web-data" {
  name = "web-data"
  tags = ["${digitalocean_tag.web-data.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "22"
      source_tags = ["${digitalocean_tag.runner.id}"]
    },
  ]
}

resource "digitalocean_firewall" "stage" {
  name = "stage"
  tags = ["${digitalocean_tag.stage.id}"]

  inbound_rule = [
    {
      //    {
      //      protocol         = "udp"
      //      port_range       = "1-65535"
      //      source_addresses = ["0.0.0.0/0", "::/0"]
      //    },
      //    {
      //      protocol         = "tcp"
      //      port_range       = "1-65535"
      //      source_addresses = ["0.0.0.0/0", "::/0"]
      //    },
      protocol = "tcp"

      port_range  = "9200"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}", "${digitalocean_tag.test.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "5432"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}", "${digitalocean_tag.test.id}", "${digitalocean_tag.web.name}"]
    },
    {
      protocol    = "tcp"
      port_range  = "5601"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}", "${digitalocean_tag.test.id}"]
    },
    {
      protocol    = "udp"
      port_range  = "37008"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}", "${digitalocean_tag.test.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "5044"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "test" {
  name = "test"
  tags = ["${digitalocean_tag.test.id}"]

  inbound_rule = [
    {
      protocol         = "udp"
      port_range       = "1-65535"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "1-65535"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_firewall" "elk" {
  name = "elk"
  tags = ["${digitalocean_tag.elk.id}"]

  inbound_rule = [
    {
      protocol    = "tcp"
      port_range  = "9200"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}", "${digitalocean_tag.elk.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "5601"
      source_tags = ["${digitalocean_tag.openvpn.id}", "${digitalocean_tag.softether.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "5044"
      source_tags = ["${digitalocean_tag.all.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "9300"
      source_tags = ["${digitalocean_tag.elk.id}"]
    },
    {
      protocol    = "tcp"
      port_range  = "80"
      source_tags = ["${digitalocean_tag.openvpn.id}"]
    },
  ]
}

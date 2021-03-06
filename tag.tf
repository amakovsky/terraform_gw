resource "digitalocean_tag" "redis" {
  name = "redis"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "private" {
  name = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "openvpn" {
  name = "openvpn"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "dns" {
  name = "dns"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "zabbix" {
  name = "zabbix"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "gitlab" {
  name = "gitlab"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "cassandra" {
  name = "cassandra"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "postgresql" {
  name = "postgresql"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "radius" {
  name = "radius"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "softether" {
  name = "softether"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "asterisk" {
  name = "asterisk"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "web" {
  name = "web"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "web-data" {
  name = "web-data"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "runner" {
  name = "runner"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "all" {
  name = "all"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "stage" {
  name = "stage"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "test" {
  name = "test"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "elk" {
  name = "elk"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_tag" "spark" {
  name = "spark"

  lifecycle {
    prevent_destroy = true
  }
}

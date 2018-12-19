//resource "digitalocean_domain" "krispykreme" {
//  name       = "krispykreme.gettwifi.com"
//  ip_address = "${digitalocean_droplet.nodejs.ipv4_address}"
//}

resource "digitalocean_domain" "gettwifi" {
  name = "gettwifi.com"
}

resource "digitalocean_record" "krispykreme" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "krispykreme"
  value  = "${digitalocean_droplet.nodejs.ipv4_address}"
}

resource "digitalocean_record" "hub1" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "hub1"
  value  = "${digitalocean_droplet.softether.0.ipv4_address}"
}

resource "digitalocean_record" "hub2" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "hub2"
  value  = "${digitalocean_droplet.softether.1.ipv4_address}"
}

resource "digitalocean_record" "hub3" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "hub3"
  value  = "${digitalocean_droplet.softether.2.ipv4_address}"
}

resource "digitalocean_record" "app" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "appnew"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "auth" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "authnew"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "lk" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "lknew"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "cp" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "cpnew"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "fetch" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "fetchnew"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "gitlab" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "gitlab"
  value  = "${digitalocean_droplet.gitlab.ipv4_address}"
}

resource "digitalocean_record" "test" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "test"
  value  = "${digitalocean_droplet.nodejs.ipv4_address}"
}

resource "digitalocean_record" "camera" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "camera"
  value  = "${digitalocean_droplet.nodejs.ipv4_address}"
}

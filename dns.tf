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

resource "digitalocean_record" "app" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "app"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "auth" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "app"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "lk" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "app"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

resource "digitalocean_record" "cp" {
  domain = "${digitalocean_domain.gettwifi.name}"
  type   = "A"
  name   = "app"
  value  = "${digitalocean_loadbalancer.web.ip}"
}

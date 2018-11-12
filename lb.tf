resource "digitalocean_certificate" "cert" {
  name              = "gettwifi.com"
  type              = "custom"
  private_key       = "${file("gettwifi.com/private.key")}"
  leaf_certificate  = "${file("gettwifi.com/certificate.crt")}"
  certificate_chain = "${file("gettwifi.com/chain.crt")}"
}

resource "digitalocean_loadbalancer" "web" {
  name                   = "web"
  region                 = "${var.main_region}"
  redirect_http_to_https = true

  forwarding_rule = [
    {
      entry_port     = 80
      entry_protocol = "http"

      target_port     = 80
      target_protocol = "http"
    },
    {
      entry_port     = 443
      entry_protocol = "https"

      target_port     = 80
      target_protocol = "http"

      certificate_id = "${digitalocean_certificate.cert.id}"
    },
  ]

  healthcheck {
    port     = 80
    protocol = "http"
    path     = "/"
  }

  droplet_ids = ["${digitalocean_droplet.web.*.id}"]
}

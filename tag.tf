resource "digitalocean_tag" "redis" {
  name = "redis"
}

resource "digitalocean_tag" "openvpn" {
  name = "openvpn"

  lifecycle {
      prevent_destroy = true
    }
}
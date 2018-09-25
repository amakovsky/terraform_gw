resource "digitalocean_droplet" "openvpn" {
  image              = "${var.main_image}"
  name               = "openvpn${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.openvpn.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_config")}"


  count =  "${var.openvpn_count}"
  lifecycle {
    prevent_destroy = true
  }
}
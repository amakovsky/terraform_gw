variable "my_key_public" {}
variable "my_key_private" {}
variable "do_token" {}

variable "main_image" {
  default = "ubuntu-18-04-x64"
}

variable "main_region" {
  default = "fra1"
}

variable "openvpn_count" {
  default = 1
}
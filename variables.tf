variable "my_key_public" {
  default = ""
}
variable "my_key_private" {
  default = ""
}
variable "do_token" {
  default = ""
}

variable "main_image" {
  default = "ubuntu-18-04-x64"
}

variable "main_region" {
  default = "fra1"
}

variable "openvpn_count" {
  default = 1
}

variable "dns_count" {
  default = 1
}

variable "redis_count" {
  default = 3
}

variable "cassandra_count" {
  default = 3
}

variable "radius_count" {
  default = 2
}

variable "softether_count" {
  default = 2
}

variable "web_count" {
  default = 2
}

variable "runner_count" {
  default = 1
}

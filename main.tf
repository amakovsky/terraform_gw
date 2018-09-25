resource "digitalocean_droplet" "openvpn" {
  image              = "${var.main_image}"
  name               = "openvpn${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.openvpn.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.openvpn_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "dns" {
  image              = "${var.main_image}"
  name               = "ns${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.dns.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.dns_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "zabbix" {
  image              = "${var.main_image}"
  name               = "zabbix.gw.lan"
  region             = "${var.main_region}"
  size               = "2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.zabbix.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "gitlab" {
  image              = "${var.main_image}"
  name               = "gitlab.gettwifi.com"
  region             = "${var.main_region}"
  size               = "4gb"
  private_networking = true
  tags               = ["${digitalocean_tag.gitlab.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/gitlab_cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "gitlab-runner" {
  image              = "${var.main_image}"
  name               = "runner${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.runner.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.runner_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "redis" {
  image              = "${var.main_image}"
  name               = "redis${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.redis.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.redis_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "cassandra" {
  image              = "${var.main_image}"
  name               = "cassandra${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.cassandra.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.cassandra_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "postgresql-master" {
  image              = "${var.main_image}"
  name               = "db-master.gw.lan"
  region             = "${var.main_region}"
  size               = "2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.postgresql.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "postgresql-slave" {
  image              = "${var.main_image}"
  name               = "db-slave.gw.lan"
  region             = "${var.main_region}"
  size               = "2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.postgresql.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "radius" {
  image              = "${var.main_image}"
  name               = "radius${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.radius.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.radius_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "softether" {
  image              = "${var.main_image}"
  name               = "softether${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.softether.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.softether_count}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "asterisk" {
  image              = "${var.main_image}"
  name               = "asterisk.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.asterisk.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "web" {
  image              = "${var.main_image}"
  name               = "web${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.web.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"


  count =  "${var.web_count}"
  lifecycle {
    prevent_destroy = true
  }
}
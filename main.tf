resource "digitalocean_droplet" "openvpn" {
  image              = "${var.main_image}"
  name               = "openvpn${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-1vcpu-1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.openvpn.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count = "${var.openvpn_count}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "dns" {
  image              = "${var.main_image}"
  name               = "ns${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-1vcpu-1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.dns.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count = "${var.dns_count}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "zabbix" {
  image              = "ubuntu-18-04-x64"
  name               = "zabbix.gw.lan"
  region             = "${var.main_region}"
  size               = "s-1vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.zabbix.name}", "${digitalocean_tag.all.name}", "${digitalocean_tag.private.name}"]
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
  size               = "s-2vcpu-4gb"
  private_networking = true
  tags               = ["${digitalocean_tag.gitlab.name}", "${digitalocean_tag.all.name}"]
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
  size               = "s-2vcpu-4gb"
  private_networking = true
  tags               = ["${digitalocean_tag.runner.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}", "${digitalocean_tag.web.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"
  resize_disk = true
  count = "${var.runner_count}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "redis" {
  image              = "${var.main_image}"
  name               = "redis${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-2vcpu-4gb"
  private_networking = true
  tags               = ["${digitalocean_tag.redis.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count       = "${var.redis_count}"
  resize_disk = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "cassandra" {
  image              = "${var.main_image}"
  name               = "cassandra${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-4vcpu-8gb"
  private_networking = true
  tags               = ["${digitalocean_tag.cassandra.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count = "${var.cassandra_count}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "postgresql-master" {
  image              = "${var.main_image}"
  name               = "db-master.gw.lan"
  region             = "${var.main_region}"
  size               = "s-2vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.postgresql.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
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
  size               = "s-2vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.postgresql.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "radius" {
  image              = "ubuntu-16-04-x64"
  name               = "radius${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-1vcpu-1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.radius.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count       = "${var.radius_count}"
  resize_disk = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "softether" {
  image              = "ubuntu-18-04-x64"
  name               = "softether${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-2vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.softether.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count       = "${var.softether_count}"
  resize_disk = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_droplet" "asterisk" {
  image              = "ubuntu-18-04-x64"
  name               = "asterisk.gw.lan"
  region             = "${var.main_region}"
  size               = "s-1vcpu-1gb"
  private_networking = true
  tags               = ["${digitalocean_tag.asterisk.name}", "${digitalocean_tag.all.name}", "${digitalocean_tag.private.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"
  resize_disk        = false

  lifecycle {
    prevent_destroy = true
  }
}

//resource "digitalocean_droplet" "web" {
//  image              = "${var.main_image}"
//  name               = "web${count.index + 1}.gw.lan"
//  region             = "${var.main_region}"
//  size               = "s-2vcpu-4gb"
//  private_networking = true
//  tags               = ["${digitalocean_tag.web.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
//  ssh_keys           = ["${var.my_key_public}", "${var.vlad_key_public}"]
//  user_data          = "${file("cloud_init/cloud_config")}"
//  resize_disk        = false
//  count              = "${var.web_count}"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//}

resource "digitalocean_droplet" "web-data" {
  image              = "ubuntu-18-04-x64"
  name               = "web-data${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-6vcpu-16gb"
  private_networking = true
  tags               = ["${digitalocean_tag.web-data.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"
  resize_disk        = false
  count              = "${var.web_data_count}"

  lifecycle {
    prevent_destroy = true
  }
}

//resource "digitalocean_droplet" "nodejs" {
//  image              = "40248606"
//  name               = "nodejs-stage.gw.lan"
//  region             = "${var.main_region}"
//  size               = "s-2vcpu-2gb"
//  private_networking = true
//  tags               = ["${digitalocean_tag.web.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
//  ssh_keys           = ["${var.my_key_public}", "${var.vlad_key_public}"]
//  user_data          = "${file("cloud_init/cloud_config")}"
//  resize_disk        = false
//  count              = "${var.nodejs_count}"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//}

resource "digitalocean_droplet" "js" {
  image              = "ubuntu-18-04-x64"
  name               = "js${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-2vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.web.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"
  resize_disk        = false
  count              = "${var.js_count}"

  lifecycle {
    prevent_destroy = true
  }
}

//resource "digitalocean_droplet" "stage" {
//  image              = "40248606"
//  name               = "stage${count.index + 1}.gw.lan"
//  region             = "${var.main_region}"
//  size               = "s-2vcpu-4gb"
//  private_networking = true
//  tags               = ["${digitalocean_tag.stage.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
//  ssh_keys           = ["${var.my_key_public}"]
//  user_data          = "${file("cloud_init/cloud_config")}"
//
//  count = "${var.stage_count}"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//}

//resource "digitalocean_droplet" "test" {
//  image              = "ubuntu-18-04-x64"
//  name               = "test${count.index + 1}.gw.lan"
//  region             = "${var.main_region}"
//  size               = "s-1vcpu-2gb"
//  private_networking = true
//  tags               = ["${digitalocean_tag.test.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
//  ssh_keys           = ["${var.my_key_public}"]
//  user_data          = "${file("cloud_init/cloud_config")}"
//
//  count = "${var.test_count}"
//
//  lifecycle {
//    #    prevent_destroy = true
//  }
//}

//resource "digitalocean_droplet" "elk" {
//  image              = "40248606"
//  name               = "elk${count.index + 1}.gw.lan"
//  region             = "${var.main_region}"
//  size               = "s-1vcpu-3gb"
//  private_networking = true
//  tags               = ["${digitalocean_tag.elk.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
//  ssh_keys           = ["${var.my_key_public}"]
//  user_data          = "${file("cloud_init/cloud_config")}"
//
//  count = "${var.elk_count}"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//}

resource "digitalocean_droplet" "spark" {
  image              = "ubuntu-18-04-x64"
  name               = "spark${count.index + 1}.gw.lan"
  region             = "${var.main_region}"
  size               = "s-2vcpu-2gb"
  private_networking = true
  tags               = ["${digitalocean_tag.spark.name}", "${digitalocean_tag.private.name}", "${digitalocean_tag.all.name}"]
  ssh_keys           = ["${var.my_key_public}"]
  user_data          = "${file("cloud_init/cloud_config")}"

  count = "${var.spark_count}"

  lifecycle {
    prevent_destroy = true
  }
}
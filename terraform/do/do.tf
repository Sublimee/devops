terraform {
  required_version = "~> 1.0.10"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    aws          = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = var.do_ssh_key_name
}

resource "digitalocean_droplet" "droplet" {
  name     = var.do_droplet_name
  image    = var.do_droplet_image
  size     = var.do_droplet_size
  region   = var.do_droplet_region
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
  connection {
    user        = var.do_droplet_connection_user
    type        = var.do_droplet_connection_type
    private_key = file(var.do_ssh_private_key_path)
  }
}

resource "local_file" "ansible_inventory" {
  content  = yamlencode(
  {
    all : {
      hosts : {
       (local.droplet_ip): {
         ansible_ssh_private_key_file : var.do_ssh_private_key_path,
         domain_name: local.domain_name,
         letsencrypt_email: local.email
       }
      }
    }
  }
  )
  filename = "hosts"
}

locals {
  droplet_ip = digitalocean_droplet.droplet.ipv4_address
  domain_name = "${var.prefix}.${var.dns_zone}"
  email = "${var.username}@${local.domain_name}"
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.dns.zone_id
  name    = local.domain_name
  type    = "A"
  ttl     = "60"
  records = [local.droplet_ip]
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_route53_zone" "dns" {
  name = "${var.dns_zone}."
}

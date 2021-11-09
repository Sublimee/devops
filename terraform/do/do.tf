terraform {
  required_version = "~> 1.0.10"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform-key" {
  name = var.do_ssh_key_name
}

resource "digitalocean_droplet" "droplet" {
  name     = var.do_droplet_name
  image    = var.do_droplet_image
  size     = var.do_droplet_size
  region   = var.do_droplet_region
  ssh_keys = [data.digitalocean_ssh_key.terraform-key.id]
  connection {
    user        = var.do_droplet_connection_user
    type        = var.do_droplet_connection_type
    private_key = file(var.do_ssh_private_key_path)
  }
}
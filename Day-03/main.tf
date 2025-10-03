terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token-day-3
}

resource "digitalocean_droplet" "shaku-don" {
  image   = var.image-value
  size    = var.size-value
  name    = var.name-value
  region  = var.region-value
  backups = false
}

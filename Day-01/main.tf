terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {
  description = "Digital Ocean PAT"
  type        = string
  sensitive   = true
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "payla-payla-droplet" {
  image   = "ubuntu-22-04-x64"
  name    = "payla-payla-droplet"
  region  = "blr1"
  size    = "s-1vcpu-1gb"
  tags    = ["web", "test"]
  backups = false
}
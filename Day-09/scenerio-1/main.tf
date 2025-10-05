terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "test-droplet" {
  backups           = false
  droplet_agent     = null
  graceful_shutdown = null
  image             = "ubuntu-25-04-x64"
  ipv6              = false
  ipv6_address      = null
  monitoring        = true
  name              = "ubuntu-s"
  region            = "sfo2"
  resize_disk       = true
  size              = "s-1vcpu-2gb-70gb-intel"
  ssh_keys          = null
  tags              = []
  user_data         = null
  volume_ids        = []
  vpc_uuid          = "2e501f6b-65dd-467d-9cbd-e1549150431c"
}
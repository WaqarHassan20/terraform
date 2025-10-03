terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

module "shaku-module" {
  source         = "./modules/do-droplet"
  name-value     = "shaku-module-machine"
  region-value   = "blr1"
  size-value     = "s-1vcpu-1gb"
  image-value    = "ubuntu-22-04-x64"
  do_token-day-4 = "YOUR_DIGITALOCEAN_TOKEN_HERE"
}

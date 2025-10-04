terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "chanda-bucket"
    key    = "testing/terraform.tfstate"
    region = "us-east-1"
    endpoints = {
      s3 = "https://blr1.digitaloceanspaces.com"
    }
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}


module "shaku-module" {
  source        = "./modules/do-droplet-5"
  name-value    = "shaku-5-droplet"
  region-value  = "blr1"
  size-value    = "s-1vcpu-1gb"
  image-value   = "ubuntu-22-04-x64"
  do_token_day5 = "YOUR_DIGITALOCEAN_TOKEN_HERE"
}

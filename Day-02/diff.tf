// CODE COMPARISON OF AWS AND DIGITAL OCEAN
// THIS IS ONLY FOR THE CREATION OF VM OR DROPLET

// When creating something using the service of Amazon

provider "aws" {
  alias  = "some-name"
  region = "some-region"
}

resource "aws_instance" "name-of-instance" {
  ami           = "your-ami-value"
  instance_type = "your-type-name"
  provider      = aws.some-name
}


// When creating something using the service of Digital Ocean

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "DO_token" {
  description = "Digital Ocean PAT"
  type        = string
  sensitive   = true
}

provider "digitalocean" {
  token = var.DO_token
}

resource "digitalocean_droplet" "name-of-droplet" {
  image  = "ubuntu-22-04-x64"
  name   = "name-of-droplet"
  region = "name-of-region-available"
  size   = "size-with-specs"
}
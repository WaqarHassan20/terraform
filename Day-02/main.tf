provider "aws" {
  alias  = "eu-west-4"
  region = "eu-west-4"
}

provider "aws" {
  alias  = "eu-east-5"
  region = "eu-east-5"
}

resource "aws_instance" "virtual-machine-1" {
  ami           = "1234567890abcdefghijklmnopqrstuvwxyz"
  provider      = aws.eu-west-4
  instance_type = "t2.micro"
}

resource "aws_instance" "virtual-machine-2" {
  ami           = "1234567890abcdefghijklmnopqrstuvwxyz"
  provider      = aws.eu-east-5
  instance_type = "t2.micro"
}

# ================================================== #

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "digitalocean_token" {
  description = "Digital Ocean PAT"
  type        = string
  sensitive   = true
}

provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_droplet" "bappaJani-ka-droplet" {
  name    = "bappaJani-ka-droplet"
  image   = "ubuntu-22-04-x64"
  tags    = ["madni-machine"]
  size    = "s-1vcpu-1gb"
  region  = "blr1"
  backups = false

}

output "server_ip" {
  description = "This gives the value of IP address of droplet"
  value       = digitalocean_droplet.bappaJani-ka-droplet
}

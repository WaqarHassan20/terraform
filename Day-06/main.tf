terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "chanda-bucket"
    key    = "py-app/terraform.tfstate"
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


resource "digitalocean_droplet" "python_droplet" {
  name     = "python-droplet"
  region   = "blr1"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-22-04-x64"
  ssh_keys = [digitalocean_ssh_key.py_key.fingerprint]


  provisioner "file" {
    source      = "app.py"
    destination = "/root/app.py"
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/home/waqar-hassan/.ssh/py_key")
      host        = self.ipv4_address
    }
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from Droplet!'",
      "apt-get update --fix-missing -y",
      "DEBIAN_FRONTEND=noninteractive apt-get upgrade -y",
      "apt-get install -y software-properties-common",
      "apt-get install -y python3 python3-pip python3-venv",
      "pip3 install --upgrade pip",
      "pip3 install flask",
      "nohup python3 /root/app.py > app.log 2>&1 &"
    ]
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/home/waqar-hassan/.ssh/py_key")
      host        = self.ipv4_address
    }
  }
}

resource "digitalocean_ssh_key" "py_key" {
  name       = "py_key"
  public_key = file("/home/waqar-hassan/.ssh/py_key.pub")
}

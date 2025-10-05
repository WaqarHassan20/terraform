terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Vault provider
provider "vault" {
  address          = "http://134.209.157.4:8200"
  skip_child_token = true
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}


# Fetch secret from Vault KV v2
// we use the data word to get any resource
data "vault_kv_secret_v2" "testing-secret" {
  mount = "kv"
  name  = "testing-secret"
}
// here the data word is deprecated for digitalocean now,
// rather they use now ephemeral keyword instead of data


# Droplet creation on digital ocean
// we use the resource word to create any resource
resource "digitalocean_droplet" "vault-droplet" {
  image   = "ubuntu-22-04-x64"
  name    = "username-${data.vault_kv_secret_v2.testing-secret.data["username"]}"
  size    = "s-1vcpu-1gb"
  backups = false
  region  = "blr1"
}

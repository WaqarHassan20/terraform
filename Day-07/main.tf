terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

}

// Changing the names of droplet for each workspace again and again 
// is not a good practice, so make tfvars file for each workspace
// e.g stage.tfvars, prod.tfvars, dev.tfvars 

module "workspace-module" {
  source         = "./modules/do-workspace"
  name-value     = var.droplet-name
  region-value   = "blr1"
  size-value     = "s-1vcpu-1gb"
  image-value    = "ubuntu-22-04-x64"
  do_token_day_7 = "YOUR_DIGITAL_OCEAN_TOKEN_HERE"
}

// for the dynamic value of name of droplet for each workspace,
// use the values stored in the tfvars file of each workspace.
// e.g for stage workspace , we'll use the commands as :

### `terraform plan -var-file=stage.tfvars -out=infra.out`
### `terraform apply -var-file=stage.tfvars infra.out`

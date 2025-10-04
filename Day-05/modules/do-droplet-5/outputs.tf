output "droplet_ip" {
  value = digitalocean_droplet.shaku-2-droplet.ipv4_address
}

output "droplet_name" {
  value = digitalocean_droplet.shaku-2-droplet.name
}

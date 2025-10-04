output "ip-address" {
  description = "IP Address of droplet created"
  value       = digitalocean_droplet.workspaces-droplet.ipv4_address

}

output "droplet-name" {
  description = "Name of droplet created"
  value       = digitalocean_droplet.workspaces-droplet.name
}

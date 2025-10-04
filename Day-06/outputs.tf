output "ip-address" {
  description = "Getting IP address to access the VM"
  value       = digitalocean_droplet.python_droplet.ipv4_address
}
output "droplet-name" {
  description = "Getting name of droplet"
  value       = digitalocean_droplet.python_droplet.name

}

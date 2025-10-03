output "IP-address" {
  description = "Getting IP address to access the VM"
  value       = digitalocean_droplet.shaku-module-machine.ipv4_address
}

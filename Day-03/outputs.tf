output "IP-address" {
  description = "Getting IP address to access the VM"
  value       = digitalocean_droplet.shaku-don.ipv4_address
}

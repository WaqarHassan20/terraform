output "ip-address" {
  description = "Getting IP address to access the VM"
  value       = module.shaku-module.droplet_ip
}
output "droplet-name" {
  description = "Getting name of droplet"
  value       = module.shaku-module.droplet_name

}

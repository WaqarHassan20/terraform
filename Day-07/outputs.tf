output "ip-address" {
  description = "Getting IP address to access the VM"
  value       = module.workspace-module.ip-address
}
output "droplet-name" {
  description = "Getting name of droplet"
  value       = module.workspace-module.droplet-name

}
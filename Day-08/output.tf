output "ip-address" {
  description = "Getting IP address to access the VM"
  value       = digitalocean_droplet.vault-droplet.ipv4_address
  sensitive   = true
}

output "droplet-name" {
  description = "Getting name of droplet"
  value       = digitalocean_droplet.vault-droplet.name
  sensitive   = true
}

# Output secret values
output "testing_demo_data" {
  description = "Full secret data from Vault (KV v2)"
  value       = data.vault_kv_secret_v2.testing-secret.data
  sensitive   = true
}

output "testing_demo_message" {
  description = "Single key 'message' from the secret"
  value       = data.vault_kv_secret_v2.testing-secret.data["username"]
  sensitive   = true
}

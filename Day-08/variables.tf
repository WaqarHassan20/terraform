variable "do_token_day_8" {
  description = "Digital Ocean PAT value"
  type        = string
  sensitive   = true
}

variable "vault_role_id" {
  description = "Vault app role-id"
  type        = string
  sensitive   = true
}

variable "vault_secret_id" {
  description = "Vault secret-id"
  type        = string
  sensitive   = true
}

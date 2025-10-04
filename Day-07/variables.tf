variable "do_token_day_7" {
  description = "Digital Ocean PAT value"
  type        = string
  sensitive   = true
}

variable "droplet-name" {
  description = "Name of droplet according to prod, dev and stage environment"
  type        = string
}

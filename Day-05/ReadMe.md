# Terraform Remote State with DigitalOcean Spaces

## 📌 Overview
This project shows how to use **DigitalOcean Spaces** as a remote backend for Terraform state files.  

By default, Terraform examples rely on **AWS S3 + DynamoDB**:
- **S3** → stores the state file (`terraform.tfstate`)  
- **DynamoDB** → handles **state locking** to prevent conflicts in teams  

DigitalOcean Spaces is **S3-compatible**, but it does **not** have DynamoDB. This creates a challenge when using Terraform for team workflows.

---

## ❌ Problem
- Terraform tries to use **DynamoDB** when you set up remote state with S3.  
- DigitalOcean does not provide DynamoDB (or any equivalent database service).  
- Result → You can store the state file in Spaces, but **locking is missing**.  
- This is fine if you are a **solo developer**, but dangerous for **teams** (two people applying changes at the same time may break state).

---

## ✅ Solution
- Use **DigitalOcean Spaces** for the state file.  
- Ignore locking if you are **solo** (safe).  
- For **teams**, use an **external locking mechanism**, such as:
  - Consul
  - etcd
  - Terragrunt with locking
  - CI/CD pipeline enforcement (only one pipeline runs `terraform apply` at a time)

---

## ⚙️ Configuration Example

### `main.tf`
```hcl
terraform {
  backend "s3" {
    endpoint   = "https://blr1.digitaloceanspaces.com"
    bucket     = "my-terraform-state"
    key        = "project/terraform.tfstate"
    region     = "us-east-1" # dummy region (required by AWS provider)

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

provider "aws" {
  access_key = var.do_space_access_key
  secret_key = var.do_space_secret_key
  region     = "us-east-1"
}
